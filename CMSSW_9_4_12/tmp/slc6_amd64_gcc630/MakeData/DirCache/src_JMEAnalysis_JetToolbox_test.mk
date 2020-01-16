ALL_COMMONRULES += src_JMEAnalysis_JetToolbox_test
src_JMEAnalysis_JetToolbox_test_parent := JMEAnalysis/JetToolbox
src_JMEAnalysis_JetToolbox_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JMEAnalysis_JetToolbox_test,src/JMEAnalysis/JetToolbox/test,TEST))
