PRODUCT_BRAND ?= Sigma

# Pif Packages
PRODUCT_PACKAGES += \
	PifPrebuilt \
	Pif \

# RRO Packages
PRODUCT_PACKAGES += \
    ClearCallingSettingsOverlay

# Pixel Face Unlock
ifneq ($(filter blueline crosshatch bonito sargo flame coral sunfish bramble barbet redfin oriole raven bluejay panther cheetah lynx husky shiba, $(TARGET_DEVICE)),)
-include vendor/google/faceunlock/device.mk
endif