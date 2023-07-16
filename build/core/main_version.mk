# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# crDroid legal
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.crdroidlegal.url=https://crdroid.net/legal.php

# SIGMAOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.sigma.build.version.plat.sdk=$(SIGMA_PLATFORM_SDK_VERSION)

# SIGMAOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.sigma.build.version.plat.rev=$(SIGMA_PLATFORM_REV)

# Sigma properties
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.sigma.build.version=$(SIGMA_VERSION) \
    ro.sigma.display.version=$(SIGMA_DISPLAY_VERSION) \
    ro.sigma.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.sigma.modversion=$(SIGMA_VERSION) \
    ro.sigma.build.package=$(SIGMA_BUILD_PACKAGE) \
    ro.sigma.maintainer=$(SIGMA_MAINTAINER) \
    ro.sigma.release.type=$(SIGMA_BUILD_TYPE) \
    ro.modversion=$(SIGMA_VERSION)
