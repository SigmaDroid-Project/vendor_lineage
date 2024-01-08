PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 0

SIGMA_VERSION := 2.0
SIGMA_VARIANT := Droid

SIGMA_BUILD_TYPE ?= UNOFFICIAL

# Only include Updater for official builds
ifeq ($(filter-out OFFICIAL Official official,$(SIGMA_BUILD_TYPE)),)
PRODUCT_PACKAGES += \
    SigmaUpdater

PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/init/init.lineage-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.lineage-updater.rc
endif

ifeq ($(WITH_GMS),true)
SIGMA_BUILD_PACKAGE := gapps
else
SIGMA_BUILD_PACKAGE := vanilla
endif

# Internal version
LINEAGE_VERSION := Sigma$(SIGMA_VARIANT)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-$(SIGMA_BUILD_PACKAGE)-v$(SIGMA_VERSION)

# Display version
LINEAGE_DISPLAY_VERSION := Sigma$(SIGMA_VARIANT)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-$(SIGMA_BUILD_PACKAGE)-v$(SIGMA_VERSION)
