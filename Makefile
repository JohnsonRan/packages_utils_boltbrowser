include $(TOPDIR)/rules.mk

PKG_NAME:=boltbrowser
PKG_VERSION:=2.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/br0xen/boltbrowser/tar.gz/$(PKG_VERSION)?
PKG_HASH:=3a2b5f52fad496bc921baf34a436ad455d8217d087ea1d8821196eb68f924ca0

PKG_MAINTAINER:=JohnsonRan <me@ihtw.moe>
PKG_LICENSE:=GPL-3.0

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/br0xen/boltbrowser
GO_PKG_LDFLAGS_X:=main.version=v$(PKG_VERSION)-$(PKG_RELEASE)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/boltbrowser
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A CLI Browser for BoltDB Files
  URL:=https://github.com/br0xen/boltbrowser
  DEPENDS:=$(GO_ARCH_DEPENDS)
endef

define Package/boltbrowser/description
  A CLI Browser for BoltDB Files
endef

define Package/boltbrowser/install
    $(call GoPackage/Package/Install/Bin,$(1))
endef

define Build/Prepare
	$(Build/Prepare/Default)
	$(RM) -r $(PKG_BUILD_DIR)/rules/logic_test
endef

$(eval $(call GoBinPackage,boltbrowser))
$(eval $(call BuildPackage,boltbrowser))