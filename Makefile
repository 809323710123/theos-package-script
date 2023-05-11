export THEOS = ../path/to/theos

ARCHS = arm64 

ifeq ($(SCHEME), rootful)
    THEOS_PACKAGE_DIR = debs/rootful
else ifeq ($(SCHEME), rootless)
    THEOS_PACKAGE_SCHEME = rootless
    THEOS_PACKAGE_DIR = debs/rootless
else ifeq ($(SCHEME), jailed)
    THEOS_PACKAGE_DIR = debs/jailed
endif

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = example

$(TWEAK_NAME)_CFLAGS = -fobjc-arc 


$(TWEAK_NAME)_FILES = example.xm 

include $(THEOS_MAKE_PATH)/tweak.mk

