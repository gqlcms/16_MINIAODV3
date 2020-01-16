ifeq ($(strip $(NNKit/CommonTools)),)
ALL_COMMONRULES += src_NNKit_CommonTools_src
src_NNKit_CommonTools_src_parent := NNKit/CommonTools
src_NNKit_CommonTools_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_NNKit_CommonTools_src,src/NNKit/CommonTools/src,LIBRARY))
NNKitCommonTools := self/NNKit/CommonTools
NNKit/CommonTools := NNKitCommonTools
NNKitCommonTools_files := $(patsubst src/NNKit/CommonTools/src/%,%,$(wildcard $(foreach dir,src/NNKit/CommonTools/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
NNKitCommonTools_BuildFile    := $(WORKINGDIR)/cache/bf/src/NNKit/CommonTools/BuildFile
NNKitCommonTools_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/PatCandidates root mxnet-predict
NNKitCommonTools_EX_LIB   := NNKitCommonTools
NNKitCommonTools_EX_USE   := $(foreach d,$(NNKitCommonTools_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
NNKitCommonTools_PACKAGE := self/src/NNKit/CommonTools/src
ALL_PRODS += NNKitCommonTools
NNKitCommonTools_CLASS := LIBRARY
NNKit/CommonTools_forbigobj+=NNKitCommonTools
NNKitCommonTools_INIT_FUNC        += $$(eval $$(call Library,NNKitCommonTools,src/NNKit/CommonTools/src,src_NNKit_CommonTools_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
