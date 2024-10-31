################################################################################
#
# rockchip rvcam project
#
################################################################################

ROCKCHIP_RVCAM_VERSION = main
ROCKCHIP_RVCAM_SITE = $(TOPDIR)/../external/rvcam
ROCKCHIP_RVCAM_SITE_METHOD = local
ROCKCHIP_RVCAM_LICENSE = proprietary, GPL-2.0, Apache-2.0
ROCKCHIP_RVCAM_LICENSE_FILES = licenses/LICENSE licenses/GPL-2.0 licenses/Apache-2.0

ROCKCHIP_RVCAM_DEPENDENCIES += tinyxml2
ROCKCHIP_RVCAM_DEPENDENCIES += rockchip-erpc

define ROCKCHIP_RVCAM_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0644 $(@D)/components/config/xml/rvcam_config.xml \
		$(TARGET_DIR)/etc/
	$(INSTALL) -D -m 0755 $(@D)/rvcam_remote/S60rvcam \
		$(TARGET_DIR)/etc/init.d/
endef

$(eval $(cmake-package))
