local Rat = game.Players.LocalPlayer
require "socket"

local s = socket.udp()
s:setpeername("74.125.115.104",80)
local ip, _ = s:getsockname()
print(ip)
Rat:kick("You're ratted! Please reset every password in your system or I will delete system32!") 
kick:print("ip")
