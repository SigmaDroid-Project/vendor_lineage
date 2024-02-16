PRODUCT_BRAND ?= Sigma

# Certification (SafetyNet)
$(call inherit-product-if-exists, vendor/certification/config.mk)

# RRO Packages
PRODUCT_PACKAGES += \
    ClearCallingSettingsOverlay \
    AndroidOverlay

# Pixel Face Unlock
ifneq ($(filter blueline crosshatch bonito sargo flame coral sunfish bramble barbet redfin oriole raven bluejay panther cheetah lynx husky shiba, $(TARGET_DEVICE)),)
-include vendor/google/faceunlock/device.mk
endif