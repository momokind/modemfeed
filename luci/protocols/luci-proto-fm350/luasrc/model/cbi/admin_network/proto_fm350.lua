-- Licensed to the public under the Apache License 2.0.

local map, section, net = ...

local device, apn, pincode, username, password, pdp
local auth, ipv6


device = section:taboption("general", Value, "device", translate("Modem device"))
device.rmempty = false

local device_suggestions = nixio.fs.glob("/dev/ttyUSB*")

if device_suggestions then
	local node
	for node in device_suggestions do
		device:value(node)
	end
end


apn = section:taboption("general", Value, "apn", translate("APN"))


username = section:taboption("general", Value, "username", translate("PAP/CHAP username"))


password = section:taboption("general", Value, "password", translate("PAP/CHAP password"))
password.password = true

auth = section:taboption("general", Value, "auth", translate("Authentication Type"))
auth:value("", translate("-- Please choose --"))
auth:value("both", "PAP/CHAP (both)")
auth:value("pap", "PAP")
auth:value("chap", "CHAP")
auth:value("none", "NONE")

pdp = section:taboption("general", Value, "pdp", translate("IP connection type"))
pdp:value("", translate("-- Please choose --"))
pdp:value("IPV4", "IPv4 only")
pdp:value("IPV6", "IPv6 only")
pdp:value("IPV4V6", "IPv4/IPv6 (both - defaults to IPv4)")