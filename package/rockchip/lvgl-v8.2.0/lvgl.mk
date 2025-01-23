################################################################################
#
# lvgl
#
################################################################################

#LVGL_V8_2_0_VERSION = 8.2.0
LVGL_V8_2_0_SITE_METHOD = local
LVGL_V8_2_0_SITE = $(TOPDIR)/../external/lvgl-v8.2.0
LVGL_V8_2_0_INSTALL_STAGING = YES

LVGL_V8_2_0_DEPENDENCIES += freetype
LVGL_V8_2_0_APP_CFLAGS = -I $(STAGING_DIR)/usr/include/freetype2

define LVGL_V8_2_0_PRE_RSYNC_INSTALL_CONFIG
        cp -rfp  $(LVGL_V8_2_0_SITE)/rockchip-conf/$(BR2_PACKAGE_LVGL_V8_2_0_CONF)  $(LVGL_V8_2_0_SITE)/lv_conf.h | true
endef

LVGL_V8_2_0_CONF_OPTS += -DCMAKE_C_FLAGS="$(LVGL_V8_2_0_APP_CFLAGS)" \
                  -DCMAKE_CXX_FLAGS="$(LVGL_V8_2_0_APP_CFLAGS)"

LVGL_V8_2_0_PRE_RSYNC_HOOKS += LVGL_V8_2_0_PRE_RSYNC_INSTALL_CONFIG

$(eval $(cmake-package))
