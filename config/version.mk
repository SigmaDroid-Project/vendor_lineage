PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 0

ALPHA_VERSION := 2.0
ALPHA_VARIANT := Droid

ALPHA_BUILD_TYPE ?= UNOFFICIAL

ALPHA_BUILD_PACKAGE := vanilla

# Internal version
LINEAGE_VERSION := Alpha$(ALPHA_VARIANT)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-$(ALPHA_BUILD_PACKAGE)-v$(ALPHA_VERSION)

# Display version
LINEAGE_DISPLAY_VERSION := Alpha$(ALPHA_VARIANT)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-$(ALPHA_BUILD_PACKAGE)-v$(ALPHA_VERSION)
