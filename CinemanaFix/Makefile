THEOS_DEVICE_IP = 0
ARCHS = arm64
TARGET = iphone:clang:16.5:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CinemanaFix
CinemanaFix_FILES = Tweak.x
CinemanaFix_CFLAGS = -fobjc-arc
CinemanaFix_FRAMEWORKS = AVFoundation UIKit

include $(THEOS)/makefiles/tweak.mk
