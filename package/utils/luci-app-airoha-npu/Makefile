# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 zhoufla
#
# Airoha NPU/PPE offload status for the LuCI status overview page.
# Ships an rpcd ucode plugin reading the debugfs "config" node provided
# by target/linux/airoha patch 925-net-airoha-add-PON-PPE-offload-metadata,
# plus a build-time patch (patches/luci-mod-status/) which adds the NPU
# status rows to the system box of luci-mod-status; the patch is applied
# to feeds/luci by the toplevel Makefile during the build.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-airoha-npu
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_MAINTAINER:=zhoufla
PKG_LICENSE:=GPL-2.0-only
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-airoha-npu
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=Airoha NPU/PPE offload status page
  DEPENDS:=+luci-base
  PKGARCH:=all
endef

define Package/luci-app-airoha-npu/description
  Shows the Airoha PPE offload state (npu_attached, GDM2/WAN/VIP/IFC
  port registers and per-PPE flow/table configuration from the debugfs
  "config" node exported by PonWrt patch
  925-net-airoha-add-PON-PPE-offload-metadata) as extra rows in the
  system box of the LuCI status overview page, right below the CPU
  usage line. The backend is an rpcd ucode plugin reading
  /sys/kernel/debug/ppe/config; the overview rows are added by a
  build-time patch to luci-mod-status shipped under
  patches/luci-mod-status/ and applied to feeds/luci by the toplevel
  Makefile. The rows stay hidden on devices without the airoha_ppe
  driver.
endef

define Build/Compile
endef

define Package/luci-app-airoha-npu/install
	$(CP) ./root/* $(1)/
endef

$(eval $(call BuildPackage,luci-app-airoha-npu))
