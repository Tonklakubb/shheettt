local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local WEBAPP_URL = "https://script.google.com/macros/s/AKfycbx8Ylx1yaW_AdF-TGiW5cC7-lX0YGVEeTk2BF3onqqw1k5RPEGGk52Zb5Xby_FKZtz1/exec"
local SHARED_TOKEN = "Testing"

task.wait(2)

local icedTea = player:GetAttribute("IcedTea") or 0

local qs = "token="..HttpService:UrlEncode(SHARED_TOKEN)
    .."&playerName="..HttpService:UrlEncode(player.Name)
    .."&icedTea="..HttpService:UrlEncode(tostring(icedTea))
    .."&note="..HttpService:UrlEncode("Current IcedTea")

local url = WEBAPP_URL .. "?" .. qs
local res = HttpService:RequestAsync({
    Url = url,
    Method = "GET"
})
