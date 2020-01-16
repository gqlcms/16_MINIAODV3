ifeq ($(strip $(PyJMEAnalysisJetToolbox)),)
PyJMEAnalysisJetToolbox := self/src/JMEAnalysis/JetToolbox/python
src_JMEAnalysis_JetToolbox_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/JMEAnalysis/JetToolbox/python)
PyJMEAnalysisJetToolbox_files := $(patsubst src/JMEAnalysis/JetToolbox/python/%,%,$(wildcard $(foreach dir,src/JMEAnalysis/JetToolbox/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyJMEAnalysisJetToolbox_LOC_USE := self  
PyJMEAnalysisJetToolbox_PACKAGE := self/src/JMEAnalysis/JetToolbox/python
ALL_PRODS += PyJMEAnalysisJetToolbox
PyJMEAnalysisJetToolbox_INIT_FUNC        += $$(eval $$(call PythonProduct,PyJMEAnalysisJetToolbox,src/JMEAnalysis/JetToolbox/python,src_JMEAnalysis_JetToolbox_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyJMEAnalysisJetToolbox,src/JMEAnalysis/JetToolbox/python))
endif
ALL_COMMONRULES += src_JMEAnalysis_JetToolbox_python
src_JMEAnalysis_JetToolbox_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JMEAnalysis_JetToolbox_python,src/JMEAnalysis/JetToolbox/python,PYTHON))
