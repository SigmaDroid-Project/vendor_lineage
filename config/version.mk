PRODUCT_VERSION_MAJOR = 13
PRODUCT_VERSION_MINOR = 0

SIGMA_VERSION := v0.5
SIGMA_VARIANT := Droid


SIGMA_BUILD_TYPE ?= PREVIEW

# Only include Updater for official builds
ifeq ($(filter-out OFFICIAL Official official,$(SIGMA_BUILD_TYPE)),)
PRODUCT_PACKAGES += \
    SigmaUpdater

PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/init/init.lineage-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.lineage-updater.rc
endif

# GAPPS_BUILD_TYPE
# 0 - NO GAPPS (DEFAULT)
# 1 - CORE GAPPS
# 2 - FULL GAPPS

# validate GAPPS_BUILD_TYPE used on envsetup
ifeq ($(filter $(strip $(GAPPS_BUILD_TYPE)),0 1 2),)
# if value is not valid, pick WITH_GAPPS from dt
GAPPS_BUILD_TYPE := $(strip $(WITH_GAPPS))
endif

ifeq ($(GAPPS_BUILD_TYPE),1)
SIGMA_BUILD_PACKAGE := core_gapps
else
ifeq ($(GAPPS_BUILD_TYPE),2)
SIGMA_BUILD_PACKAGE := full_gapps
ifneq ($(strip $(TARGET_INCLUDE_PIXEL_FRAMEWORK)),false)
$(call inherit-product-if-exists, vendor/pixel-framework/config.mk)
endif
else # default
SIGMA_BUILD_PACKAGE := vanilla
endif
endif

# include GMS setup
$(call inherit-product, vendor/gms/setup.mk)

# Internal version
LINEAGE_VERSION := Sigma$(SIGMA_VARIANT)-$(SIGMA_VERSION)-$(shell date +%Y%m%d)-$(SIGMA_BUILD_TYPE)-$(SIGMA_BUILD_PACKAGE)-$(SIGMA_BUILD)

# Display version
LINEAGE_DISPLAY_VERSION := Sigma$(SIGMA_VARIANT)-$(SIGMA_VERSION)-$(SIGMA_BUILD_PACKAGE)-$(SIGMA_BUILD)
