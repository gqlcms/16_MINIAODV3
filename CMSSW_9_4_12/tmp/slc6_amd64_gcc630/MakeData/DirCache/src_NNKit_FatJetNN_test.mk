ALL_COMMONRULES += src_NNKit_FatJetNN_test
src_NNKit_FatJetNN_test_parent := NNKit/FatJetNN
src_NNKit_FatJetNN_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_NNKit_FatJetNN_test,src/NNKit/FatJetNN/test,TEST))
