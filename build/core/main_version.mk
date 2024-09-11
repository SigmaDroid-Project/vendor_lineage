# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# LineageOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)

# Sigma properties
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.sigma.build.version=$(LINEAGE_VERSION) \
    ro.sigma.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.sigma.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.sigma.modversion=$(SIGMA_VERSION) \
    ro.sigma.build.package=$(SIGMA_BUILD_PACKAGE) \
    ro.sigma.maintainer=$(SIGMA_MAINTAINER) \
    ro.sigma.release.type=$(SIGMA_BUILD_TYPE) \
    ro.modversion=$(SIGMA_VERSION) \
    ro.sigma.build.date=$(shell date +%D%Y%m) \
    ro.sigma.display.build.date=$(shell date '+%Y-%m-%d') \
    ro.sigma.battery.capacity=$(SIGMA_BATTERY_CAPACITY)
