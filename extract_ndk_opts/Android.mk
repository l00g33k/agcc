LOCAL_PATH := D:\2\safe\gits\github\aagcc\extract_ndk_opts
include $(CLEAR_VARS)
LOCAL_MODULE := extractagccargs
#LOCAL_C_INCLUDES += 
LOCAL_SRC_FILES := \
    extract_ndk_opts_cpp.cpp \
    extract_ndk_opts_c.c
include $(BUILD_EXECUTABLE)
