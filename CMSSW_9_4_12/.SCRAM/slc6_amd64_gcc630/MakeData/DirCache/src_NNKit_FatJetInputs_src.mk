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
