import FWCore.ParameterSet.Config as cms

process = cms.Process( "TEST" )
#process.options = cms.untracked.PSet(wantSummary = cms.untracked.bool(True))
process.options = cms.untracked.PSet(wantSummary = cms.untracked.bool(True),allowUnscheduled=cms.untracked.bool(True))
#,
#				     SkipEvent = cms.untracked.vstring('ProductNotFound'))
filterMode = False # True                
 
######## Sequence settings ##########
corrJetsOnTheFly = True
runOnMC  = True
runOnSig = True
DOHLTFILTERS = True
#useJSON = not (runOnMC)
#JSONfile = 'Cert_246908-258750_13TeV_PromptReco_Collisions15_25ns_JSON.txt'
#****************************************************************************************************#

#process.load('Configuration/StandardSequences/FrontierConditions_GlobalTag_cff')
process.load('Configuration.StandardSequences.GeometryRecoDB_cff')
process.load('Configuration/StandardSequences/FrontierConditions_GlobalTag_condDBv2_cff')
from Configuration.AlCa.GlobalTag import GlobalTag
if runOnMC:
   process.GlobalTag.globaltag = '94X_mcRun2_asymptotic_v3'#'MCRUN2_74_V9::All'
   #process.GlobalTag.globaltag = '94X_mc2017_realistic_v14'#'MCRUN2_74_V9::All'
elif not(runOnMC):
   process.GlobalTag.globaltag = '94X_dataRun2_v10'

hltFiltersProcessName = 'RECO'
if runOnMC:
   hltFiltersProcessName = 'PAT' #'RECO'

#if DOHLTFILTERS and not(runOnMC):
process.load('CommonTools.RecoAlgos.HBHENoiseFilterResultProducer_cfi')
process.HBHENoiseFilterResultProducer.minZeros = cms.int32(99999)
process.HBHENoiseFilterResultProducer.IgnoreTS4TS5ifJetInLowBVRegion=cms.bool(False)
process.HBHENoiseFilterResultProducer.defaultDecision = cms.string("HBHENoiseFilterResultRun2Loose")

process.ApplyBaselineHBHENoiseFilter = cms.EDFilter('BooleanFlagFilter',
                                                    inputLabel = cms.InputTag('HBHENoiseFilterResultProducer','HBHENoiseFilterResult'),
                                                    reverseDecision = cms.bool(False)
                                                    )
process.ApplyBaselineHBHEIsoNoiseFilter = cms.EDFilter('BooleanFlagFilter',
                                                       inputLabel = cms.InputTag('HBHENoiseFilterResultProducer','HBHEIsoNoiseFilterResult'),
                                                       reverseDecision = cms.bool(False)
                                                       )

######### read JSON file for data ##########					                                                             
'''if not(runOnMC) and useJSON:

  import FWCore.PythonUtilities.LumiList as LumiList
  import FWCore.ParameterSet.Types as CfgTypes
  process.source.lumisToProcess = CfgTypes.untracked(CfgTypes.VLuminosityBlockRange())
  myLumis = LumiList.LumiList(filename = JSONfile).getCMSSWString().split(',')
  process.source.lumisToProcess.extend(myLumis) 
'''

# ---------------------------------------------------------
# DeepAK8: set up TransientTrackBuilder
process.load('Configuration.StandardSequences.MagneticField_cff')
process.TransientTrackBuilderESProducer = cms.ESProducer("TransientTrackBuilderESProducer",
    ComponentName=cms.string('TransientTrackBuilder')
)
# ---------------------------------------------------------



option = 'RECO'

process.load("ExoDiBosonResonances.EDBRCommon.goodMuons_cff")
process.load("ExoDiBosonResonances.EDBRCommon.goodElectrons_cff")
process.load("ExoDiBosonResonances.EDBRCommon.goodJets_cff")
process.load("ExoDiBosonResonances.EDBRCommon.leptonicW_cff")
process.load("ExoDiBosonResonances.EDBRCommon.hadronicW_cff")
process.load("ExoDiBosonResonances.EDBRCommon.goodPuppi_cff")

from JMEAnalysis.JetToolbox.jetToolbox_cff import jetToolbox
JETCorrLevels = ['L2Relative', 'L3Absolute', 'L2L3Residual']
jetToolbox(process, 'ak8', 'dummySeqAK8', 'noOutput',
           PUMethod='Puppi', JETCorrPayload='AK8PFPuppi', JETCorrLevels=JETCorrLevels,
           Cut='pt > 170.0 && abs(rapidity()) < 2.4',
           miniAOD=True, runOnMC=runOnMC,
           addSoftDrop=True, addNsub=True,addSoftDropSubjets=True, subJETCorrPayload='AK4PFPuppi', subJETCorrLevels=JETCorrLevels   # must add soft-drop
)

from PhysicsTools.PatAlgos.tools.jetTools import updateJetCollection
from RecoBTag.MXNet.pfDeepBoostedJet_cff import _pfDeepBoostedJetTagsProbs,_pfDeepBoostedJetTagsMetaDiscrs,_pfMassDecorrelatedDeepBoostedJetTagsProbs,_pfMassDecorrelatedDeepBoostedJetTagsMetaDiscrs
updateJetCollection(
    process,
    jetSource=cms.InputTag('packedPatJetsAK8PFPuppiSoftDrop'),
    pvSource = cms.InputTag('offlineSlimmedPrimaryVertices'),
    svSource = cms.InputTag('slimmedSecondaryVertices'),
    rParam=0.8,
    jetCorrections = ('AK8PFPuppi', cms.vstring(['L2Relative', 'L3Absolute', 'L2L3Residual']), 'None'),
    btagDiscriminators = _pfDeepBoostedJetTagsProbs + _pfDeepBoostedJetTagsMetaDiscrs+_pfMassDecorrelatedDeepBoostedJetTagsProbs + _pfMassDecorrelatedDeepBoostedJetTagsMetaDiscrs,
    postfix='AK8WithPuppiDaughters',   # !!! postfix must contain "WithPuppiDaughter" !!!
    printWarning = False
)
if option == 'RECO':
    process.goodMuons.src = "slimmedMuons"
    process.goodElectrons.src = "slimmedElectrons"
    process.goodJets.src = "slimmedJetsAK8"
#    process.goodJets.src = "selectedPatJetsAK8"
    process.Wtoenu.MET  = "slimmedMETs"
    process.Wtomunu.MET = "slimmedMETs"
    process.goodPuppi.src = "selectedUpdatedPatJetsAK8WithPuppiDaughters"

process.goodOfflinePrimaryVertex = cms.EDFilter("VertexSelector",
                                       src = cms.InputTag("offlineSlimmedPrimaryVertices"),
                                       cut = cms.string("chi2!=0 && ndof >= 4.0 && abs(z) <= 24.0 && abs(position.Rho) <= 2.0"),
                                       filter = cms.bool(True)
                                       )
if option == 'RECO':
    process.hadronicV.cut = ' '
if option == 'GEN':
    process.hadronicV.cut = ' '
WBOSONCUT = "pt > 200.0"

process.leptonicVSelector = cms.EDFilter("CandViewSelector",
                                       src = cms.InputTag("leptonicV"),
                                       cut = cms.string( WBOSONCUT ),
                                       filter = cms.bool(True)
                                       )
process.leptonicVFilter = cms.EDFilter("CandViewCountFilter",
                                       src = cms.InputTag("leptonicV"),
                                       minNumber = cms.uint32(1),
                                       filter = cms.bool(True)
                                       )
process.hadronicVFilter = cms.EDFilter("CandViewCountFilter",
                                       src = cms.InputTag("hadronicV"),
                                       minNumber = cms.uint32(1),
                                       filter = cms.bool(True)
                                       )
process.graviton = cms.EDProducer("CandViewCombiner",
                                       decay = cms.string("leptonicV hadronicV"),
                                       checkCharge = cms.bool(False),
                                       cut = cms.string("mass > 180"),
                                       roles = cms.vstring('leptonicV', 'hadronicV'),
                                       )
process.gravitonFilter =  cms.EDFilter("CandViewCountFilter",
                                       src = cms.InputTag("graviton"),
                                       minNumber = cms.uint32(1),
                                       filter = cms.bool(True)
                                       )
from PhysicsTools.SelectorUtils.tools.vid_id_tools import *
switchOnVIDElectronIdProducer(process, DataFormat.MiniAOD)
my_id_modules = ['RecoEgamma.ElectronIdentification.Identification.heepElectronID_HEEPV70_cff']
for idmod in my_id_modules:
    setupAllVIDIdsInModule(process,idmod,setupVIDElectronSelection)

process.leptonSequence = cms.Sequence(process.muSequence +
                                      process.egmGsfElectronIDSequence*process.eleSequence +
                                      process.leptonicVSequence +
                                      process.leptonicVSelector +
                                      process.leptonicVFilter )

process.jetSequence = cms.Sequence(
                                   process.fatJetsSequence +
                                   process.fatPuppiSequence+
				   process.hadronicV +
                                   process.hadronicVFilter)

process.gravitonSequence = cms.Sequence(process.graviton +
                                        process.gravitonFilter)


if filterMode == False:
    process.goodOfflinePrimaryVertex.filter = False
    process.Wtomunu.cut = ''
    process.Wtoenu.cut = ''
    process.leptonicVSelector.filter = False
    process.leptonicVSelector.cut = ''
    process.hadronicV.cut = ''
    process.graviton.cut = ''
    process.leptonicVFilter.minNumber = 0
    process.hadronicVFilter.minNumber = 0
    process.gravitonFilter.minNumber = 0

process.load('RecoMET.METFilters.BadPFMuonFilter_cfi')
process.load("RecoMET.METFilters.BadChargedCandidateFilter_cfi")
process.BadPFMuonFilter.muons = cms.InputTag("slimmedMuons")
process.BadPFMuonFilter.PFCandidates = cms.InputTag("packedPFCandidates")
process.BadChargedCandidateFilter.muons = cms.InputTag("slimmedMuons")
process.BadChargedCandidateFilter.PFCandidates = cms.InputTag("packedPFCandidates")
process.metfilterSequence = cms.Sequence(process.BadPFMuonFilter+process.BadChargedCandidateFilter)

######### JEC ########
METS = "slimmedMETs"
jetsAK8 = "slimmedJetsAK8"
jetsAK8pruned = "slimmedJetsAK8"
jetsAK8softdrop = "slimmedJetsAK8"
jetsAK8puppi = "cleanPuppi"
 
if runOnMC:
   jecLevelsAK8chs = [
                                   'Summer16_07Aug2017_V11_MC_L1FastJet_AK8PFchs.txt',
                                   'Summer16_07Aug2017_V11_MC_L2Relative_AK8PFchs.txt',
                                   'Summer16_07Aug2017_V11_MC_L3Absolute_AK8PFchs.txt'
     ]
   jecLevelsAK8chsGroomed = [
                                   'Summer16_07Aug2017_V11_MC_L2Relative_AK8PFchs.txt',
                                   'Summer16_07Aug2017_V11_MC_L3Absolute_AK8PFchs.txt'
     ]
   jecLevelsAK8puppi = [
                                   'Summer16_07Aug2017_V11_MC_L1FastJet_AK8PFPuppi.txt',
                                   'Summer16_07Aug2017_V11_MC_L2Relative_AK8PFPuppi.txt',
                                   'Summer16_07Aug2017_V11_MC_L3Absolute_AK8PFPuppi.txt'
     ]
   jecLevelsAK8puppiGroomed = [
                                   'Summer16_07Aug2017_V11_MC_L2Relative_AK8PFPuppi.txt',
                                   'Summer16_07Aug2017_V11_MC_L3Absolute_AK8PFPuppi.txt'
     ]
   BjecLevelsAK4chs = [
                                   'Summer16_07Aug2017_V11_MC_L1FastJet_AK4PFPuppi.txt',
                                   'Summer16_07Aug2017_V11_MC_L2Relative_AK4PFPuppi.txt',
                                   'Summer16_07Aug2017_V11_MC_L3Absolute_AK4PFPuppi.txt'
     ]
   jecLevelsAK4chs = [
                                   'Summer16_07Aug2017_V11_MC_L1FastJet_AK4PFchs.txt',
                                   'Summer16_07Aug2017_V11_MC_L2Relative_AK4PFchs.txt',
                                   'Summer16_07Aug2017_V11_MC_L3Absolute_AK4PFchs.txt'
    ]
else:
   jecLevelsAK8chs = [
                                   'Summer16_23Sep2016BCDV4_DATA_L1FastJet_AK8PFchs.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2Relative_AK8PFchs.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L3Absolute_AK8PFchs.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2L3Residual_AK8PFchs.txt'
     ]
   jecLevelsAK8chsGroomed = [
                                   'Summer16_23Sep2016BCDV4_DATA_L2Relative_AK8PFchs.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L3Absolute_AK8PFchs.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2L3Residual_AK8PFchs.txt'
     ]
   jecLevelsAK8puppi = [
                                   'Summer16_23Sep2016BCDV4_DATA_L1FastJet_AK8PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2Relative_AK8PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L3Absolute_AK8PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2L3Residual_AK8PFPuppi.txt'
     ]
   jecLevelsAK8puppiGroomed = [
                                   'Summer16_23Sep2016BCDV4_DATA_L2Relative_AK8PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L3Absolute_AK8PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2L3Residual_AK8PFPuppi.txt'
     ]
   BjecLevelsAK4chs = [
                                   'Summer16_23Sep2016BCDV4_DATA_L1FastJet_AK4PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2Relative_AK4PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L3Absolute_AK4PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2L3Residual_AK4PFPuppi.txt'

     ]
   jecLevelsAK4chs = [
                                   'Summer16_23Sep2016BCDV4_DATA_L1FastJet_AK4PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2Relative_AK4PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L3Absolute_AK4PFPuppi.txt',
                                   'Summer16_23Sep2016BCDV4_DATA_L2L3Residual_AK4PFPuppi.txt'
     ]
# L1 prefiring
process.prefiringweight = cms.EDProducer("L1ECALPrefiringWeightProducer",
                                 ThePhotons = cms.InputTag("slimmedPhotons"),
                                 TheJets = cms.InputTag("slimmedJets"),
#                                L1Maps = cms.string(relBase+"/src/L1Prefiring/EventWeightProducer/files/L1PrefiringMaps_new.root"),
                                # L1Maps = cms.string("L1PrefiringMaps_new.root"), # update this line with the location of this file
                                L1Maps = cms.string("L1PrefiringMaps_new.root"),
                                 DataEra = cms.string("2016BtoH"), #Use 2016BtoH for 2016
                                 UseJetEMPt = cms.bool(False), #can be set to true to use jet prefiring maps parametrized vs pt(em) instead of pt
                                 PrefiringRateSystematicUncty = cms.double(0.2) #Minimum relative prefiring uncty per object
                                 )
process.treeDumper = cms.EDAnalyzer("EDBRTreeMaker",
                                    originalNEvents = cms.int32(1),
                                    crossSectionPb = cms.double(1),
                                    targetLumiInvPb = cms.double(1.0),
                                    EDBRChannel = cms.string("VW_CHANNEL"),
                                    lhe =  cms.InputTag("externalLHEProducer"),
                                    isGen = cms.bool(False),
                                    isJEC = cms.bool(corrJetsOnTheFly),
                                    RunOnMC  = cms.bool(runOnMC),
                                    RunOnSig = cms.bool(runOnSig),
                                    generator =  cms.InputTag("generator"),
                                    genSrc =  cms.InputTag("prunedGenParticles"),
                                    pileup  =   cms.InputTag("slimmedAddPileupInfo"),
                                    leptonicVSrc = cms.InputTag("leptonicV"),
                                    gravitonSrc = cms.InputTag("graviton"),
                                    looseMuonSrc = cms.InputTag("looseMuons"),
                                    looseElectronSrc = cms.InputTag("looseElectrons"),
                                    goodMuSrc = cms.InputTag("goodMuons"),
                                    MuSrc = cms.InputTag("slimmedMuons"),
                                    EleSrc = cms.InputTag("slimmedElectrons"),
                                    t1muSrc = cms.InputTag("slimmedMuons"),
                                    metSrc = cms.InputTag("slimmedMETs"),
                                    mets = cms.InputTag(METS),
                                    #ak4jetsSrc = cms.InputTag("cleanAK4Jets"), 
                                    ak4jetsSrc = cms.InputTag("cleanPuppiAK4"), 
                                    hadronicVSrc = cms.InputTag("hadronicV"),
                                    hadronicVSrc_raw = cms.InputTag("slimmedJetsAK8"),
                                    hadronicVSoftDropSrc = cms.InputTag("selectedPatJetsAK8SoftDropPacked"),
                                    jets = cms.InputTag("slimmedJets"),
                                    fatjets = cms.InputTag(jetsAK8),
                                    ak8JetSrc = cms.InputTag(jetsAK8),
                                    prunedjets = cms.InputTag(jetsAK8pruned),
                                    softdropjets = cms.InputTag(jetsAK8softdrop),
                                    puppijets = cms.InputTag(jetsAK8puppi),
                                    #puppijets = cms.InputTag("selectedUpdatedPatJetsAK8WithPuppiDaughters"),
                                    jecAK8chsPayloadNames = cms.vstring( jecLevelsAK8chs ),
                                    jecAK8chsPayloadNamesGroomed = cms.vstring( jecLevelsAK8chsGroomed ),
                                    jecAK4chsPayloadNames = cms.vstring( jecLevelsAK4chs ),
                                    BjecAK4chsPayloadNames = cms.vstring( BjecLevelsAK4chs ),
					
                                    jecAK8puppiPayloadNames = cms.vstring( jecLevelsAK8puppi ),
                                    jecAK8puppiPayloadNamesGroomed = cms.vstring( jecLevelsAK8puppiGroomed ),
                                    jecpath = cms.string(''),
                                    rho = cms.InputTag("fixedGridRhoFastjetAll"),
                                    electronIDs = cms.InputTag("heepElectronID-HEEPV50-CSA14-25ns"),
                                    muons = cms.InputTag("slimmedMuons"),
                                    vertices = cms.InputTag("offlineSlimmedPrimaryVertices"),
                                    hltToken    = cms.InputTag("TriggerResults","","HLT"),
                                    elPaths1     = cms.vstring("HLT_PFMETNoMu110_PFMHTNoMu110_IDTight*"),#EXO-15-002
                                    elPaths2     = cms.vstring("HLT_Ele27_eta2p1_WP75_Gsf_v*", "HLT_Ele27_eta2p1_WPLoose_Gsf_v*"), #B2G-15-005
                                    elPaths3     = cms.vstring("HLT_Ele45_WPLoose_Gsf_v*"),
                                    elPaths4     = cms.vstring("HLT_Ele115_CaloIdVT_GsfTrkIdT_v*"),#("HLT_Ele35_WPLoose_Gsf_v*"),
                                    elPaths5     = cms.vstring("HLT_Ele40_WPTight_Gsf_v*"),#("HLT_Ele35_WPLoose_Gsf_v*"),
                                    #elPaths5     = cms.vstring("HLT_Ele25_WPTight_Gsf_v*"),
                                    elPaths6     = cms.vstring("HLT_Ele38_WPTight_Gsf_v*"),#("HLT_Ele25_eta2p1_WPLoose_Gsf_v*"),
                                    elPaths7     = cms.vstring("HLT_AK8PFHT700_TrimR0p1PT0p03Mass50_v*"),#("HLT_Ele25_eta2p1_WPTight_Gsf_v*"),
                                    elPaths8     = cms.vstring("HLT_Ele27_WPTight_Gsf_v*"),
                                    muPaths1     = cms.vstring("HLT_PFHT650_WideJetMJJ900DEtaJJ1p5_v*"),#EXO-15-002
                                    muPaths2     = cms.vstring("HLT_Mu50_v*"), #B2G-15-005
                                    muPaths3     = cms.vstring("HLT_TkMu50_v*"), #B2G-15-005
                                    muPaths4     = cms.vstring("HLT_Mu16_eta2p1_MET30_v*", "HLT_IsoMu16_eta2p1_MET30_v*"), #MET
                                    muPaths5     = cms.vstring("HLT_PFHT800_v*"), #MET
                                    muPaths6     = cms.vstring("HLT_PFHT900_v*"),
                                    muPaths7     = cms.vstring("HLT_PFJet450_v*"),
                                    muPaths8     = cms.vstring("HLT_PFJet500_v*"),
                                    muPaths9     = cms.vstring("HLT_AK8PFJet450_v*"),
                                    muPaths10     = cms.vstring("HLT_AK8PFJet500_v*"),
                                    muPaths11     = cms.vstring("HLT_AK8PFJet360_TrimMass30_v*"),#e1,MET110,e7,m1,m5-m11,HLT_hadronic
                                    muPaths12     = cms.vstring("HLT_PFMETNoMu120_PFMHTNoMu120_IDTight_v*"),
                                    noiseFilter = cms.InputTag('TriggerResults','', hltFiltersProcessName),
                                    noiseFilterSelection_HBHENoiseFilter = cms.string('Flag_HBHENoiseFilter'),
                                    noiseFilterSelection_HBHENoiseIsoFilter = cms.string("Flag_HBHENoiseIsoFilter"),
                                    noiseFilterSelection_GlobalTightHaloFilter = cms.string('Flag_globalTightHalo2016Filter'),
                                    noiseFilterSelection_EcalDeadCellTriggerPrimitiveFilter = cms.string('Flag_EcalDeadCellTriggerPrimitiveFilter'),
                                    noiseFilterSelection_goodVertices = cms.string('Flag_goodVertices'),
                                    noiseFilterSelection_eeBadScFilter = cms.string('Flag_eeBadScFilter'),
                                    noiseFilterSelection_badMuon = cms.InputTag('BadPFMuonFilter'),
                                    noiseFilterSelection_badChargedHadron = cms.InputTag('BadChargedCandidateFilter'),
                                    )


if option=='GEN':
    process.treeDumper.metSrc = 'genMetTrue'
    process.treeDumper.isGen  = True
 

process.analysis = cms.Path(process.leptonSequence +
                            #process.substructureSequence+
                            #process.redoPatJets+
                            #process.redoPrunedPatJets+
                            #process.redoSoftDropPatJets+
                            process.HBHENoiseFilterResultProducer+
                            process.ApplyBaselineHBHENoiseFilter+
                            process.ApplyBaselineHBHEIsoNoiseFilter+
                            process.jetSequence +
                            process.metfilterSequence +
                            process.gravitonSequence +
                            process.prefiringweight*process.treeDumper)

if option=='RECO':
    process.analysis.replace(process.leptonSequence, process.goodOfflinePrimaryVertex + process.leptonSequence)

process.load("ExoDiBosonResonances.EDBRCommon.data.RSGravitonToWW_kMpl01_M_1000_Tune4C_13TeV_pythia8")
#process.source.inputCommands = ['keep *','drop *_isolatedTracks_*_*']
process.source.fileNames = [
'/store/mc/RunIISummer16MiniAODv3/WkkToWRadionToWWW_M3000-R0-5_13TeV-madgraph-herwigpp/MINIAODSIM/PUMoriond17_94X_mcRun2_asymptotic_v3-v1/100000/025496C5-E823-EA11-B2C2-001E67A40514.root'
]

process.maxEvents.input = 100
process.load("FWCore.MessageLogger.MessageLogger_cfi")
process.MessageLogger.cerr.FwkReport.reportEvery = 1000000
process.MessageLogger.cerr.FwkReport.limit = 99999999

process.TFileService = cms.Service("TFileService",
                                   fileName = cms.string("RStreeEDBR_pickup.root")
                                   )
