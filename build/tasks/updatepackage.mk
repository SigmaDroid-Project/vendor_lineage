# Copyright (C) 2022 PixysOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# SigmaDroid OTA update package

ECHO_BLUE := \e[34m
ECHO_GREEN := \e[32m
ECHO_ENDCOLOR := \e[0m

.PHONY: updatepackage
updatepackage: $(INTERNAL_UPDATE_PACKAGE_TARGET)
#	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(SPARK_TARGET_UPDATEPACKAGE)
	@echo "Generating changelog..."
	$(hide) ./vendor/lineage/tools/changelog.sh
	$(hide) cp Changelog.txt $(PRODUCT_OUT)/$(SIGMA_VERSION)-Changelog.txt
	$(hide) cp Changelog.txt $(PRODUCT_OUT)/Auto-Changelog.txt

#	$(hide) cp -r $OUT/Changelog.txt $OUT/$(LINEAGE_VERSION)-changelog.txt
#	$(hide) ./vendor/lineage/build/tasks/betadroid_ascii.sh
	@echo -e "$(ECHO_GREEN)==============================================================${ECHO_ENDCOLOR}"
	@echo -e " ${ECHO_BLUE}Generated Changelog Successfully:${ECHO_ENDCOLOR}"
	@echo -e "${ECHO_GREEN}==============================================================${ECHO_ENDCOLOR}"
	@echo ""
