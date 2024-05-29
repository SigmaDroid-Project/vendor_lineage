PRODUCT_BRAND ?= Sigma

# Certification (SafetyNet)
$(call inherit-product-if-exists, vendor/certification/config.mk)

ifeq ($(TARGET_INCLUDE_MATLOG),true)
PRODUCT_PACKAGES += \
    MatLog
endif

# Privapp-permissions whitelist mode
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=log

# GMS
ifeq ($(WITH_GMS),true)
BUILD_GMS_OVERLAYS_AND_PROPS := true
$(call inherit-product, vendor/gms/products/gms.mk)
endif

TARGET_SUPPORTS_QUICK_TAP ?= false
ifeq ($(TARGET_SUPPORTS_QUICK_TAP), true)
PRODUCT_PRODUCT_PROPERTIES += \
    persist.columbus.use_ap_sensor=true
else
PRODUCT_PRODUCT_PROPERTIES += \
    persist.columbus.use_ap_sensor=true
endif

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

# Launcher3 as Default Launcher
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.default_launcher=0
