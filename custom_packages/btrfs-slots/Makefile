include $(TOPDIR)/rules.mk

PKG_NAME:=btrfs-slots
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

# PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=BTRFS Subvol mounting and upgrade utils
  URL:=https://github.com/justarandomgeek/
  DEPENDS+= +btrfs-progs +grub2-editenv +grub2-efi +mount-utils
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/description
  Scripts for mounting BTRFS Subvolumes and using them to manage upgrades and rollbacks.
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/efi
	$(INSTALL_DIR) $(1)/mnt/rootfs
	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) files/etc/init.d/btrfs $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc/rc.d
	$(CP) files/etc/rc.d/S12btrfs $(1)/etc/rc.d/
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(CP) files/etc/uci-defaults/09-btrfs $(1)/etc/uci-defaults/
	$(CP) files/etc/uci-defaults/09-fstab $(1)/etc/uci-defaults/
	$(INSTALL_DIR) $(1)/sbin
	$(CP) files/sbin/btrfs-upgrade $(1)/sbin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
