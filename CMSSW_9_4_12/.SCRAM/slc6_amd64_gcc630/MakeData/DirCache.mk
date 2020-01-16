ifeq ($(strip $(JMEAnalysisJetToolboxAuto)),)
JMEAnalysisJetToolboxAuto := self/src/JMEAnalysis/JetToolbox/plugins
PLUGINS:=yes
JMEAnalysisJetToolboxAuto_files := $(patsubst src/JMEAnalysis/JetToolbox/plugins/%,%,$(wildcard $(foreach dir,src/JMEAnalysis/JetToolbox/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
JMEAnalysisJetToolboxAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/JMEAnalysis/JetToolbox/plugins/BuildFile
JMEAnalysisJetToolboxAuto_LOC_USE := self  FWCore/Framework FWCore/ParameterSet root boost DataFormats/Candidate DataFormats/JetReco DataFormats/PatCandidates DataFormats/StdDictionaries DataFormats/WrappedStdDictionaries SimDataFormats/GeneratorProducts FWCore/ServiceRegistry CommonTools/Utils CommonTools/UtilAlgos CondFormats/JetMETObjects
JMEAnalysisJetToolboxAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,JMEAnalysisJetToolboxAuto,JMEAnalysisJetToolboxAuto,$(SCRAMSTORENAME_LIB),src/JMEAnalysis/JetToolbox/plugins))
JMEAnalysisJetToolboxAuto_PACKAGE := self/src/JMEAnalysis/JetToolbox/plugins
ALL_PRODS += JMEAnalysisJetToolboxAuto
JMEAnalysis/JetToolbox_forbigobj+=JMEAnalysisJetToolboxAuto
JMEAnalysisJetToolboxAuto_INIT_FUNC        += $$(eval $$(call Library,JMEAnalysisJetToolboxAuto,src/JMEAnalysis/JetToolbox/plugins,src_JMEAnalysis_JetToolbox_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
JMEAnalysisJetToolboxAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,JMEAnalysisJetToolboxAuto,src/JMEAnalysis/JetToolbox/plugins))
endif
ALL_COMMONRULES += src_JMEAnalysis_JetToolbox_plugins
src_JMEAnalysis_JetToolbox_plugins_parent := JMEAnalysis/JetToolbox
src_JMEAnalysis_JetToolbox_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JMEAnalysis_JetToolbox_plugins,src/JMEAnalysis/JetToolbox/plugins,PLUGINS))
ifeq ($(strip $(ExoDiBosonResonancesEDBRCommonAuto)),)
ExoDiBosonResonancesEDBRCommonAuto := self/src/ExoDiBosonResonances/EDBRCommon/plugins
PLUGINS:=yes
ExoDiBosonResonancesEDBRCommonAuto_files := $(patsubst src/ExoDiBosonResonances/EDBRCommon/plugins/%,%,$(wildcard $(foreach dir,src/ExoDiBosonResonances/EDBRCommon/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
ExoDiBosonResonancesEDBRCommonAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/ExoDiBosonResonances/EDBRCommon/plugins/BuildFile
ExoDiBosonResonancesEDBRCommonAuto_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities CommonTools/UtilAlgos DataFormats/Common DataFormats/MuonReco DataFormats/EgammaCandidates DataFormats/PatCandidates RecoEgamma/EgammaTools RecoEcal/EgammaCoreTools DataFormats/Candidate DataFormats/Math root
ExoDiBosonResonancesEDBRCommonAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,ExoDiBosonResonancesEDBRCommonAuto,ExoDiBosonResonancesEDBRCommonAuto,$(SCRAMSTORENAME_LIB),src/ExoDiBosonResonances/EDBRCommon/plugins))
ExoDiBosonResonancesEDBRCommonAuto_PACKAGE := self/src/ExoDiBosonResonances/EDBRCommon/plugins
ALL_PRODS += ExoDiBosonResonancesEDBRCommonAuto
ExoDiBosonResonances/EDBRCommon_forbigobj+=ExoDiBosonResonancesEDBRCommonAuto
ExoDiBosonResonancesEDBRCommonAuto_INIT_FUNC        += $$(eval $$(call Library,ExoDiBosonResonancesEDBRCommonAuto,src/ExoDiBosonResonances/EDBRCommon/plugins,src_ExoDiBosonResonances_EDBRCommon_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
ExoDiBosonResonancesEDBRCommonAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,ExoDiBosonResonancesEDBRCommonAuto,src/ExoDiBosonResonances/EDBRCommon/plugins))
endif
ALL_COMMONRULES += src_ExoDiBosonResonances_EDBRCommon_plugins
src_ExoDiBosonResonances_EDBRCommon_plugins_parent := ExoDiBosonResonances/EDBRCommon
src_ExoDiBosonResonances_EDBRCommon_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_ExoDiBosonResonances_EDBRCommon_plugins,src/ExoDiBosonResonances/EDBRCommon/plugins,PLUGINS))
ifeq ($(strip $(ExoDiBosonResonancesEDBRTreeMakerAuto)),)
ExoDiBosonResonancesEDBRTreeMakerAuto := self/src/ExoDiBosonResonances/EDBRTreeMaker/plugins
PLUGINS:=yes
ExoDiBosonResonancesEDBRTreeMakerAuto_files := $(patsubst src/ExoDiBosonResonances/EDBRTreeMaker/plugins/%,%,$(wildcard $(foreach dir,src/ExoDiBosonResonances/EDBRTreeMaker/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
ExoDiBosonResonancesEDBRTreeMakerAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/ExoDiBosonResonances/EDBRTreeMaker/plugins/BuildFile
ExoDiBosonResonancesEDBRTreeMakerAuto_LOC_USE := self  boost FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities CommonTools/UtilAlgos DataFormats/Common DataFormats/Candidate DataFormats/PatCandidates DataFormats/Math DataFormats/HepMCCandidate CondFormats/JetMETObjects JetMETCorrections/Objects HLTrigger/HLTcore PhysicsTools/PatUtils PhysicsTools/PatExamples PhysicsTools/PatAlgos SimDataFormats/JetMatching AnalysisDataFormats/TopObjects root NNKit/FatJetNN
ExoDiBosonResonancesEDBRTreeMakerAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,ExoDiBosonResonancesEDBRTreeMakerAuto,ExoDiBosonResonancesEDBRTreeMakerAuto,$(SCRAMSTORENAME_LIB),src/ExoDiBosonResonances/EDBRTreeMaker/plugins))
ExoDiBosonResonancesEDBRTreeMakerAuto_PACKAGE := self/src/ExoDiBosonResonances/EDBRTreeMaker/plugins
ALL_PRODS += ExoDiBosonResonancesEDBRTreeMakerAuto
ExoDiBosonResonances/EDBRTreeMaker_forbigobj+=ExoDiBosonResonancesEDBRTreeMakerAuto
ExoDiBosonResonancesEDBRTreeMakerAuto_INIT_FUNC        += $$(eval $$(call Library,ExoDiBosonResonancesEDBRTreeMakerAuto,src/ExoDiBosonResonances/EDBRTreeMaker/plugins,src_ExoDiBosonResonances_EDBRTreeMaker_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
ExoDiBosonResonancesEDBRTreeMakerAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,ExoDiBosonResonancesEDBRTreeMakerAuto,src/ExoDiBosonResonances/EDBRTreeMaker/plugins))
endif
ALL_COMMONRULES += src_ExoDiBosonResonances_EDBRTreeMaker_plugins
src_ExoDiBosonResonances_EDBRTreeMaker_plugins_parent := ExoDiBosonResonances/EDBRTreeMaker
src_ExoDiBosonResonances_EDBRTreeMaker_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_ExoDiBosonResonances_EDBRTreeMaker_plugins,src/ExoDiBosonResonances/EDBRTreeMaker/plugins,PLUGINS))
ifeq ($(strip $(ExoDiBosonResonancesEDBRWLeptonicProducerAuto)),)
ExoDiBosonResonancesEDBRWLeptonicProducerAuto := self/src/ExoDiBosonResonances/EDBRWLeptonicProducer/plugins
PLUGINS:=yes
ExoDiBosonResonancesEDBRWLeptonicProducerAuto_files := $(patsubst src/ExoDiBosonResonances/EDBRWLeptonicProducer/plugins/%,%,$(wildcard $(foreach dir,src/ExoDiBosonResonances/EDBRWLeptonicProducer/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
ExoDiBosonResonancesEDBRWLeptonicProducerAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/ExoDiBosonResonances/EDBRWLeptonicProducer/plugins/BuildFile
ExoDiBosonResonancesEDBRWLeptonicProducerAuto_LOC_USE := self  boost FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/Candidate CommonTools/CandUtils CommonTools/Utils DataFormats/PatCandidates CondFormats/JetMETObjects JetMETCorrections/Objects SimDataFormats/JetMatching DataFormats/Common DataFormats/Math DataFormats/HepMCCandidate PhysicsTools/PatUtils PhysicsTools/PatExamples AnalysisDataFormats/TopObjects root
ExoDiBosonResonancesEDBRWLeptonicProducerAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,ExoDiBosonResonancesEDBRWLeptonicProducerAuto,ExoDiBosonResonancesEDBRWLeptonicProducerAuto,$(SCRAMSTORENAME_LIB),src/ExoDiBosonResonances/EDBRWLeptonicProducer/plugins))
ExoDiBosonResonancesEDBRWLeptonicProducerAuto_PACKAGE := self/src/ExoDiBosonResonances/EDBRWLeptonicProducer/plugins
ALL_PRODS += ExoDiBosonResonancesEDBRWLeptonicProducerAuto
ExoDiBosonResonances/EDBRWLeptonicProducer_forbigobj+=ExoDiBosonResonancesEDBRWLeptonicProducerAuto
ExoDiBosonResonancesEDBRWLeptonicProducerAuto_INIT_FUNC        += $$(eval $$(call Library,ExoDiBosonResonancesEDBRWLeptonicProducerAuto,src/ExoDiBosonResonances/EDBRWLeptonicProducer/plugins,src_ExoDiBosonResonances_EDBRWLeptonicProducer_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
ExoDiBosonResonancesEDBRWLeptonicProducerAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,ExoDiBosonResonancesEDBRWLeptonicProducerAuto,src/ExoDiBosonResonances/EDBRWLeptonicProducer/plugins))
endif
ALL_COMMONRULES += src_ExoDiBosonResonances_EDBRWLeptonicProducer_plugins
src_ExoDiBosonResonances_EDBRWLeptonicProducer_plugins_parent := ExoDiBosonResonances/EDBRWLeptonicProducer
src_ExoDiBosonResonances_EDBRWLeptonicProducer_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_ExoDiBosonResonances_EDBRWLeptonicProducer_plugins,src/ExoDiBosonResonances/EDBRWLeptonicProducer/plugins,PLUGINS))
ifeq ($(strip $(NNKit/BTagHelpers)),)
ALL_COMMONRULES += src_NNKit_BTagHelpers_src
src_NNKit_BTagHelpers_src_parent := NNKit/BTagHelpers
src_NNKit_BTagHelpers_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_NNKit_BTagHelpers_src,src/NNKit/BTagHelpers/src,LIBRARY))
NNKitBTagHelpers := self/NNKit/BTagHelpers
NNKit/BTagHelpers := NNKitBTagHelpers
NNKitBTagHelpers_files := $(patsubst src/NNKit/BTagHelpers/src/%,%,$(wildcard $(foreach dir,src/NNKit/BTagHelpers/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
NNKitBTagHelpers_BuildFile    := $(WORKINGDIR)/cache/bf/src/NNKit/BTagHelpers/BuildFile
NNKitBTagHelpers_LOC_USE := self  FWCore/Framework TrackingTools/IPTools DataFormats/PatCandidates
NNKitBTagHelpers_EX_LIB   := NNKitBTagHelpers
NNKitBTagHelpers_EX_USE   := $(foreach d,$(NNKitBTagHelpers_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
NNKitBTagHelpers_PACKAGE := self/src/NNKit/BTagHelpers/src
ALL_PRODS += NNKitBTagHelpers
NNKitBTagHelpers_CLASS := LIBRARY
NNKit/BTagHelpers_forbigobj+=NNKitBTagHelpers
NNKitBTagHelpers_INIT_FUNC        += $$(eval $$(call Library,NNKitBTagHelpers,src/NNKit/BTagHelpers/src,src_NNKit_BTagHelpers_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(NNKit/CommonTools)),)
ALL_COMMONRULES += src_NNKit_CommonTools_src
src_NNKit_CommonTools_src_parent := NNKit/CommonTools
src_NNKit_CommonTools_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_NNKit_CommonTools_src,src/NNKit/CommonTools/src,LIBRARY))
NNKitCommonTools := self/NNKit/CommonTools
NNKit/CommonTools := NNKitCommonTools
NNKitCommonTools_files := $(patsubst src/NNKit/CommonTools/src/%,%,$(wildcard $(foreach dir,src/NNKit/CommonTools/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
NNKitCommonTools_BuildFile    := $(WORKINGDIR)/cache/bf/src/NNKit/CommonTools/BuildFile
NNKitCommonTools_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/PatCandidates root mxnet-predict
NNKitCommonTools_EX_LIB   := NNKitCommonTools
NNKitCommonTools_EX_USE   := $(foreach d,$(NNKitCommonTools_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
NNKitCommonTools_PACKAGE := self/src/NNKit/CommonTools/src
ALL_PRODS += NNKitCommonTools
NNKitCommonTools_CLASS := LIBRARY
NNKit/CommonTools_forbigobj+=NNKitCommonTools
NNKitCommonTools_INIT_FUNC        += $$(eval $$(call Library,NNKitCommonTools,src/NNKit/CommonTools/src,src_NNKit_CommonTools_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(NNKit/FatJetInputs)),)
ALL_COMMONRULES += src_NNKit_FatJetInputs_src
src_NNKit_FatJetInputs_src_parent := NNKit/FatJetInputs
src_NNKit_FatJetInputs_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_NNKit_FatJetInputs_src,src/NNKit/FatJetInputs/src,LIBRARY))
NNKitFatJetInputs := self/NNKit/FatJetInputs
NNKit/FatJetInputs := NNKitFatJetInputs
NNKitFatJetInputs_files := $(patsubst src/NNKit/FatJetInputs/src/%,%,$(wildcard $(foreach dir,src/NNKit/FatJetInputs/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
NNKitFatJetInputs_BuildFile    := $(WORKINGDIR)/cache/bf/src/NNKit/FatJetInputs/BuildFile
NNKitFatJetInputs_LOC_USE := self  FWCore/Framework FWCore/ParameterSet DataFormats/PatCandidates DataFormats/BTauReco NNKit/CommonTools NNKit/BTagHelpers
NNKitFatJetInputs_EX_LIB   := NNKitFatJetInputs
NNKitFatJetInputs_EX_USE   := $(foreach d,$(NNKitFatJetInputs_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
NNKitFatJetInputs_PACKAGE := self/src/NNKit/FatJetInputs/src
ALL_PRODS += NNKitFatJetInputs
NNKitFatJetInputs_CLASS := LIBRARY
NNKit/FatJetInputs_forbigobj+=NNKitFatJetInputs
NNKitFatJetInputs_INIT_FUNC        += $$(eval $$(call Library,NNKitFatJetInputs,src/NNKit/FatJetInputs/src,src_NNKit_FatJetInputs_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(NNKitFatJetNNAuto)),)
NNKitFatJetNNAuto := self/src/NNKit/FatJetNN/plugins
PLUGINS:=yes
NNKitFatJetNNAuto_files := $(patsubst src/NNKit/FatJetNN/plugins/%,%,$(wildcard $(foreach dir,src/NNKit/FatJetNN/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
NNKitFatJetNNAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/NNKit/FatJetNN/plugins/BuildFile
NNKitFatJetNNAuto_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry CommonTools/UtilAlgos NNKit/FatJetNN
NNKitFatJetNNAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,NNKitFatJetNNAuto,NNKitFatJetNNAuto,$(SCRAMSTORENAME_LIB),src/NNKit/FatJetNN/plugins))
NNKitFatJetNNAuto_PACKAGE := self/src/NNKit/FatJetNN/plugins
ALL_PRODS += NNKitFatJetNNAuto
NNKit/FatJetNN_forbigobj+=NNKitFatJetNNAuto
NNKitFatJetNNAuto_INIT_FUNC        += $$(eval $$(call Library,NNKitFatJetNNAuto,src/NNKit/FatJetNN/plugins,src_NNKit_FatJetNN_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
NNKitFatJetNNAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,NNKitFatJetNNAuto,src/NNKit/FatJetNN/plugins))
endif
ALL_COMMONRULES += src_NNKit_FatJetNN_plugins
src_NNKit_FatJetNN_plugins_parent := NNKit/FatJetNN
src_NNKit_FatJetNN_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_NNKit_FatJetNN_plugins,src/NNKit/FatJetNN/plugins,PLUGINS))
ifeq ($(strip $(NNKit/FatJetNN)),)
ALL_COMMONRULES += src_NNKit_FatJetNN_src
src_NNKit_FatJetNN_src_parent := NNKit/FatJetNN
src_NNKit_FatJetNN_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_NNKit_FatJetNN_src,src/NNKit/FatJetNN/src,LIBRARY))
NNKitFatJetNN := self/NNKit/FatJetNN
NNKit/FatJetNN := NNKitFatJetNN
NNKitFatJetNN_files := $(patsubst src/NNKit/FatJetNN/src/%,%,$(wildcard $(foreach dir,src/NNKit/FatJetNN/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
NNKitFatJetNN_BuildFile    := $(WORKINGDIR)/cache/bf/src/NNKit/FatJetNN/BuildFile
NNKitFatJetNN_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/Utilities DataFormats/PatCandidates DataFormats/BTauReco NNKit/CommonTools NNKit/FatJetInputs
NNKitFatJetNN_EX_LIB   := NNKitFatJetNN
NNKitFatJetNN_EX_USE   := $(foreach d,$(NNKitFatJetNN_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
NNKitFatJetNN_PACKAGE := self/src/NNKit/FatJetNN/src
ALL_PRODS += NNKitFatJetNN
NNKitFatJetNN_CLASS := LIBRARY
NNKit/FatJetNN_forbigobj+=NNKitFatJetNN
NNKitFatJetNN_INIT_FUNC        += $$(eval $$(call Library,NNKitFatJetNN,src/NNKit/FatJetNN/src,src_NNKit_FatJetNN_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(L1PrefiringEventWeightProducerAuto)),)
L1PrefiringEventWeightProducerAuto := self/src/L1Prefiring/EventWeightProducer/plugins
PLUGINS:=yes
L1PrefiringEventWeightProducerAuto_files := $(patsubst src/L1Prefiring/EventWeightProducer/plugins/%,%,$(wildcard $(foreach dir,src/L1Prefiring/EventWeightProducer/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
L1PrefiringEventWeightProducerAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Prefiring/EventWeightProducer/plugins/BuildFile
L1PrefiringEventWeightProducerAuto_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/PatCandidates
L1PrefiringEventWeightProducerAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1PrefiringEventWeightProducerAuto,L1PrefiringEventWeightProducerAuto,$(SCRAMSTORENAME_LIB),src/L1Prefiring/EventWeightProducer/plugins))
L1PrefiringEventWeightProducerAuto_PACKAGE := self/src/L1Prefiring/EventWeightProducer/plugins
ALL_PRODS += L1PrefiringEventWeightProducerAuto
L1Prefiring/EventWeightProducer_forbigobj+=L1PrefiringEventWeightProducerAuto
L1PrefiringEventWeightProducerAuto_INIT_FUNC        += $$(eval $$(call Library,L1PrefiringEventWeightProducerAuto,src/L1Prefiring/EventWeightProducer/plugins,src_L1Prefiring_EventWeightProducer_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
L1PrefiringEventWeightProducerAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,L1PrefiringEventWeightProducerAuto,src/L1Prefiring/EventWeightProducer/plugins))
endif
ALL_COMMONRULES += src_L1Prefiring_EventWeightProducer_plugins
src_L1Prefiring_EventWeightProducer_plugins_parent := L1Prefiring/EventWeightProducer
src_L1Prefiring_EventWeightProducer_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Prefiring_EventWeightProducer_plugins,src/L1Prefiring/EventWeightProducer/plugins,PLUGINS))
