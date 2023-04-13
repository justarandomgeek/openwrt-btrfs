include $(TOPDIR)/rules.mk

PKG_NAME:=btrbk
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

# PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=btrbk
  URL:=https://github.com/justarandomgeek/
  DEPENDS+= +btrfs-progs 
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/description
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/btrbk
	$(CP) files/etc/btrbk/btrbk.conf $(1)/etc/btrbk/
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(CP) files/etc/uci-defaults/99-btrbk $(1)/etc/uci-defaults/
	$(INSTALL_DIR) $(1)/lib/upgrade/keep.d
	$(CP) files/lib/upgrade/keep.d/btrbk $(1)/lib/upgrade/keep.d/
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) files/usr/bin/btrbk $(1)/usr/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
