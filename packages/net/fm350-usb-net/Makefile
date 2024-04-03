include $(TOPDIR)/rules.mk

PKG_NAME:=fm350-usb-net
PKG_VERSION:=0.0.1
PKG_RELEASE:=1
PKG_MAINTAINER:=

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  PKGARCH:=all
  TITLE:=Fibocom FM350 usb net
endef

define Package/$(PKG_NAME)/description
	Simple usb net for Fibocom FM350 module
endef


define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef


define Package/$(PKG_NAME)/install
	$(CP) ./root/* $(1)/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
