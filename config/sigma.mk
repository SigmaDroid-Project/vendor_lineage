PRODUCT_BRAND ?= Sigma

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
    persist.columbus.use_ap_sensor=false
endif

# RRO Packages
PRODUCT_PACKAGES += \
    AndroidOverlay \
    Launcher3Overlay

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

# Pif
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_mainline_BRAND?=google \
    persist.sys.pihooks_mainline_DEVICE?=caiman \
    persist.sys.pihooks_mainline_MANUFACTURER?=Google \
    persist.sys.pihooks_mainline_PRODUCT?=caiman \
    ro.product.model_for_attestation?=Pixel 9 Pro \
    ro.product.brand_for_attestation?=google \
    ro.product.name_for_attestation?=caiman \
    ro.product.device_for_attestation?=caiman \
    ro.product.manufacturer_for_attestation?=Google

PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.pihooks.first_api_level=32

# PIF GMS Spoof
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_BRAND=google \
    persist.sys.pihooks_DEVICE=husky \
    persist.sys.pihooks_DEVICE_INITIAL_SDK_INT=21 \
    persist.sys.pihooks_FINGERPRINT=google/husky_beta/husky:15/AP31.240617.015/12207491:user/release-keys \
    persist.sys.pihooks_ID=AP31.240617.015 \
    persist.sys.pihooks_MANUFACTURER=Google \
    persist.sys.pihooks_MODEL="Pixel\ 8\ Pro" \
    persist.sys.pihooks_PRODUCT=husky_beta \
    persist.sys.pihooks_SECURITY_PATCH=2024-08-05

PRODUCT_BUILD_PROP_OVERRIDES += \
    PIHOOKS_BUILD_FINGERPRINT="google/caiman/caiman:14/AD1A.240530.047.U1/12150698:user/release-keys" \
    PIHOOKS_MODEL_SPOOF="Pixel 9 Pro"
