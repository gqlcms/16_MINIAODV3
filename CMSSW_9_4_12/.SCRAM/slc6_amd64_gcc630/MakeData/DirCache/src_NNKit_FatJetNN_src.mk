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
