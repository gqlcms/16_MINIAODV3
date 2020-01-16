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
