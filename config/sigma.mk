PRODUCT_BRAND ?= Sigma

# Certification (SafetyNet)
$(call inherit-product-if-exists, vendor/certification/config.mk)

# RRO Packages
PRODUCT_PACKAGES += \
    AndroidOverlay \
    Launcher3Overlay \
    SettingsOverlay

# Pixel Specific
ifeq ($(TARGET_IS_PIXEL),true)
PRODUCT_PACKAGES += \
    PixelSettingsGoogleOverlay \
    PixelSystemUIGoogleOverlay
endif

# Clear Calling (P22+)
ifeq ($(TARGET_SUPPORTS_CLEAR_CALLING),true)
PRODUCT_PACKAGES += \
    ClearCallingSettingsOverlay
endif