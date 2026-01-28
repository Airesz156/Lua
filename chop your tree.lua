local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/airesz178/Ui-Library/main/Elerium%20v2'))()
local window = Library:AddWindow(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(250, 346),
	toggle_key = Enum.KeyCode.Equals,
	can_resize = true,
})
local Tab1 = window:AddTab("Main")

function getool()
   for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
      if v.Name == "Axe" then
          game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
      end
   end
end

function tptree()
   for i,v in pairs(game.Workspace.Plots:GetDescendants()) do
        if v.Name == "PlrName" and v.Text == game.Players.LocalPlayer.DisplayName then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.PlotContents.TreeSpawn.CFrame * CFrame.new(0,2,0)
        end
    end
end

function checktree()
   for i,v in pairs(game.Workspace.Plots:GetDescendants()) do
        if v.Name == "PlrName" and v.Text == game.Players.LocalPlayer.DisplayName then
            return v.Parent.Parent.Parent
        end
    end
end

Tab1:AddSwitch("Auto Chop", function(v)
	 getgenv().chop = v
		while getgenv().chop do
		    wait()
		    game:GetService("ReplicatedStorage").Remotes.AxeSwing:FireServer()
		    getool()
            tptree()
	    end
end)

Tab1:AddSwitch("Auto Click", function(v)
	 getgenv().click = v
		while getgenv().click do
		    wait()
		    local args = {
                [1] = checktree()
            }
            game:GetService("ReplicatedStorage").Remotes.TapButtonClick:FireServer(unpack(args))
		end
end)

Tab1:AddSwitch("Auto Collect Coin", function(v)
	 getgenv().coin = v
		while getgenv().coin do
		    wait()
		    for i,v in pairs(game.Workspace.Orbs:GetDescendants()) do
                if v.Name == "HitBox" and v.Parent.Name == "Coin" then
                    v.Parent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
		end
end)

Tab1:AddSwitch("Auto Collect Star", function(v)
	 getgenv().star = v
		while getgenv().star do
		    wait()
		    for i,v in pairs(game.Workspace.Orbs:GetDescendants()) do
                if v.Name == "HitBox" and v.Parent.Name == "EventCurrency" then
                    v.Parent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
		end
end)

Tab1:AddSwitch("Auto Prestige", function(v)
	 getgenv().prestige = v
		while getgenv().prestige do
		    wait()
		    game:GetService("ReplicatedStorage").Remotes.Prestige:InvokeServer()
	    end
end)

Tab1:Show()