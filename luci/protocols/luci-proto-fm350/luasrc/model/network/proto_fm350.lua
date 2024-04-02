-- Licensed to the public under the Apache License 2.0.

local netmod = luci.model.network
local interface = luci.model.network.interface
local proto = netmod:register_protocol("fm350")

function proto.get_i18n(self)
	return luci.i18n.translate("FM350 Cellular")
end

function proto.ifname(self)
	local base = netmod._M.protocol
	local ifname = base.ifname(self) -- call base class "protocol.ifname(self)"

		-- Note: ifname might be nil if the adapter could not be determined through ubus (default name to qmi-wan in this case)
	if ifname == nil then
		ifname = "fm350-" .. self.sid
	end
	return ifname
end

function proto.get_interface(self)
	return interface(self:ifname(), self)
end

function proto.opkg_package(self)
	return "fm350-modem"
end

function proto.is_installed(self)
	return nixio.fs.access("/lib/netifd/proto/fm350.sh")
end

function proto.is_floating(self)
	return true
end

function proto.is_virtual(self)
	return true
end

function proto.get_interfaces(self)
	return nil
end

function proto.contains_interface(self, ifc)
	 return (netmod:ifnameof(ifc) == self:ifname())
end

netmod:register_pattern_virtual("^fm350%-%w")