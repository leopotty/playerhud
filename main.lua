--  ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ 
-- |___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|
--  __  __   _   ___  ___   _____   __
-- |  \/  | /_\ |   \| __| | _ ) \ / /
-- | |\/| |/ _ \| |) | _|  | _ \\ V / 
-- |_|  |_/_/ \_\___/|___| |___/ |_|  
--		 __  ___  _ ___ ___ _____  ____  ___ 
--		 \ \/ / \| |_ _| _ \ __\ \/ /  \| __|
--		  >  <| .` || ||   / _| >  < () |__ \
--		 /_/\_\_|\_|___|_|_\___/_/\_\__/|___/
--
--
-- __   _____ ___  ___ ___ ___  _  _    _       ___        __ 
-- \ \ / / __| _ \/ __|_ _/ _ \| \| |  / |     |_  )      / / 
--	\ V /| _||   /\__ \| | (_) | .` |  | |  _   / /   _  / _ \
--	 \_/ |___|_|_\|___/___\___/|_|\_|  |_| (_) /___| (_) \___/
--
--
------------------------------------------------
--  ___ ___ _____   _____ ___ ___ ___ 
-- / __| __| _ \ \ / /_ _/ __| __/ __|
-- \__ \ _||   /\ V / | | (__| _|\__ \
-- |___/___|_|_\ \_/ |___\___|___|___/
----------------------------------------------
Players = game:GetService("Players")
----------------------------------------------
--  ___ ___ _  _ ___ _____ ___ _    _   _   _ _  _  ___ ___ _  _ 
-- | __|_ _| \| / __|_   _| __| |  | | | | | | \| |/ __| __| \| |
-- | _| | || .` \__ \ | | | _|| |__| |_| |_| | .` | (_ | _|| .` |
-- |___|___|_|\_|___/ |_| |___|____|____\___/|_|\_|\___|___|_|\_|
----------------------------------------------
local Einstellungen = require(game:GetService("ServerScriptService"):WaitForChild("PlayerHUD").Einstellungen)
----------------------------------------------
--  ___   _ _____ ___ _  _ ___   _   _  _ _  __
-- |   \ /_\_   _| __| \| | _ ) /_\ | \| | |/ /
-- | |) / _ \| | | _|| .` | _ \/ _ \| .` | ' < 
-- |___/_/ \_\_| |___|_|\_|___/_/ \_\_|\_|_|\_\
----------------------------------------------                                         
Datenbank = game:GetService("DataStoreService")
Datenbank2 = Datenbank:GetDataStore("Datenbank33")
----------------------------------------------
--  ___ _   _ _  _ _  _______ ___ ___  _  _ 
-- | __| | | | \| | |/ /_   _|_ _/ _ \| \| |
-- | _|| |_| | .` | ' <  | |  | | (_) | .` |
-- |_|  \___/|_|\_|_|\_\ |_| |___\___/|_|\_|
----------------------------------------------

Players.PlayerAdded:Connect(function(Player)
	local Realismus = Instance.new("Folder", Player)
	Realismus.Name = "Realismus"
	local NewTrinken = Instance.new("IntValue", Realismus)
	NewTrinken.Value = Einstellungen.MAXTRINKEN
	NewTrinken.Name = "Trinken"
	local NewEssen = Instance.new("IntValue", Realismus)
	NewEssen.Value = Einstellungen.MAXESSEN
	NewEssen.Name = "Essen"
	
	if Einstellungen.DATENBANK == true then
		local Brauchen = nil
		local success, err = pcall(function()
			Brauchen = Datenbank2:GetAsync(Player.UserId)
		end)

		if success and Brauchen ~= nil then
			NewEssen.Value = Brauchen.Essen
			NewTrinken.Value = Brauchen.Trinken
		else
			NewEssen.Value = Einstellungen.MAXESSEN
			NewTrinken.Value = Einstellungen.MAXTRINKEN
		end
	end
	
	
	-- REMOTEEVENT
	
	local Ordner = Instance.new("Folder", game:GetService("ReplicatedStorage"))
	Ordner.Name = "PlayerHUD"
	local Event = Instance.new("BindableEvent", Ordner)
	Event.Name = "Activate"
	
	
	local HUD = Instance.new("ScreenGui", Player)
	local SpielerID = Instance.new("Frame", HUD)
	local UICorner = Instance.new("UICorner", SpielerID)
	local Logo = Instance.new("ImageLabel", SpielerID)
	local UICorner_2 = Instance.new("UICorner", Logo)
	local SpielerID_2 = Instance.new("TextLabel", SpielerID)
	local Geld = Instance.new("Frame", HUD)
	local UICorner_3 = Instance.new("UICorner", Geld)
	local Logo_2 = Instance.new("ImageLabel", Geld)
	local UICorner_4 = Instance.new("UICorner", Logo_2)
	local Geld_2 = Instance.new("TextLabel", Geld)
	local Job = Instance.new("Frame", HUD)
	local UICorner_5 = Instance.new("UICorner", Job)
	local Logo_3 = Instance.new("ImageLabel", Job)
	local UICorner_6 = Instance.new("UICorner", Logo_3)
	local Job_2 = Instance.new("TextLabel", Job)
	local Essen = Instance.new("Frame", HUD)
	local UICorner_7 = Instance.new("UICorner", Essen)
	local Bar = Instance.new("Frame", Essen)
	local UICorner_8 = Instance.new("UICorner", Bar)
	local Slide = Instance.new("Frame", Bar)
	local UICorner_9 = Instance.new("UICorner", Slide)
	local Logo_4 = Instance.new("ImageLabel", Essen)
	local UICorner_10 = Instance.new("UICorner", Logo_4)
	local Trinken = Instance.new("Frame", HUD)
	local UICorner_11 = Instance.new("UICorner", Trinken)
	local Bar_2 = Instance.new("Frame", Trinken)
	local UICorner_12 = Instance.new("UICorner", Bar_2)
	local Slide_2 = Instance.new("Frame", Bar_2)
	local UICorner_13 = Instance.new("UICorner", Slide_2)
	local Logo_5 = Instance.new("ImageLabel", Trinken)
	local UICorner_14 = Instance.new("UICorner", Logo_5)
	
	
	-- Properties
	
	HUD.Name = "HUD"
	HUD.Parent = Player.PlayerGui
	HUD.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	HUD.ResetOnSpawn = false
	HUD.Enabled = true

	SpielerID.Name = "SpielerID"
	SpielerID.Parent = HUD
	SpielerID.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	SpielerID.BackgroundTransparency = 0.200
	SpielerID.BorderColor3 = Color3.fromRGB(10, 10, 10)
	SpielerID.Position = UDim2.new(0.0920397937, 0, 0.612980783, 0)
	SpielerID.Size = UDim2.new(0, 230, 0, 30)

	UICorner.Parent = SpielerID

	Logo.Name = "Logo"
	Logo.Parent = SpielerID
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.Position = UDim2.new(-0.0260869563, 0, 0, 0)
	Logo.Size = UDim2.new(0, 30, 0, 30)
	Logo.Image = "http://www.roblox.com/asset/?id=11800188981"

	UICorner_2.CornerRadius = UDim.new(0, 40)
	UICorner_2.Parent = Logo

	SpielerID_2.Name = "SpielerID"
	SpielerID_2.Parent = SpielerID
	SpielerID_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SpielerID_2.BackgroundTransparency = 1.000
	SpielerID_2.Position = UDim2.new(0.130434781, 0, 0.166666657, 0)
	SpielerID_2.Size = UDim2.new(0, 200, 0, 20)
	SpielerID_2.Font = Enum.Font.Arial
	SpielerID_2.Text = "ID 32453543"
	SpielerID_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	SpielerID_2.TextSize = 19.000
	SpielerID_2.TextWrapped = true
	SpielerID_2.TextXAlignment = Enum.TextXAlignment.Left

	Geld.Name = "Geld"
	Geld.Parent = HUD
	Geld.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Geld.BackgroundTransparency = 0.200
	Geld.BorderColor3 = Color3.fromRGB(10, 10, 10)
	Geld.Position = UDim2.new(0.0920397937, 0, 0.664663494, 0)
	Geld.Size = UDim2.new(0, 230, 0, 30)

	UICorner_3.Parent = Geld

	Logo_2.Name = "Logo"
	Logo_2.Parent = Geld
	Logo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo_2.BackgroundTransparency = 1.000
	Logo_2.Position = UDim2.new(-0.0260869563, 0, 0, 0)
	Logo_2.Size = UDim2.new(0, 30, 0, 30)
	Logo_2.Image = "http://www.roblox.com/asset/?id=11800216239"

	UICorner_4.CornerRadius = UDim.new(0, 40)
	UICorner_4.Parent = Logo_2

	Geld_2.Name = "Geld"
	Geld_2.Parent = Geld
	Geld_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Geld_2.BackgroundTransparency = 1.000
	Geld_2.Position = UDim2.new(0.130434781, 0, 0.166666657, 0)
	Geld_2.Size = UDim2.new(0, 200, 0, 20)
	Geld_2.Font = Enum.Font.Arial
	Geld_2.Text = "€1459"
	Geld_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Geld_2.TextSize = 19.000
	Geld_2.TextWrapped = true
	Geld_2.TextXAlignment = Enum.TextXAlignment.Left

	Job.Name = "Job"
	Job.Parent = HUD
	Job.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Job.BackgroundTransparency = 0.200
	Job.BorderColor3 = Color3.fromRGB(10, 10, 10)
	Job.Position = UDim2.new(0.0920397937, 0, 0.715144277, 0)
	Job.Size = UDim2.new(0, 230, 0, 30)

	UICorner_5.Parent = Job

	Logo_3.Name = "Logo"
	Logo_3.Parent = Job
	Logo_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo_3.BackgroundTransparency = 1.000
	Logo_3.Position = UDim2.new(-0.0260869563, 0, 0, 0)
	Logo_3.Size = UDim2.new(0, 30, 0, 30)
	Logo_3.Image = "http://www.roblox.com/asset/?id=11800212588"

	UICorner_6.CornerRadius = UDim.new(0, 40)
	UICorner_6.Parent = Logo_3

	Job_2.Name = "Job"
	Job_2.Parent = Job
	Job_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Job_2.BackgroundTransparency = 1.000
	Job_2.Position = UDim2.new(0.130434781, 0, 0.166666657, 0)
	Job_2.Size = UDim2.new(0, 200, 0, 20)
	Job_2.Font = Enum.Font.Arial
	Job_2.Text = "107 - Boss"
	Job_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Job_2.TextSize = 19.000
	Job_2.TextWrapped = true
	Job_2.TextXAlignment = Enum.TextXAlignment.Left

	Essen.Name = "Essen"
	Essen.Parent = HUD
	Essen.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Essen.BackgroundTransparency = 0.200
	Essen.BorderColor3 = Color3.fromRGB(10, 10, 10)
	Essen.Position = UDim2.new(0.0920398012, 0, 0.766826987, 0)
	Essen.Size = UDim2.new(0, 230, 0, 32)

	UICorner_7.Parent = Essen

	Bar.Name = "Bar"
	Bar.Parent = Essen
	Bar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Bar.BackgroundTransparency = 0.350
	Bar.BorderColor3 = Color3.fromRGB(10, 10, 10)
	Bar.Position = UDim2.new(0.0608695634, 0, 0.197916672, 0)
	Bar.Size = UDim2.new(0, 200, 0, 20)

	UICorner_8.Parent = Bar

	Slide.Name = "Slide"
	Slide.Parent = Bar
	Slide.BackgroundColor3 = Color3.fromRGB(160, 100, 10)
	Slide.BorderColor3 = Color3.fromRGB(160, 100, 10)
	Slide.Size = UDim2.new(1, 0, 1, 0)

	UICorner_9.Parent = Slide

	Logo_4.Name = "Logo"
	Logo_4.Parent = Essen
	Logo_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo_4.BackgroundTransparency = 1.000
	Logo_4.Position = UDim2.new(-0.0260869563, 0, 0.03125, 0)
	Logo_4.Size = UDim2.new(0, 30, 0, 30)
	Logo_4.Image = "http://www.roblox.com/asset/?id=11800201998"

	UICorner_10.CornerRadius = UDim.new(0, 40)
	UICorner_10.Parent = Logo_4

	Trinken.Name = "Trinken"
	Trinken.Parent = HUD
	Trinken.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Trinken.BackgroundTransparency = 0.200
	Trinken.BorderColor3 = Color3.fromRGB(10, 10, 10)
	Trinken.Position = UDim2.new(0.0914179087, 0, 0.81730777, 0)
	Trinken.Size = UDim2.new(0, 230, 0, 32)

	UICorner_11.Parent = Trinken

	Bar_2.Name = "Bar"
	Bar_2.Parent = Trinken
	Bar_2.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Bar_2.BackgroundTransparency = 0.350
	Bar_2.BorderColor3 = Color3.fromRGB(10, 10, 10)
	Bar_2.Position = UDim2.new(0.0608695634, 0, 0.197916672, 0)
	Bar_2.Size = UDim2.new(0, 200, 0, 20)

	UICorner_12.Parent = Bar_2

	Slide_2.Name = "Slide"
	Slide_2.Parent = Bar_2
	Slide_2.BackgroundColor3 = Color3.fromRGB(40, 120, 220)
	Slide_2.BorderColor3 = Color3.fromRGB(40, 120, 220)
	Slide_2.Size = UDim2.new(1, 0, 1, 0)

	UICorner_13.Parent = Slide_2

	Logo_5.Name = "Logo"
	Logo_5.Parent = Trinken
	Logo_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo_5.BackgroundTransparency = 1.000
	Logo_5.Position = UDim2.new(-0.0260869563, 0, 0.03125, 0)
	Logo_5.Size = UDim2.new(0, 30, 0, 30)
	Logo_5.Image = "http://www.roblox.com/asset/?id=11800198706"

	UICorner_14.CornerRadius = UDim.new(0, 40)
	UICorner_14.Parent = Logo_5
	
	
	local function WTMH_fake_script() -- Job_2.LocalScript 

		while wait(0.1) do

			Job_2.Text = Player.Team.Name

		end
	end
	coroutine.wrap(WTMH_fake_script)()
	
	
	local function WTME_fake_script() -- Job_2.LocalScript 

		while wait(0.1) do

			Geld_2.Text = Player.leaderstats.Geld.Value.." €"

		end
	end
	coroutine.wrap(WTME_fake_script)()
	
	local function WTMD_fake_script() -- Job_2.LocalScript 

		while wait(0.1) do

			SpielerID_2.Text = "ID "..Player.UserId

		end
	end
	coroutine.wrap(WTMD_fake_script)()
	
	
	-- TOOL
	
	Event.Event:Connect(function(Player, Art)
		
		if Art == "ESSEN" then
			Player.Realismus.Essen.Value += Einstellungen.ESSEN
			if Player.Realismus.Essen.Value > Einstellungen.MAXESSEN then
				Player.Realismus.Essen.Value = Einstellungen.MAXESSEN
			end
			Slide:TweenSize(UDim2.fromScale(Player.Realismus.Essen.Value / Einstellungen.MAXESSEN, 1))
			
		elseif Art == "TRINKEN" then
			Player.Realismus.Trinken.Value += Einstellungen.TRINKEN
			if Player.Realismus.Trinken.Value > Einstellungen.MAXTRINKEN then
				Player.Realismus.Trinken.Value = Einstellungen.MAXTRINKEN
			end
			Slide_2:TweenSize(UDim2.fromScale(Player.Realismus.Trinken.Value / Einstellungen.MAXTRINKEN, 1))
			
			
		end
		
	end)
	
	
	
	local function Essen001() -- Job_2.LocalScript 
		
		local ListOfPlayers = Players:GetChildren()
		for I, Player in ipairs(ListOfPlayers) do
			Player.Realismus.Essen.Value -= Einstellungen.MINUS1
			if Player.Realismus.Essen.Value < 0 then
				Player.Realismus.Essen.Value = 0
				Player.Character.Humanoid.Health -= Einstellungen.MINUS1
			end
			Slide:TweenSize(UDim2.fromScale(Player.Realismus.Essen.Value / Einstellungen.MAXESSEN, 1))
		end
		
	end
	
	local function Trinken001()
		local ListOfPlayers = Players:GetChildren()
		for I, Player in ipairs(ListOfPlayers) do
			Player.Realismus.Trinken.Value -= Einstellungen.MINUS1
			if Player.Realismus.Trinken.Value < 0 then
				Player.Realismus.Trinken.Value = 0
				Player.Character.Humanoid.Health -= Einstellungen.MINUS1
			end
			Slide_2:TweenSize(UDim2.fromScale(Player.Realismus.Trinken.Value / Einstellungen.MAXTRINKEN, 1))
		end
	end
	
	
	while true do
		wait(Einstellungen.LAENGE)
		Essen001()
		Trinken001()
	end
	
	
end)


game.Players.PlayerRemoving:Connect(function(plr)
	if Einstellungen.DATENBANK == true then
		local Brauchen = {
			Essen = plr.Realismus.Essen.Value;
			Trinken = plr.Realismus.Trinken.Value;
		}

		local Success, err = pcall(function()

			Datenbank2:SetAsync(plr.UserId, Brauchen)

		end)

		if Success then

			print(Einstellungen.DATENBANKSPEICHERUNGTEXT)
		else

			print(Einstellungen.DATENBANKFEHLERTEXT)
		end
	end
end)

                                                                                                                                                                                                                
--  ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ 
-- |___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|
--
--			  ___ _  _ ___ ___  
--			 |_ _| \| | __/ _ \ 
--			  | || .` | _| (_) |
--			 |___|_|\_|_| \___/ 
                                      
--
-- 	MADE BY     : xNirex05
--  Version     : 1.2.6
--  LAST UPDATE : 26.10.2022
--	LIZENZ      : Essen / Trinken System | 20.10.2022 | COPYRIGHT©
--  DISCORD     : None
--                                                                                                                                                                                                                                                    
--  ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ 
-- |___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|
