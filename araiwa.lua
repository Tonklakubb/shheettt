local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local WEBAPP_URL = "https://script.google.com/macros/s/AKfycby1vo1rw_JhDGBXF5pUwHMkKXxL8hpyNyRWjUz_bUd4_X-SBZzrKVhjxp2VKzj40WkR/exec"
local SHARED_TOKEN = "Testing"

task.wait(2)
local diamonds = player:GetAttribute("Diamonds") or 0

local qs = "token="..HttpService:UrlEncode(SHARED_TOKEN)
    .."&playerName="..HttpService:UrlEncode(player.Name)
    .."&diamonds="..HttpService:UrlEncode(tostring(diamonds))
    .."&note="..HttpService:UrlEncode("Current Diamonds")

local url = WEBAPP_URL .. "?" .. qs
local res = HttpService:RequestAsync({ Url = url, Method = "GET" })
print(res.StatusCode, res.Success, res.Body)
