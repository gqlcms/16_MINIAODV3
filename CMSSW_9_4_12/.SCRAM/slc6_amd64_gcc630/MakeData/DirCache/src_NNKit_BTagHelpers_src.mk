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
