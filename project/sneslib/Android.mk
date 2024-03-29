LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := user

LOCAL_ARM_MODE := arm

# This is the target being built.
LOCAL_MODULE := libsnes

# All of the source files that we will compile.
LOCAL_SRC_FILES := \
	2xsaiwin.cpp \
	apu.cpp \
	c4.cpp \
	c4emu.cpp \
	cheats.cpp \
	cheats2.cpp \
	cpu.cpp \
	cpuexec.cpp \
	data.cpp \
	dma.cpp \
	dsp1.cpp \
	fxemu.cpp \
	fxinst.cpp \
	globals.cpp \
	loadzip.cpp \
	memmap.cpp \
	ppu.cpp \
	sdd1.cpp \
	sdd1emu.cpp \
	snapshot.cpp \
	soundux.cpp \
	spc700.cpp \
	srtc.cpp \
	gfx.cpp \
	tile.cpp \
	clip.cpp \
	zip.c \
	unzip.c \
	ioapi.c

LOCAL_SRC_FILES += \
	os9x_asm_cpu.cpp \
	os9x_65c816.S \
	spc700a.S \
	m3d_func.S \
	misc.S \
	spc_decode.S

LOCAL_SRC_FILES += \
	android/snesengine.cpp \
	android/file.cpp \
	android/debug.cpp

# All of the shared libraries we link against.
LOCAL_SHARED_LIBRARIES := \
	libutils \
	libz

# Static libraries.
LOCAL_STATIC_LIBRARIES := \
	libunz

# Also need the JNI headers.
LOCAL_C_INCLUDES += \
	$(JNI_H_INCLUDE) \
	$(LOCAL_PATH)/../jni \
	external/zlib \
	/path/to/droidsource/dalvik/libnativehelper/include/ \
        /path/to/droidsource/frameworks/base/include/ \
        /path/to/droidsource/system/core/include/ \
        $(LOCAL_PATH)

# No special compiler flags.
LOCAL_CFLAGS += -O3 -fvisibility=hidden

LOCAL_LDLIBS := -llog

#LDFLAGS := -Lspc700a.s 


# Don't prelink this library.  For more efficient code, you may want
# to add this library to the prelink map and set this to true. However,
# it's difficult to do this for applications that are not supplied as
# part of a system image.

LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

