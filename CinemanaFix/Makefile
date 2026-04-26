ARCHS = arm64
TARGET = iphone:clang:16.5:14.0

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = CinemanaFix
CinemanaFix_FILES = Tweak.x
CinemanaFix_CFLAGS = -fobjc-arc
CinemanaFix_FRAMEWORKS = AVFoundation

include $(THEOS)/makefiles/library.mk
