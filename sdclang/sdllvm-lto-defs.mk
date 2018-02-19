LLVM_PREBUILTS_PATH_QCOM := vendor/qcom/sdclang/bin
LLVM_PREBUILTS_OPT_PATH_QCOM := vendor/qcom/sdclang/lib/clang/4.0.2/lib/

CLANG_QCOM_EXTRA_OPT_LIBRARIES_LINK := \
$(LLVM_PREBUILTS_OPT_PATH_QCOM)/linux-propri_rt/libclang_rt.optlibc-krait-android.a \
$(LLVM_PREBUILTS_OPT_PATH_QCOM)/linux-propri_rt/libclang_rt.translib-arm-android.a \
$(LLVM_PREBUILTS_OPT_PATH_QCOM)/linux-propri_rt/libclang_rt.optlibc-krait.a \
$(LLVM_PREBUILTS_OPT_PATH_QCOM)/linux-propri_rt/libclang_rt.translib-arm.a \
$(LLVM_PREBUILTS_OPT_PATH_QCOM)/linux-propri_rt/libclang_rt.ae-aarch64.a \
$(LLVM_PREBUILTS_OPT_PATH_QCOM)/linux-propri_rt/libclang_rt.ae-aarch64-android.a \
$(LLVM_PREBUILTS_OPT_PATH_QCOM)/linux-propri_rt/libclang_rt.translib-aarch64.a \
$(LLVM_PREBUILTS_OPT_PATH_QCOM)/linux-propri_rt/libclang_rt.translib-aarch64-android.a 

$(LOCAL_2ND_ARCH_VAR_PREFIX)TARGET_LIBGCC += $(CLANG_QCOM_EXTRA_OPT_LIBRARIES_LINK)

CLANG_QCOM_EXTRA_OPT_LIBGCC := \
-L $(LLVM_PREBUILTS_OPT_PATH_QCOM)/linux/ \
-l clang_rt.builtins-arm-android \
-l clang_rt.asan-arm-android \
-l clang_rt.builtins-arm \
-l clang_rt.asan-arm \
-l clang_rt.asan-aarch64 

CLANG_QCOM_EXTRA_OPT_LIBRARIES := \
libclang_rt.optlibc-krait-android \
libclang_rt.translib-arm-android \
libclang_rt.optlibc-krait \
libclang_rt.translib-arm \
libclang_rt.translib-aarch64 \
libclang_rt.translib-aarch64-android

ifeq ($(LOCAL_MODULE_CLASS), STATIC_LIBRARIES)
# For STATIC_LIBRARIES we need to use SD LLVM's archiver and archiver flags.

AR := $(SDCLANG_PATH)/llvm-ar
ARFLAGS := crsD

# For 32 bit
$(LOCAL_BUILT_MODULE) : $(combo_2nd_arch_prefix)TARGET_AR := $(AR)
$(LOCAL_BUILT_MODULE) : $(combo_var_prefix)GLOBAL_ARFLAGS := $(ARFLAGS)

# For 64 bit
intermediates := $(call local-intermediates-dir,,$(LOCAL_2ND_ARCH_VAR_PREFIX))
LOCAL_BUILT_MODULE_64 := $(intermediates)/$(my_built_module_stem)

$(LOCAL_BUILT_MODULE_64) : TARGET_AR := $(AR)
$(LOCAL_BUILT_MODULE_64) : TARGET_GLOBAL_ARFLAGS := $(ARFLAGS)

else
# For SHARED_LIBRARIES and EXECUTABLES we need to filter out flags not
# needed/understood by SD LLVM's Linker.

linked_module_32 := $(intermediates)/LINKED/$(my_built_module_stem)
intermediates    := $(call local-intermediates-dir,,$(LOCAL_2ND_ARCH_VAR_PREFIX))
linked_module_64 := $(intermediates)/LINKED/$(my_built_module_stem)

FLAGS_TO_BE_FILTERED := -Wl,--icf=safe -Wl,--no-undefined-version -Wl,--fix-cortex-a53-843419 -Wl,--no-fix-cortex-a53-843419 -Wl,--fix-cortex-a53-835769 -Wl,--no-fix-cortex-a53-835769 -fuse-ld=gold
$(linked_module_32) : PRIVATE_TARGET_GLOBAL_LDFLAGS := $(filter-out $(FLAGS_TO_BE_FILTERED),$(PRIVATE_TARGET_GLOBAL_LDFLAGS))
$(linked_module_64) : PRIVATE_TARGET_GLOBAL_LDFLAGS := $(filter-out $(FLAGS_TO_BE_FILTERED),$(PRIVATE_TARGET_GLOBAL_LDFLAGS))

ifeq ($(LOCAL_SDCLANG_LTO_UNSAFE_FILTER), true)
$(linked_module_32) : PRIVATE_LDFLAGS := $(filter-out $(FLAGS_TO_BE_FILTERED),$(PRIVATE_LDFLAGS))
$(linked_module_64) : PRIVATE_LDFLAGS := $(filter-out $(FLAGS_TO_BE_FILTERED),$(PRIVATE_LDFLAGS))
endif

endif
