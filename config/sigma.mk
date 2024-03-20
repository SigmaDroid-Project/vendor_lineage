PRODUCT_BRAND ?= Sigma

# Certification (SafetyNet)
$(call inherit-product-if-exists, vendor/certification/config.mk)

# RRO Packages
PRODUCT_PACKAGES += \
    AndroidOverlay \
    Launcher3Overlay \
    SettingsOverlay

# Pixel Specific
ifneq ($(filter blueline crosshatch bonito sargo flame coral sunfish bramble barbet redfin oriole raven bluejay panther cheetah lynx husky shiba, $(TARGET_DEVICE)),)

# Face Unlock
-include vendor/google/faceunlock/device.mk

# RROs
PRODUCT_PACKAGES += \
    PixelSettingsGoogleOverlay \
    PixelSystemUIGoogleOverlay
endif

# Clear Calling (P22+)
ifneq ($(filter bluejay panther cheetah lynx husky shiba, $(TARGET_DEVICE)),)
PRODUCT_PACKAGES += \
    ClearCallingSettingsOverlay
endif