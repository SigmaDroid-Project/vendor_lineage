# GMS
ifeq ($(WITH_GMS),true)
WITH_GMS_COMMS_SUITE := true
endif

# Sensitive Phone Numbers list
PRODUCT_PACKAGES += \
    sensitive_pn.xml

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk

# Default ringtone
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Orion.ogg

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Disable mobile data by default
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.android.mobiledata=false

# Include Carrier Runtime Configuration
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/lineage/CarrierSettings/overlay

# RRO Packages
PRODUCT_PACKAGES += \
    CarrierSettingsOverlay \
    CarrierSettingsConfigOverlay \
    CarrierSettingsProviderOverlay \
    CarrierSettingsSystemUIOverlay \
    TeleServiceOverlay \
    TelephonyProviderOverlay
