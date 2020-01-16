ifeq ($(strip $(PyL1PrefiringEventWeightProducer)),)
PyL1PrefiringEventWeightProducer := self/src/L1Prefiring/EventWeightProducer/python
src_L1Prefiring_EventWeightProducer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Prefiring/EventWeightProducer/python)
PyL1PrefiringEventWeightProducer_files := $(patsubst src/L1Prefiring/EventWeightProducer/python/%,%,$(wildcard $(foreach dir,src/L1Prefiring/EventWeightProducer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1PrefiringEventWeightProducer_LOC_USE := self  
PyL1PrefiringEventWeightProducer_PACKAGE := self/src/L1Prefiring/EventWeightProducer/python
ALL_PRODS += PyL1PrefiringEventWeightProducer
PyL1PrefiringEventWeightProducer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1PrefiringEventWeightProducer,src/L1Prefiring/EventWeightProducer/python,src_L1Prefiring_EventWeightProducer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyL1PrefiringEventWeightProducer,src/L1Prefiring/EventWeightProducer/python))
endif
ALL_COMMONRULES += src_L1Prefiring_EventWeightProducer_python
src_L1Prefiring_EventWeightProducer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Prefiring_EventWeightProducer_python,src/L1Prefiring/EventWeightProducer/python,PYTHON))
