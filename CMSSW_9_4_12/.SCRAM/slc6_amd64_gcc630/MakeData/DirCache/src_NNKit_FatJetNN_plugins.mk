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
