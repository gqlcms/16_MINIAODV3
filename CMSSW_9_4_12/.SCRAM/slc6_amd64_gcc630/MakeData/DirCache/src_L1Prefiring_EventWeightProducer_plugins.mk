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
