local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local WEBAPP_URL = "https://script.google.com/macros/s/AKfycbygaCcVwtue3fZpgZaOvp9DPGAg59_TrktBlm4NQFfkvEdHPksMY3KYkDoFJq0pZCnX/exec"
local SHARED_TOKEN = "Testing"

local function sendToSheet()
    local diamonds = player:GetAttribute("Diamonds") or 0
    local note = "หากลูกค้าฟาร์มเสร็จ ชื่อตัวละคร Roblox ของคุณจะหายไปและจะถูกแจ้งเตือนไปยังช่องทางที่ท่านจ้างงานเรา"


    if diamonds >= (_G.diamonds) then
        note = "เสร็จ"
    end

    local qs = "token="..HttpService:UrlEncode(SHARED_TOKEN)
        .."&playerName="..HttpService:UrlEncode(player.Name)
        .."&diamonds="..HttpService:UrlEncode(tostring(diamonds))
        .."&note="..HttpService:UrlEncode(note)

    local url = WEBAPP_URL .. (WEBAPP_URL:find("?",1,true) and "&" or "?") .. qs
    local res = HttpService:RequestAsync({ Url = url, Method = "GET" })
    print("SEND GET ->", res.StatusCode, res.Success, res.Body)
end


task.wait(2)
sendToSheet()


player:GetAttributeChangedSignal("Diamonds"):Connect(sendToSheet)
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local diamonds = player:GetAttribute("Diamonds") or 0
if diamonds >= (_G.diamonds) then
    wait(10)
    game.Players.LocalPlayer:Kick("Done")
end
