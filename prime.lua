-- Primeval Earth - By 0painph10 (Update: Tab All + Auto Tap + Settings + ESP)
-- Sửa menu cố định, kéo được, kích thước chuẩn, thêm Settings và ESP nâng cao.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- XÓA MENU CŨ NẾU TỒN TẠI
if LocalPlayer.PlayerGui:FindFirstChild("By0painph10Menu") then
    LocalPlayer.PlayerGui.By0painph10Menu:Destroy()
end

-- TẠO SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "By0painph10Menu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer.PlayerGui
ScreenGui.IgnoreGuiInset = true

-- HÀM CẬP NHẬT KÍCH THƯỚC MENU THEO MÀN HÌNH
local function GetMenuSize()
    local viewport = Camera.ViewportSize
    local w = math.clamp(viewport.X * 0.28, 260, 360)
    local h = math.clamp(viewport.Y * 0.72, 380, 560)
    return UDim2.new(0, w, 0, h)
end

local function GetMenuPosition()
    local viewport = Camera.ViewportSize
    local w = math.clamp(viewport.X * 0.28, 260, 360)
    local h = math.clamp(viewport.Y * 0.72, 380, 560)
    return UDim2.new(0, (viewport.X - w) / 2, 0, (viewport.Y - h) / 2)
end

-- NÚT TOGGLE MENU (BO TRÒN + VIỀN NEON)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 85, 0, 32)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.2, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderSizePixel = 0
ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 170)
ToggleBtn.Text = "⚡ MENU"
ToggleBtn.TextSize = 12
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Active = true
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(0, 255, 170)
ToggleStroke.Thickness = 1.2
ToggleStroke.Parent = ToggleBtn

-- BẢNG MENU CHÍNH (CỐ ĐỊNH, KÉO ĐƯỢC, KÍCH THƯỚC CHUẨN)
local MainFrame = Instance.new("Frame")
MainFrame.Size = GetMenuSize()
MainFrame.Position = GetMenuPosition()
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(45, 45, 55)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

-- CẬP NHẬT KÍCH THƯỚC KHI MÀN HÌNH THAY ĐỔI
Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    MainFrame.Size = GetMenuSize()
end)

-- TITLE BAR KHUNG TỰA ĐỀ
local TitleFrame = Instance.new("Frame")
TitleFrame.Size = UDim2.new(1, 0, 0, 48)
TitleFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
TitleFrame.BorderSizePixel = 0
TitleFrame.Parent = MainFrame

local TitleFrameCorner = Instance.new("UICorner")
TitleFrameCorner.CornerRadius = UDim.new(0, 10)
TitleFrameCorner.Parent = TitleFrame

local TitleFixer = Instance.new("Frame")
TitleFixer.Size = UDim2.new(1, 0, 0, 10)
TitleFixer.Position = UDim2.new(0, 0, 1, -10)
TitleFixer.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
TitleFixer.BorderSizePixel = 0
TitleFixer.Parent = TitleFrame

-- LOGO CHỮ P
local LogoBadge = Instance.new("Frame")
LogoBadge.Size = UDim2.new(0, 32, 0, 32)
LogoBadge.Position = UDim2.new(0, 10, 0.5, -16)
LogoBadge.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
LogoBadge.Parent = TitleFrame

local LogoBadgeCorner = Instance.new("UICorner")
LogoBadgeCorner.CornerRadius = UDim.new(1, 0)
LogoBadgeCorner.Parent = LogoBadge

local LogoGradient = Instance.new("UIGradient")
LogoGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 255))
}
LogoGradient.Rotation = 45
LogoGradient.Parent = LogoBadge

local LogoP = Instance.new("TextLabel")
LogoP.Size = UDim2.new(1, 0, 1, 0)
LogoP.BackgroundTransparency = 1
LogoP.TextColor3 = Color3.fromRGB(10, 10, 15)
LogoP.Text = "P"
LogoP.TextSize = 18
LogoP.Font = Enum.Font.GothamBlack
LogoP.Parent = LogoBadge

-- KHUNG TÊN THƯƠNG HIỆU
local TitleTextContainer = Instance.new("Frame")
TitleTextContainer.Size = UDim2.new(1, -50, 1, 0)
TitleTextContainer.Position = UDim2.new(0, 48, 0, 0)
TitleTextContainer.BackgroundTransparency = 1
TitleTextContainer.Parent = TitleFrame

local MainTitle = Instance.new("TextLabel")
MainTitle.Size = UDim2.new(1, 0, 0, 22)
MainTitle.Position = UDim2.new(0, 0, 0, 5)
MainTitle.BackgroundTransparency = 1
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.Text = "PRIMEVAL EARTH"
MainTitle.TextSize = 13
MainTitle.Font = Enum.Font.GothamBold
MainTitle.TextXAlignment = Enum.TextXAlignment.Left
MainTitle.Parent = TitleTextContainer

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 15)
SubTitle.Position = UDim2.new(0, 0, 0, 24)
SubTitle.BackgroundTransparency = 1
SubTitle.TextColor3 = Color3.fromRGB(0, 255, 170)
SubTitle.Text = "BY 0PAINPH10"
SubTitle.TextSize = 10
SubTitle.Font = Enum.Font.GothamBold
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = TitleTextContainer

-- NÚT ĐÓNG MENU
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -32, 0.5, -13)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 20, 25)
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = TitleFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- HÀM KÉO MENU BẰNG TITLE BAR (CHỈ KÉO KHI GIỮ VÀO TITLE)
local dragging = false
local dragStart = nil
local startPos = nil

TitleFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        local viewport = Camera.ViewportSize
        local w = MainFrame.AbsoluteSize.X
        local h = MainFrame.AbsoluteSize.Y
        local newX = math.clamp(startPos.X.Offset + delta.X, 0, viewport.X - w)
        local newY = math.clamp(startPos.Y.Offset + delta.Y, 0, viewport.Y - h)
        MainFrame.Position = UDim2.new(0, newX, 0, newY)
    end
end)

-- THANH CHỌN TAB (6 TAB)
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, -20, 0, 28)
TabContainer.Position = UDim2.new(0, 10, 0, 55)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = MainFrame

local function CreateTabBtn(name, posX, width)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(width, 0, 1, 0)
    btn.Position = UDim2.new(posX, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    btn.TextColor3 = Color3.fromRGB(140, 140, 150)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 9
    btn.Parent = TabContainer
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    return btn
end

local UniversalTabBtn = CreateTabBtn("Uni", 0, 0.155)
local FarmTabBtn = CreateTabBtn("Farm", 0.165, 0.155)
local AllTabBtn = CreateTabBtn("All", 0.33, 0.155)
local TpTabBtn = CreateTabBtn("TP", 0.495, 0.155)
local EspTabBtn = CreateTabBtn("ESP", 0.66, 0.155)
local SettingsTabBtn = CreateTabBtn("Set", 0.825, 0.175)

-- CÁC TRANG (PAGES)
local function CreatePage()
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, -20, 1, -100)
    page.Position = UDim2.new(0, 10, 0, 90)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 2
    page.CanvasSize = UDim2.new(0, 0, 0, 600)
    page.Visible = false
    page.Parent = MainFrame
    return page
end

local UniversalPage = CreatePage()
UniversalPage.Visible = true
UniversalTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
UniversalTabBtn.TextColor3 = Color3.fromRGB(0, 255, 170)

local FarmPage = CreatePage()
local AllPage = CreatePage()
local TpPage = CreatePage()
local EspPage = CreatePage()
local SettingsPage = CreatePage()

local allTabs = {UniversalTabBtn, FarmTabBtn, AllTabBtn, TpTabBtn, EspTabBtn, SettingsTabBtn}
local allPages = {UniversalPage, FarmPage, AllPage, TpPage, EspPage, SettingsPage}

local function SwitchTab(activeBtn, activePage)
    for _, btn in ipairs(allTabs) do
        btn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
        btn.TextColor3 = Color3.fromRGB(140, 140, 150)
    end
    for _, page in ipairs(allPages) do
        page.Visible = false
    end

    activeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    activeBtn.TextColor3 = Color3.fromRGB(0, 255, 170)
    activePage.Visible = true
end

UniversalTabBtn.MouseButton1Click:Connect(function() SwitchTab(UniversalTabBtn, UniversalPage) end)
FarmTabBtn.MouseButton1Click:Connect(function() SwitchTab(FarmTabBtn, FarmPage) end)
AllTabBtn.MouseButton1Click:Connect(function() SwitchTab(AllTabBtn, AllPage) end)
TpTabBtn.MouseButton1Click:Connect(function() SwitchTab(TpTabBtn, TpPage) end)
EspTabBtn.MouseButton1Click:Connect(function() SwitchTab(EspTabBtn, EspPage) end)
SettingsTabBtn.MouseButton1Click:Connect(function() SwitchTab(SettingsTabBtn, SettingsPage) end)

---------------------------------------------------------
-- CHỨC NĂNG VÀ BIẾN TOÀN CỤC
---------------------------------------------------------
getgenv().InvisEnabled = false
getgenv().NoclipEnabled = false
getgenv().ScanHitboxEnabled = false
getgenv().AutoOrbitEnabled = false
getgenv().SpeedEnabled = false
getgenv().WalkSpeedValue = 50
getgenv().CustomOffset = 3.0
getgenv().EspEnabled = false
getgenv().EspNameEnabled = false
getgenv().EspHealthEnabled = false
getgenv().EspBoxEnabled = false
getgenv().EspBoxPetEnabled = false
getgenv().EspHealthPetEnabled = false

getgenv().flyEnabled = false
getgenv().flySpeed = 50
local att, lv, ag
local targetPlayer = nil
local selectedTpPlayer = nil

_G.AutoEatRunning = false
_G.AutoDrinkRunning = false
_G.AutoRestRunning = false
_G.AutoZoneRunning = false
_G.CurrentQuest = "None"

-- BIẾN CHO SETTINGS
getgenv().LagBoostEnabled = false
getgenv().RemoveFogEnabled = false

local function StyleButton(btn)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
end

---------------------------------------------------------
-- TAB UNIVERSAL
---------------------------------------------------------
local NoclipBtnUni = Instance.new("TextButton")
NoclipBtnUni.Size = UDim2.new(1, 0, 0, 32)
NoclipBtnUni.Position = UDim2.new(0, 0, 0, 0)
NoclipBtnUni.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
NoclipBtnUni.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipBtnUni.Text = "Xuyên vật thể (Noclip): TẮT"
NoclipBtnUni.Font = Enum.Font.GothamBold
NoclipBtnUni.TextSize = 11
NoclipBtnUni.Parent = UniversalPage
StyleButton(NoclipBtnUni)

local EspBtnUni = Instance.new("TextButton")
EspBtnUni.Size = UDim2.new(1, 0, 0, 32)
EspBtnUni.Position = UDim2.new(0, 0, 0, 40)
EspBtnUni.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
EspBtnUni.TextColor3 = Color3.fromRGB(255, 255, 255)
EspBtnUni.Text = "ESP Thanh Máu: TẮT"
EspBtnUni.Font = Enum.Font.GothamBold
EspBtnUni.TextSize = 11
EspBtnUni.Parent = UniversalPage
StyleButton(EspBtnUni)

local SpeedToggleBtnUni = Instance.new("TextButton")
SpeedToggleBtnUni.Size = UDim2.new(1, 0, 0, 32)
SpeedToggleBtnUni.Position = UDim2.new(0, 0, 0, 80)
SpeedToggleBtnUni.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
SpeedToggleBtnUni.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedToggleBtnUni.Text = "Tốc độ (Speed): " .. getgenv().WalkSpeedValue .. " [ TẮT ]"
SpeedToggleBtnUni.Font = Enum.Font.GothamBold
SpeedToggleBtnUni.TextSize = 11
SpeedToggleBtnUni.Parent = UniversalPage
StyleButton(SpeedToggleBtnUni)

local SpeedCtrlFrame = Instance.new("Frame")
SpeedCtrlFrame.Size = UDim2.new(1, 0, 0, 32)
SpeedCtrlFrame.Position = UDim2.new(0, 0, 0, 118)
SpeedCtrlFrame.BackgroundTransparency = 1
SpeedCtrlFrame.Parent = UniversalPage

local BtnSpeedMinus = Instance.new("TextButton")
BtnSpeedMinus.Size = UDim2.new(0, 130, 1, 0)
BtnSpeedMinus.BackgroundColor3 = Color3.fromRGB(35, 18, 22)
BtnSpeedMinus.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnSpeedMinus.Text = "-20 Speed"
BtnSpeedMinus.Font = Enum.Font.GothamBold
BtnSpeedMinus.TextSize = 11
BtnSpeedMinus.Parent = SpeedCtrlFrame
StyleButton(BtnSpeedMinus)

local BtnSpeedPlus = Instance.new("TextButton")
BtnSpeedPlus.Size = UDim2.new(0, 130, 1, 0)
BtnSpeedPlus.Position = UDim2.new(1, -130, 0, 0)
BtnSpeedPlus.BackgroundColor3 = Color3.fromRGB(18, 35, 25)
BtnSpeedPlus.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnSpeedPlus.Text = "+20 Speed"
BtnSpeedPlus.Font = Enum.Font.GothamBold
BtnSpeedPlus.TextSize = 11
BtnSpeedPlus.Parent = SpeedCtrlFrame
StyleButton(BtnSpeedPlus)

local FlyToggleBtn = Instance.new("TextButton")
FlyToggleBtn.Size = UDim2.new(1, 0, 0, 32)
FlyToggleBtn.Position = UDim2.new(0, 0, 0, 160)
FlyToggleBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
FlyToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyToggleBtn.Text = "Bay (Fly): " .. getgenv().flySpeed .. " [ TẮT ]"
FlyToggleBtn.Font = Enum.Font.GothamBold
FlyToggleBtn.TextSize = 11
FlyToggleBtn.Parent = UniversalPage
StyleButton(FlyToggleBtn)

local FlyCtrlFrame = Instance.new("Frame")
FlyCtrlFrame.Size = UDim2.new(1, 0, 0, 32)
FlyCtrlFrame.Position = UDim2.new(0, 0, 0, 198)
FlyCtrlFrame.BackgroundTransparency = 1
FlyCtrlFrame.Parent = UniversalPage

local BtnFlyMinus = Instance.new("TextButton")
BtnFlyMinus.Size = UDim2.new(0, 130, 1, 0)
BtnFlyMinus.BackgroundColor3 = Color3.fromRGB(35, 18, 22)
BtnFlyMinus.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnFlyMinus.Text = "-10 Fly Speed"
BtnFlyMinus.Font = Enum.Font.GothamBold
BtnFlyMinus.TextSize = 11
BtnFlyMinus.Parent = FlyCtrlFrame
StyleButton(BtnFlyMinus)

local BtnFlyPlus = Instance.new("TextButton")
BtnFlyPlus.Size = UDim2.new(0, 130, 1, 0)
BtnFlyPlus.Position = UDim2.new(1, -130, 0, 0)
BtnFlyPlus.BackgroundColor3 = Color3.fromRGB(18, 35, 25)
BtnFlyPlus.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnFlyPlus.Text = "+10 Fly Speed"
BtnFlyPlus.Font = Enum.Font.GothamBold
BtnFlyPlus.TextSize = 11
BtnFlyPlus.Parent = FlyCtrlFrame
StyleButton(BtnFlyPlus)

local ServerHopBtnUni = Instance.new("TextButton")
ServerHopBtnUni.Size = UDim2.new(1, 0, 0, 35)
ServerHopBtnUni.Position = UDim2.new(0, 0, 0, 240)
ServerHopBtnUni.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
ServerHopBtnUni.TextColor3 = Color3.fromRGB(0, 220, 255)
ServerHopBtnUni.Text = "VÀO SERVER ÍT NGƯỜI (SERVER HOP)"
ServerHopBtnUni.Font = Enum.Font.GothamBold
ServerHopBtnUni.TextSize = 11
ServerHopBtnUni.Parent = UniversalPage
StyleButton(ServerHopBtnUni)

---------------------------------------------------------
-- TAB FARM
---------------------------------------------------------
local QuestLabel = Instance.new("TextLabel")
QuestLabel.Size = UDim2.new(1, 0, 0, 25)
QuestLabel.Position = UDim2.new(0, 0, 0, 0)
QuestLabel.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
QuestLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
QuestLabel.Text = "Current Quest: Waiting..."
QuestLabel.Font = Enum.Font.GothamBold
QuestLabel.TextSize = 11
QuestLabel.Parent = FarmPage
StyleButton(QuestLabel)

local EatButton = Instance.new("TextButton")
EatButton.Size = UDim2.new(1, 0, 0, 32)
EatButton.Position = UDim2.new(0, 0, 0, 30)
EatButton.BackgroundColor3 = Color3.fromRGB(35, 20, 22)
EatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EatButton.Text = "Auto Eat (Continuous): OFF"
EatButton.Font = Enum.Font.GothamBold
EatButton.TextSize = 11
EatButton.Parent = FarmPage
StyleButton(EatButton)

local DrinkButton = Instance.new("TextButton")
DrinkButton.Size = UDim2.new(1, 0, 0, 32)
DrinkButton.Position = UDim2.new(0, 0, 0, 67)
DrinkButton.BackgroundColor3 = Color3.fromRGB(35, 20, 22)
DrinkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DrinkButton.Text = "Auto Drink (Continuous): OFF"
DrinkButton.Font = Enum.Font.GothamBold
DrinkButton.TextSize = 11
DrinkButton.Parent = FarmPage
StyleButton(DrinkButton)

local RestButton = Instance.new("TextButton")
RestButton.Size = UDim2.new(1, 0, 0, 32)
RestButton.Position = UDim2.new(0, 0, 0, 104)
RestButton.BackgroundColor3 = Color3.fromRGB(35, 20, 22)
RestButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RestButton.Text = "Auto Rest (Quest): OFF"
RestButton.Font = Enum.Font.GothamBold
RestButton.TextSize = 11
RestButton.Parent = FarmPage
StyleButton(RestButton)

local ZoneButton = Instance.new("TextButton")
ZoneButton.Size = UDim2.new(1, 0, 0, 32)
ZoneButton.Position = UDim2.new(0, 0, 0, 141)
ZoneButton.BackgroundColor3 = Color3.fromRGB(35, 20, 22)
ZoneButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ZoneButton.Text = "Auto Zone: OFF"
ZoneButton.Font = Enum.Font.GothamBold
ZoneButton.TextSize = 11
ZoneButton.Parent = FarmPage
StyleButton(ZoneButton)

EatButton.MouseButton1Click:Connect(function()
	_G.AutoEatRunning = not _G.AutoEatRunning
	EatButton.Text = _G.AutoEatRunning and "Auto Eat (Continuous): ON" or "Auto Eat (Continuous): OFF"
	EatButton.BackgroundColor3 = _G.AutoEatRunning and Color3.fromRGB(18, 35, 25) or Color3.fromRGB(35, 20, 22)
	EatButton.TextColor3 = _G.AutoEatRunning and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

DrinkButton.MouseButton1Click:Connect(function()
	_G.AutoDrinkRunning = not _G.AutoDrinkRunning
	DrinkButton.Text = _G.AutoDrinkRunning and "Auto Drink (Continuous): ON" or "Auto Drink (Continuous): OFF"
	DrinkButton.BackgroundColor3 = _G.AutoDrinkRunning and Color3.fromRGB(18, 35, 25) or Color3.fromRGB(35, 20, 22)
	DrinkButton.TextColor3 = _G.AutoDrinkRunning and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

RestButton.MouseButton1Click:Connect(function()
	_G.AutoRestRunning = not _G.AutoRestRunning
	RestButton.Text = _G.AutoRestRunning and "Auto Rest (Quest): ON" or "Auto Rest (Quest): OFF"
	RestButton.BackgroundColor3 = _G.AutoRestRunning and Color3.fromRGB(18, 35, 25) or Color3.fromRGB(35, 20, 22)
	RestButton.TextColor3 = _G.AutoRestRunning and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

ZoneButton.MouseButton1Click:Connect(function()
	_G.AutoZoneRunning = not _G.AutoZoneRunning
	ZoneButton.Text = _G.AutoZoneRunning and "Auto Zone: ON" or "Auto Zone: OFF"
	ZoneButton.BackgroundColor3 = _G.AutoZoneRunning and Color3.fromRGB(18, 35, 25) or Color3.fromRGB(35, 20, 22)
	ZoneButton.TextColor3 = _G.AutoZoneRunning and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

-- FREECAM SECTION
local CamActive = false
local CamSpeed = 1
local SavedCameraType = Camera.CameraType
local SavedSubject = Camera.CameraSubject
local CamCFrame = Camera.CFrame

local CameraRotationX = 0
local CameraRotationY = 0

local FreecamTitle = Instance.new("TextLabel")
FreecamTitle.Size = UDim2.new(1, 0, 0, 25)
FreecamTitle.Position = UDim2.new(0, 0, 0, 185)
FreecamTitle.BackgroundTransparency = 1
FreecamTitle.Text = "CAMERA TỰ DO (FREECAM)"
FreecamTitle.TextColor3 = Color3.fromRGB(0, 255, 170)
FreecamTitle.Font = Enum.Font.GothamBold
FreecamTitle.TextSize = 12
FreecamTitle.Parent = FarmPage

local StatusBtn = Instance.new("TextButton")
StatusBtn.Size = UDim2.new(1, 0, 0, 32)
StatusBtn.Position = UDim2.new(0, 0, 0, 215)
StatusBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
StatusBtn.Text = "FREECAM: TẮT"
StatusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusBtn.Font = Enum.Font.GothamBold
StatusBtn.TextSize = 11
StatusBtn.Parent = FarmPage
StyleButton(StatusBtn)

local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, 0, 0, 32)
SpeedBtn.Position = UDim2.new(0, 0, 0, 252)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
SpeedBtn.Text = "TỐC ĐỘ CAM: 1x"
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.Font = Enum.Font.GothamBold
SpeedBtn.TextSize = 11
SpeedBtn.Parent = FarmPage
StyleButton(SpeedBtn)

local TeleportBtn = Instance.new("TextButton")
TeleportBtn.Size = UDim2.new(1, 0, 0, 32)
TeleportBtn.Position = UDim2.new(0, 0, 0, 289)
TeleportBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
TeleportBtn.Text = "DỊCH CHUYỂN ĐẾN VỊ TRÍ CAM"
TeleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportBtn.Font = Enum.Font.GothamBold
TeleportBtn.TextSize = 11
TeleportBtn.Parent = FarmPage
StyleButton(TeleportBtn)

local function SetCharacterAnchor(anchor)
    local char = LocalPlayer.Character
    if char then
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            root.Anchored = anchor
        end
    end
end

local function ToggleFreecam()
    CamActive = not CamActive
    if CamActive then
        StatusBtn.Text = "FREECAM: BẬT"
        StatusBtn.TextColor3 = Color3.fromRGB(0, 255, 170)
        
        SavedCameraType = Camera.CameraType
        SavedSubject = Camera.CameraSubject
        CamCFrame = Camera.CFrame
        
        local _, y, z = Camera.CFrame:ToOrientation()
        CameraRotationX = y
        CameraRotationY = z
        
        Camera.CameraType = Enum.CameraType.Scriptable
        SetCharacterAnchor(true)
    else
        StatusBtn.Text = "FREECAM: TẮT"
        StatusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        Camera.CameraType = SavedCameraType
        Camera.CameraSubject = SavedSubject
        SetCharacterAnchor(false)
    end
end

StatusBtn.MouseButton1Click:Connect(ToggleFreecam)

local Speeds = {1, 2, 5, 10, 20, 0.5}
local currentSpeedIndex = 1
SpeedBtn.MouseButton1Click:Connect(function()
    currentSpeedIndex = currentSpeedIndex + 1
    if currentSpeedIndex > #Speeds then currentSpeedIndex = 1 end
    CamSpeed = Speeds[currentSpeedIndex]
    SpeedBtn.Text = "TỐC ĐỘ CAM: " .. CamSpeed .. "x"
end)

TeleportBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.Anchored = false
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Camera.CFrame.Position)
        if CamActive then LocalPlayer.Character.HumanoidRootPart.Anchored = true end
    end
end)

---------------------------------------------------------
-- TAB ALL (TÍCH HỢP TOÀN BỘ TÍNH NĂNG + AUTO TAP)
---------------------------------------------------------
local InvisBtn = Instance.new("TextButton")
InvisBtn.Size = UDim2.new(1, 0, 0, 32)
InvisBtn.Position = UDim2.new(0, 0, 0, 0)
InvisBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
InvisBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InvisBtn.Text = "Tàng hình: TẮT"
InvisBtn.Font = Enum.Font.GothamBold
InvisBtn.TextSize = 11
InvisBtn.Parent = AllPage
StyleButton(InvisBtn)

local NoclipBtn = Instance.new("TextButton")
NoclipBtn.Size = UDim2.new(1, 0, 0, 32)
NoclipBtn.Position = UDim2.new(0, 0, 0, 40)
NoclipBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipBtn.Text = "Xuyên vật thể (Noclip): TẮT"
NoclipBtn.Font = Enum.Font.GothamBold
NoclipBtn.TextSize = 11
NoclipBtn.Parent = AllPage
StyleButton(NoclipBtn)

local ScanHitboxBtn = Instance.new("TextButton")
ScanHitboxBtn.Size = UDim2.new(1, 0, 0, 32)
ScanHitboxBtn.Position = UDim2.new(0, 0, 0, 80)
ScanHitboxBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
ScanHitboxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ScanHitboxBtn.Text = "Vẽ Hitbox Địch: TẮT"
ScanHitboxBtn.Font = Enum.Font.GothamBoldScanHitboxBtn.TextSize = 11
ScanHitboxBtn.Parent = AllPage
StyleButton(ScanHitboxBtn)

local AutoInfoLabel = Instance.new("TextLabel")
AutoInfoLabel.Size = UDim2.new(1, 0, 0, 38)
AutoInfoLabel.Position = UDim2.new(0, 0, 0, 120)
AutoInfoLabel.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
AutoInfoLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
AutoInfoLabel.Text = "Mục tiêu: Chưa chọn\nChế độ: Bám chót đuôi"
AutoInfoLabel.Font = Enum.Font.GothamBold
AutoInfoLabel.TextSize = 10
AutoInfoLabel.Parent = AllPage
StyleButton(AutoInfoLabel)

local DistFrame = Instance.new("Frame")
DistFrame.Size = UDim2.new(1, 0, 0, 32)
DistFrame.Position = UDim2.new(0, 0, 0, 162)
DistFrame.BackgroundTransparency = 1
DistFrame.Parent = AllPage

local MinusBtn = Instance.new("TextButton")
MinusBtn.Size = UDim2.new(0.28, 0, 1, 0)
MinusBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
MinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusBtn.Text = "- Gần (0.5)"
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.TextSize = 11
MinusBtn.Parent = DistFrame
StyleButton(MinusBtn)

local DistDisplay = Instance.new("TextLabel")
DistDisplay.Size = UDim2.new(0.4, 0, 1, 0)
DistDisplay.Position = UDim2.new(0.3, 0, 0, 0)
DistDisplay.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
DistDisplay.TextColor3 = Color3.fromRGB(255, 220, 0)
DistDisplay.Text = "Lùi: " .. string.format("%.1f", getgenv().CustomOffset) .. "s"
DistDisplay.Font = Enum.Font.GothamBold
DistDisplay.TextSize = 11
DistDisplay.Parent = DistFrame
StyleButton(DistDisplay)

local PlusBtn = Instance.new("TextButton")
PlusBtn.Size = UDim2.new(0.28, 0, 1, 0)
PlusBtn.Position = UDim2.new(0.72, 0, 0, 0)
PlusBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.Text = "+ Xa (0.5)"
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.TextSize = 11
PlusBtn.Parent = DistFrame
StyleButton(PlusBtn)

MinusBtn.MouseButton1Click:Connect(function()
    getgenv().CustomOffset = math.max(0, getgenv().CustomOffset - 0.5)
    DistDisplay.Text = "Lùi: " .. string.format("%.1f", getgenv().CustomOffset) .. "s"
end)

PlusBtn.MouseButton1Click:Connect(function()
    getgenv().CustomOffset = getgenv().CustomOffset + 0.5
    DistDisplay.Text = "Lùi: " .. string.format("%.1f", getgenv().CustomOffset) .. "s"
end)

local AutoOrbitBtn = Instance.new("TextButton")
AutoOrbitBtn.Size = UDim2.new(1, 0, 0, 32)
AutoOrbitBtn.Position = UDim2.new(0, 0, 0, 200)
AutoOrbitBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
AutoOrbitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoOrbitBtn.Text = "BÁM CHÓT ĐUÔI: TẮT"
AutoOrbitBtn.Font = Enum.Font.GothamBold
AutoOrbitBtn.TextSize = 11
AutoOrbitBtn.Parent = AllPage
StyleButton(AutoOrbitBtn)

local SwitchTargetBtn = Instance.new("TextButton")
SwitchTargetBtn.Size = UDim2.new(1, 0, 0, 32)
SwitchTargetBtn.Position = UDim2.new(0, 0, 0, 238)
SwitchTargetBtn.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
SwitchTargetBtn.TextColor3 = Color3.fromRGB(255, 170, 0)
SwitchTargetBtn.Text = "ĐỔI MỤC TIÊU (CHUYỂN SANG ĐỊCH KHÁC)"
SwitchTargetBtn.Font = Enum.Font.GothamBold
SwitchTargetBtn.TextSize = 10
SwitchTargetBtn.Parent = AllPage
StyleButton(SwitchTargetBtn)

-- KHU VỰC AUTO TAP TRONG TAB ALL
local ChooseBtn = Instance.new("TextButton")
ChooseBtn.Size = UDim2.new(1, 0, 0, 28)
ChooseBtn.Position = UDim2.new(0, 0, 0, 278)
ChooseBtn.Text = "Chọn Vị Trí Nhấn"
ChooseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ChooseBtn.BorderSizePixel = 0
ChooseBtn.TextColor3 = Color3.fromRGB(240, 240, 245)
ChooseBtn.Font = Enum.Font.GothamBold
ChooseBtn.TextSize = 11
ChooseBtn.Parent = AllPage
StyleButton(ChooseBtn)

local PosLabel = Instance.new("TextLabel")
PosLabel.Size = UDim2.new(1, 0, 0, 20)
PosLabel.Position = UDim2.new(0, 0, 0, 311)
PosLabel.BackgroundTransparency = 1
PosLabel.Text = "Vị trí: Giữa màn hình"
PosLabel.TextColor3 = Color3.fromRGB(200, 200, 215)
PosLabel.Font = Enum.Font.GothamBold
PosLabel.TextSize = 10
PosLabel.TextXAlignment = Enum.TextXAlignment.Left
PosLabel.Parent = AllPage

local AutoTapToggleBtn = Instance.new("TextButton")
AutoTapToggleBtn.Size = UDim2.new(1, 0, 0, 32)
AutoTapToggleBtn.Position = UDim2.new(0, 0, 0, 336)
AutoTapToggleBtn.Text = "Tự Động Nhấn: TẮT"
AutoTapToggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
AutoTapToggleBtn.BorderSizePixel = 0
AutoTapToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoTapToggleBtn.Font = Enum.Font.GothamBold
AutoTapToggleBtn.TextSize = 11
AutoTapToggleBtn.Parent = AllPage
StyleButton(AutoTapToggleBtn)

local TOG = false
local RUN = false
local selecting = false
local tapPos = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)

local FOV = Instance.new("Frame", ScreenGui)
FOV.Size = UDim2.new(0, 20, 0, 20)
FOV.AnchorPoint = Vector2.new(0.5, 0.5)
FOV.Position = UDim2.new(0, tapPos.X, 0, tapPos.Y)
FOV.BackgroundTransparency = 1
local Stroke = Instance.new("UIStroke", FOV)
Stroke.Thickness = 1.5
Stroke.Transparency = 0
local Circle = Instance.new("UICorner", FOV)
Circle.CornerRadius = UDim.new(1, 0)

local Inner1 = FOV:Clone()
Inner1.Size = UDim2.new(0, 10, 0, 10)
Inner1.Parent = FOV
Inner1.Position = UDim2.new(0.5, 0, 0.5, 0)
Inner1.AnchorPoint = Vector2.new(0.5, 0.5)
Inner1:GetChildren()[1].Thickness = 1

local PlusH = Instance.new("Frame", FOV)
PlusH.Size = UDim2.new(0, 10, 0, 1)
PlusH.AnchorPoint = Vector2.new(0.5, 0.5)
PlusH.Position = UDim2.new(0.5, 0, 0.5, 0)
PlusH.BackgroundColor3 = Color3.new(1, 1, 1)

local PlusV = Instance.new("Frame", FOV)
PlusV.Size = UDim2.new(0, 1, 0, 10)
PlusV.AnchorPoint = Vector2.new(0.5, 0.5)
PlusV.Position = UDim2.new(0.5, 0, 0.5, 0)
PlusV.BackgroundColor3 = Color3.new(1, 1, 1)

task.spawn(function()
	local h = 0
	while true do
		h = (h + 0.01) % 1
		local col = Color3.fromHSV(h, 1, 1)
		Stroke.Color = col
		Inner1:GetChildren()[1].Color = col
		PlusH.BackgroundColor3 = col
		PlusV.BackgroundColor3 = col
		task.wait(0.05)
	end
end)

local function updateLabel()
	PosLabel.Text = "Vị trí: (" .. math.floor(tapPos.X) .. ", " .. math.floor(tapPos.Y) .. ")"
end

local function stopAutoTap()
	TOG = false
	RUN = false
	AutoTapToggleBtn.Text = "Tự Động Nhấn: TẮT"
	TweenService:Create(AutoTapToggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(100, 100, 100)}):Play()
end

local function startAutoTapLoop()
	RUN = true
	coroutine.wrap(function()
		while RUN and TOG do
			local x, y = tapPos.X, tapPos.Y + 50
			FOV.Position = UDim2.new(0, tapPos.X, 0, tapPos.Y)
			VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, false)
			VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, false)
			task.wait(0.1)
		end
	end)()
end

ChooseBtn.MouseButton1Click:Connect(function()
	if not selecting then
		selecting = true
		ChooseBtn.Text = "Nhấp vào bất kỳ đâu..."
	end
end)

UserInputService.InputBegan:Connect(function(input, gp)
	if selecting and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
		tapPos = input.Position
		updateLabel()
		ChooseBtn.Text = "Chọn Vị Trí Nhấn"
		selecting = false
	end
end)

AutoTapToggleBtn.MouseButton1Click:Connect(function()
	TOG = not TOG
	if TOG then
		AutoTapToggleBtn.Text = "Tự Động Nhấn: BẬT"
		TweenService:Create(AutoTapToggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 105, 180)}):Play()
		startAutoTapLoop()
	else
		stopAutoTap()
	end
end)

---------------------------------------------------------
-- TAB TP (DÀNH RIÊNG CHO TELEPORT + TOGGLE PLAYER LIST)
---------------------------------------------------------
local TpTitle = Instance.new("TextLabel")
TpTitle.Size = UDim2.new(1, 0, 0, 25)
TpTitle.Position = UDim2.new(0, 0, 0, 5)
TpTitle.BackgroundTransparency = 1
TpTitle.Text = "DANH SÁCH DỊCH CHUYỂN NGƯỜI CHƠI"
TpTitle.TextColor3 = Color3.fromRGB(0, 255, 170)
TpTitle.Font = Enum.Font.GothamBold
TpTitle.TextSize = 11
TpTitle.Parent = TpPage

local TogglePlrListBtn = Instance.new("TextButton")
TogglePlrListBtn.Size = UDim2.new(1, 0, 0, 28)
TogglePlrListBtn.Position = UDim2.new(0, 0, 0, 33)
TogglePlrListBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
TogglePlrListBtn.TextColor3 = Color3.fromRGB(0, 255, 170)
TogglePlrListBtn.Text = "Ẩn / Hiện Danh Sách Player"
TogglePlrListBtn.Font = Enum.Font.GothamBold
TogglePlrListBtn.TextSize = 11
TogglePlrListBtn.Parent = TpPage
StyleButton(TogglePlrListBtn)

local PlayerScrollFrame = Instance.new("ScrollingFrame")
PlayerScrollFrame.Size = UDim2.new(1, 0, 0, 228)
PlayerScrollFrame.Position = UDim2.new(0, 0, 0, 65)
PlayerScrollFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
PlayerScrollFrame.BorderSizePixel = 0
PlayerScrollFrame.ScrollBarThickness = 3
PlayerScrollFrame.Parent = TpPage
StyleButton(PlayerScrollFrame)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = PlayerScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 3)

local RefreshPlrBtn = Instance.new("TextButton")
RefreshPlrBtn.Size = UDim2.new(0.48, 0, 0, 38)
RefreshPlrBtn.Position = UDim2.new(0, 0, 0, 300)
RefreshPlrBtn.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
RefreshPlrBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshPlrBtn.Text = "Làm mới danh sách"
RefreshPlrBtn.Font = Enum.Font.GothamBold
RefreshPlrBtn.TextSize = 11
RefreshPlrBtn.Parent = TpPage
StyleButton(RefreshPlrBtn)

local DoTpBtn = Instance.new("TextButton")
DoTpBtn.Size = UDim2.new(0.48, 0, 0, 38)
DoTpBtn.Position = UDim2.new(0.52, 0, 0, 300)
DoTpBtn.BackgroundColor3 = Color3.fromRGB(18, 35, 25)
DoTpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DoTpBtn.Text = "Teleport tới Player"
DoTpBtn.Font = Enum.Font.GothamBold
DoTpBtn.TextSize = 11
DoTpBtn.Parent = TpPage
StyleButton(DoTpBtn)

local isPlayerListVisible = true
TogglePlrListBtn.MouseButton1Click:Connect(function()
    isPlayerListVisible = not isPlayerListVisible
    PlayerScrollFrame.Visible = isPlayerListVisible
    if isPlayerListVisible then
        PlayerScrollFrame.Size = UDim2.new(1, 0, 0, 228)
        TogglePlrListBtn.Text = "Ẩn / Hiện Danh Sách Player"
        RefreshPlrBtn.Position = UDim2.new(0, 0, 0, 300)
        DoTpBtn.Position = UDim2.new(0.52, 0, 0, 300)
    else
        PlayerScrollFrame.Size = UDim2.new(1, 0, 0, 0)
        TogglePlrListBtn.Text = "Ẩn / Hiện Danh Sách Player (Đang ẨN)"
        RefreshPlrBtn.Position = UDim2.new(0, 0, 0, 70)
        DoTpBtn.Position = UDim2.new(0.52, 0, 0, 70)
    end
end)

local function PopulatePlayerList()
    for _, child in pairs(PlayerScrollFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    local count = 0
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            count = count + 1
            local pBtn = Instance.new("TextButton")
            pBtn.Size = UDim2.new(1, -6, 0, 28)
            pBtn.BackgroundColor3 = (selectedTpPlayer == player) and Color3.fromRGB(0, 150, 120) or Color3.fromRGB(25, 25, 32)
            pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            pBtn.Text = "  " .. player.Name .. " (" .. player.DisplayName .. ")"
            pBtn.Font = Enum.Font.GothamBold
            pBtn.TextSize = 11
            pBtn.TextXAlignment = Enum.TextXAlignment.Left
            pBtn.Parent = PlayerScrollFrame
            StyleButton(pBtn)

            pBtn.MouseButton1Click:Connect(function()
                selectedTpPlayer = player
                PopulatePlayerList()
            end)
        end
    end
    PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, count * 31)
end

RefreshPlrBtn.MouseButton1Click:Connect(function()
    PopulatePlayerList()
end)

DoTpBtn.MouseButton1Click:Connect(function()
    if selectedTpPlayer and selectedTpPlayer.Character and selectedTpPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myChar = LocalPlayer.Character
        local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
        if myHrp then
            local targetHrp = selectedTpPlayer.Character.HumanoidRootPart
            myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 2, 3)
        end
    else
        DoTpBtn.Text = "Chưa chọn / Lỗi TP"
        task.wait(1.5)
        DoTpBtn.Text = "Teleport tới Player"
    end
end)

PopulatePlayerList()
Players.PlayerAdded:Connect(PopulatePlayerList)
Players.PlayerRemoving:Connect(PopulatePlayerList)

---------------------------------------------------------
-- TAB ESP (NÂNG CAO)
---------------------------------------------------------
local EspTitle = Instance.new("TextLabel")
EspTitle.Size = UDim2.new(1, 0, 0, 25)
EspTitle.Position = UDim2.new(0, 0, 0, 5)
EspTitle.BackgroundTransparency = 1
EspTitle.Text = "CÀI ĐẶT ESP"
EspTitle.TextColor3 = Color3.fromRGB(0, 255, 170)
EspTitle.Font = Enum.Font.GothamBold
EspTitle.TextSize = 12
EspTitle.Parent = EspPage

-- ESP HEALTH PLAYER
local EspHealthBtn = Instance.new("TextButton")
EspHealthBtn.Size = UDim2.new(1, 0, 0, 32)
EspHealthBtn.Position = UDim2.new(0, 0, 0, 40)
EspHealthBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
EspHealthBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspHealthBtn.Text = "ESP Health (Player): TẮT"
EspHealthBtn.Font = Enum.Font.GothamBold
EspHealthBtn.TextSize = 11
EspHealthBtn.Parent = EspPage
StyleButton(EspHealthBtn)

-- ESP NAME PLAYER
local EspNameBtn = Instance.new("TextButton")
EspNameBtn.Size = UDim2.new(1, 0, 0, 32)
EspNameBtn.Position = UDim2.new(0, 0, 0, 80)
EspNameBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
EspNameBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspNameBtn.Text = "ESP Name (Player): TẮT"
EspNameBtn.Font = Enum.Font.GothamBold
EspNameBtn.TextSize = 11
EspNameBtn.Parent = EspPage
StyleButton(EspNameBtn)

-- ESP BOX PET
local EspBoxPetBtn = Instance.new("TextButton")
EspBoxPetBtn.Size = UDim2.new(1, 0, 0, 32)
EspBoxPetBtn.Position = UDim2.new(0, 0, 0, 120)
EspBoxPetBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
EspBoxPetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspBoxPetBtn.Text = "ESP Box (Pet người khác): TẮT"
EspBoxPetBtn.Font = Enum.Font.GothamBold
EspBoxPetBtn.TextSize = 11
EspBoxPetBtn.Parent = EspPage
StyleButton(EspBoxPetBtn)

-- ESP HEALTH PET
local EspHealthPetBtn = Instance.new("TextButton")
EspHealthPetBtn.Size = UDim2.new(1, 0, 0, 32)
EspHealthPetBtn.Position = UDim2.new(0, 0, 0, 160)
EspHealthPetBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
EspHealthPetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspHealthPetBtn.Text = "ESP Health (Pet người khác): TẮT"
EspHealthPetBtn.Font = Enum.Font.GothamBold
EspHealthPetBtn.TextSize = 11
EspHealthPetBtn.Parent = EspPage
StyleButton(EspHealthPetBtn)

EspHealthBtn.MouseButton1Click:Connect(function()
    getgenv().EspHealthEnabled = not getgenv().EspHealthEnabled
    EspHealthBtn.Text = getgenv().EspHealthEnabled and "ESP Health (Player): BẬT" or "ESP Health (Player): TẮT"
    EspHealthBtn.TextColor3 = getgenv().EspHealthEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

EspNameBtn.MouseButton1Click:Connect(function()
    getgenv().EspNameEnabled = not getgenv().EspNameEnabled
    EspNameBtn.Text = getgenv().EspNameEnabled and "ESP Name (Player): BẬT" or "ESP Name (Player): TẮT"
    EspNameBtn.TextColor3 = getgenv().EspNameEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

EspBoxPetBtn.MouseButton1Click:Connect(function()
    getgenv().EspBoxPetEnabled = not getgenv().EspBoxPetEnabled
    EspBoxPetBtn.Text = getgenv().EspBoxPetEnabled and "ESP Box (Pet người khác): BẬT" or "ESP Box (Pet người khác): TẮT"
    EspBoxPetBtn.TextColor3 = getgenv().EspBoxPetEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

EspHealthPetBtn.MouseButton1Click:Connect(function()
    getgenv().EspHealthPetEnabled = not getgenv().EspHealthPetEnabled
    EspHealthPetBtn.Text = getgenv().EspHealthPetEnabled and "ESP Health (Pet người khác): BẬT" or "ESP Health (Pet người khác): TẮT"
    EspHealthPetBtn.TextColor3 = getgenv().EspHealthPetEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

---------------------------------------------------------
-- TAB SETTINGS (GIẢM LAG, XÓA FOG)
---------------------------------------------------------
local SetTitle = Instance.new("TextLabel")
SetTitle.Size = UDim2.new(1, 0, 0, 25)
SetTitle.Position = UDim2.new(0, 0, 0, 5)
SetTitle.BackgroundTransparency = 1
SetTitle.Text = "CÀI ĐẶT TỐI ƯU"
SetTitle.TextColor3 = Color3.fromRGB(0, 255, 170)
SetTitle.Font = Enum.Font.GothamBold
SetTitle.TextSize = 12
SetTitle.Parent = SettingsPage

-- GIẢM LAG FPS BOOST
local LagBoostBtn = Instance.new("TextButton")
LagBoostBtn.Size = UDim2.new(1, 0, 0, 32)
LagBoostBtn.Position = UDim2.new(0, 0, 0, 40)
LagBoostBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
LagBoostBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LagBoostBtn.Text = "Giảm Lag FPS Boost: TẮT"
LagBoostBtn.Font = Enum.Font.GothamBold
LagBoostBtn.TextSize = 11
LagBoostBtn.Parent = SettingsPage
StyleButton(LagBoostBtn)

-- REMOVE FOG
local RemoveFogBtn = Instance.new("TextButton")
RemoveFogBtn.Size = UDim2.new(1, 0, 0, 32)
RemoveFogBtn.Position = UDim2.new(0, 0, 0, 80)
RemoveFogBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
RemoveFogBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RemoveFogBtn.Text = "Xóa Sương Mù (Remove Fog): TẮT"
RemoveFogBtn.Font = Enum.Font.GothamBold
RemoveFogBtn.TextSize = 11
RemoveFogBtn.Parent = SettingsPage
StyleButton(RemoveFogBtn)

LagBoostBtn.MouseButton1Click:Connect(function()
    getgenv().LagBoostEnabled = not getgenv().LagBoostEnabled
    LagBoostBtn.Text = getgenv().LagBoostEnabled and "Giảm Lag FPS Boost: BẬT" or "Giảm Lag FPS Boost: TẮT"
    LagBoostBtn.TextColor3 = getgenv().LagBoostEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
    
    if getgenv().LagBoostEnabled then
        -- XÓA CÁC VẬT THỂ KHÔNG CẦN THIẾT
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.CastShadow = false
            end
            if v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            end
        end
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 100000
        Lighting.ShadowSoftness = 0
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    else
        Lighting.GlobalShadows = true
        Lighting.FogEnd = 100000
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    end
end)

RemoveFogBtn.MouseButton1Click:Connect(function()
    getgenv().RemoveFogEnabled = not getgenv().RemoveFogEnabled
    RemoveFogBtn.Text = getgenv().RemoveFogEnabled and "Xóa Sương Mù (Remove Fog): BẬT" or "Xóa Sương Mù (Remove Fog): TẮT"
    RemoveFogBtn.TextColor3 = getgenv().RemoveFogEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
    
    if getgenv().RemoveFogEnabled then
        Lighting.FogEnd = 100000
        Lighting.FogStart = 100000
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("Atmosphere") then
                v.Density = 0
                v.Haze = 0
                v.Glare = 0
            end
        end
    else
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
    end
end)

---------------------------------------------------------
-- HỆ THỐNG ESP THANH MÁU (CŨ, GIỮ NGUYÊN)
---------------------------------------------------------
local espFolder = Instance.new("Folder")
espFolder.Name = "0painph10ESP"
espFolder.Parent = workspace

local function CreateEsp(player)
    if player == LocalPlayer then return end
    local billboard = Instance.new("BillboardGui")
    billboard.Name = player.Name .. "_ESP"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 140, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameText"
    nameLabel.Size = UDim2.new(1, 0, 0, 18)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 11
    nameLabel.Text = player.Name
    nameLabel.Parent = billboard
    
    local distLabel = Instance.new("TextLabel")
    distLabel.Name = "DistText"
    distLabel.Size = UDim2.new(1, 0, 0, 14)
    distLabel.Position = UDim2.new(0, 0, 0, 18)
    distLabel.BackgroundTransparency = 1
    distLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
    distLabel.TextStrokeTransparency = 0
    distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextSize = 10
    distLabel.Text = "0m"
    distLabel.Parent = billboard

    local barBg = Instance.new("Frame")
    barBg.Name = "BarBg"
    barBg.Size = UDim2.new(0.8, 0, 0, 6)
    barBg.Position = UDim2.new(0.1, 0, 0, 34)
    barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    barBg.BorderSizePixel = 0
    barBg.Parent = billboard
    
    local barBgCorner = Instance.new("UICorner")
    barBgCorner.CornerRadius = UDim.new(1, 0)
    barBgCorner.Parent = barBg

    local healthBar = Instance.new("Frame")
    healthBar.Name = "HealthBar"
    healthBar.Size = UDim2.new(1, 0, 1, 0)
    healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    healthBar.BorderSizePixel = 0
    healthBar.Parent = barBg
    
    local healthBarCorner = Instance.new("UICorner")
    healthBarCorner.CornerRadius = UDim.new(1, 0)
    healthBarCorner.Parent = healthBar
    
    billboard.Parent = espFolder
end

for _, p in pairs(Players:GetPlayers()) do
    CreateEsp(p)
end
Players.PlayerAdded:Connect(CreateEsp)
Players.PlayerRemoving:Connect(function(player)
    if espFolder:FindFirstChild(player.Name .. "_ESP") then
        espFolder[player.Name .. "_ESP"]:Destroy()
    end
end)

RunService.RenderStepped:Connect(function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local billboard = espFolder:FindFirstChild(p.Name .. "_ESP")
            if billboard then
                local char = p.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                
                if getgenv().EspEnabled and hrp and hum and hum.Health > 0 then
                    billboard.Adornee = hrp
                    billboard.Enabled = true
                    
                    local myChar = LocalPlayer.Character
                    local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
                    local dist = myHrp and math.floor((hrp.Position - myHrp.Position).Magnitude) or 0
                    
                    local healthPercent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                    billboard.BarBg.HealthBar.Size = UDim2.new(healthPercent, 0, 1, 0)
                    
                    if healthPercent > 0.5 then
                        billboard.BarBg.HealthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
                    elseif healthPercent > 0.25 then
                        billboard.BarBg.HealthBar.BackgroundColor3 = Color3.fromRGB(255, 220, 0)
                    else
                        billboard.BarBg.HealthBar.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                    end
                    
                    billboard.DistText.Text = dist .. "m"
                    
                    billboard.NameText.Visible = getgenv().EspNameEnabled
                    billboard.BarBg.Visible = getgenv().EspHealthEnabled
                else
                    billboard.Enabled = false
                end
            end
        end
    end
end)

EspBtnUni.MouseButton1Click:Connect(function()
    getgenv().EspEnabled = not getgenv().EspEnabled
    EspBtnUni.Text = getgenv().EspEnabled and "ESP Thanh Máu: BẬT" or "ESP Thanh Máu: TẮT"
    EspBtnUni.TextColor3 = getgenv().EspEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

local Mouse = LocalPlayer:GetMouse()
Mouse.Button1Down:Connect(function()
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
		local char = LocalPlayer.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp and Mouse.Target then
			hrp.CFrame = CFrame.new(Mouse.Hit.X, Mouse.Hit.Y + 3, Mouse.Hit.Z)
		end
	end
end)

local function IsThisZoneGreen(targetPos)
	local isGreen = false
	pcall(function()
		local folder = workspace.MapResources.Zones
		for _, zoneObj in pairs(folder:GetChildren()) do
			local core = zoneObj:FindFirstChild("LightCore")
			if core and (core.Position - targetPos).Magnitude < 15 then
				local color = core.Color
				if color.R == 0 and color.G > 0.9 and color.B == 0 then
					isGreen = true
				end
				break
			end
		end
	end)
	return isGreen
end

local ZonesList = {
	{ Position = Vector3.new(-144.54, -102.15, 1032.19), Teleport = CFrame.new(-144.54, -87.15, 1032.19) },
	{ Position = Vector3.new(-617.92, 143.39, -1130.44), Teleport = CFrame.new(-617.92, 158.39, -1130.44) },
	{ Position = Vector3.new(1449.99, 77.16, -677.59), Teleport = CFrame.new(1449.99, 92.16, -677.59) },
	{ Position = Vector3.new(276.03, 75.50, -1029.02), Teleport = CFrame.new(276.03, 90.50, -1029.02) },
	{ Position = Vector3.new(-513.23, 75.73, -430.79), Teleport = CFrame.new(-513.23, 90.73, -430.79) },
	{ Position = Vector3.new(1090.65, 66.03, 467.14), Teleport = CFrame.new(1090.65, 81.03, 467.14) },
	{ Position = Vector3.new(209.25, -32.79, -359.19), Teleport = CFrame.new(209.25, -17.79, -359.19) },
	{ Position = Vector3.new(-170.20, 109.98, 388.42), Teleport = CFrame.new(-170.20, 124.98, 388.42) },
	{ Position = Vector3.new(-69.11, -61.16, -1493.54), Teleport = CFrame.new(-69.11, -46.16, -1493.54) }
}

task.spawn(function()
	while true do
		if _G.AutoZoneRunning then
			local char = LocalPlayer.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if hrp then
				local safetyZone3CFrame = CFrame.new(1449.99, 82.16, -677.59) 
				
				for i = 1, #ZonesList do
					if not _G.AutoZoneRunning then break end
					local zone = ZonesList[i]
					
					if IsThisZoneGreen(zone.Position) then
						ZoneButton.Text = "Zone " .. tostring(i) .. " Đã thuộc về bạn"
						task.wait(0.05)
					else
						hrp.CFrame = zone.Teleport
						task.wait(0.05)
						local startTime = tick()
						
						while _G.AutoZoneRunning do
							if IsThisZoneGreen(zone.Position) then
								break
							end
							
							if tick() - startTime >= 15 then
								break
							end
							
							local shakeX = math.sin(tick() * 8) * 0.35
							local shakeZ = math.cos(tick() * 8) * 0.35
							hrp.CFrame = zone.Teleport * CFrame.new(shakeX, 0, shakeZ)
							hrp.Velocity = Vector3.new(0, 0, 0)
							
							ZoneButton.Text = "Zone " .. tostring(i) .. " Đang chiếm..."
							task.wait(0.02)
						end
						
						task.wait(0.05)
						ZoneButton.Text = "Zone " .. tostring(i) .. " Chiếm xong!"
						task.wait(0.5)
					end
				end
				
				if hrp and _G.AutoZoneRunning then 
					hrp.CFrame = safetyZone3CFrame 
				end
				
				ZoneButton.Text = "Đang chờ hồi (5s)..."
				task.wait(5)
			else
				task.wait(0.5)
			end
		else
			task.wait(0.1)
		end
	end
end)

task.spawn(function()
	while task.wait(0.2) do
		pcall(function()
			local playerGui = LocalPlayer:WaitForChild("PlayerGui")
			local questsFrame = playerGui:FindFirstChild("GameUI") and playerGui.GameUI:FindFirstChild("QuestsFrame")
			
			local detectedQuest = "None"
			
			if questsFrame then
				for _, child in pairs(questsFrame:GetChildren()) do
					local textContent = ""
					for _, desc in pairs(child:GetDescendants()) do
						if desc:IsA("TextLabel") then
							textContent = textContent .. " " .. string.lower(desc.Text)
						end
					end
					
					if string.find(textContent, "eat something") then
						detectedQuest = "Eat"
						break
					elseif string.find(textContent, "drink water") then
						detectedQuest = "Drink"
						break
					elseif string.find(textContent, "rest") then
						detectedQuest = "Rest"
						break
					end
				end
			end
			
			_G.CurrentQuest = detectedQuest
			
			if detectedQuest == "Eat" then
				QuestLabel.Text = "Current Quest: Eat"
				QuestLabel.TextColor3 = Color3.fromRGB(50, 255, 50)
			elseif detectedQuest == "Drink" then
				QuestLabel.Text = "Current Quest: Drink"
				QuestLabel.TextColor3 = Color3.fromRGB(50, 150, 255)
			elseif detectedQuest == "Rest" then
				QuestLabel.Text = "Current Quest: Rest"
				QuestLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
			else
				QuestLabel.Text = "Current Quest: Waiting..."
				QuestLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
			end
		end)
	end
end)

task.spawn(function()
	local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Character"):WaitForChild("Eat")
	while true do
		if _G.AutoEatRunning then
			pcall(function()
				local char = LocalPlayer.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if hrp then
					local env = workspace.MapEnvironment
					local closest = nil
					local shortest = math.huge
					local folders = {
						{ F = env:FindFirstChild("RedWood") and env.RedWood:FindFirstChild("Trees"), N = "RedWoodTree" },
						{ F = env:FindFirstChild("Pines") and env.Pines:FindFirstChild("Trees"), N = "PineTree" },
						{ F = env:FindFirstChild("Desert") and env.Desert:FindFirstChild("Tress"), N = "DesertTree" },
						{ F = env:FindFirstChild("Lobby") and env.Lobby:FindFirstChild("Trees"), N = "RedWoodTree" }
					}
					for _, conf in pairs(folders) do
						if conf.F then
							for _, tree in pairs(conf.F:GetChildren()) do
								if tree.Name == conf.N then
									local p = tree:IsA("BasePart") and tree or tree:FindFirstChildWhichIsA("BasePart")
									if p and (hrp.Position - p.Position).Magnitude < shortest then
										shortest = (hrp.Position - p.Position).Magnitude
										closest = tree
									end
								end
							end
						end
					end
					
					if closest then
						remote:FireServer(closest)
					end
				end
			end)
			task.wait(0.4)
		else
			task.wait(0.2)
		end
	end
end)

task.spawn(function()
	while true do
		if _G.AutoDrinkRunning then
			ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Character"):WaitForChild("CharacterFunctions"):InvokeServer("Drink")
			task.wait(0.8)
		else
			task.wait(0.2)
		end
	end
end)

task.spawn(function()
	local restRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Character"):WaitForChild("Rest")
	local isRestingActive = false
	
	while true do
		task.wait(0.3)
		local shouldRest = _G.AutoRestRunning and (_G.CurrentQuest == "Rest")
		
		if shouldRest and not isRestingActive then
			pcall(function()
				restRemote:InvokeServer(true)
			end)
			isRestingActive = true
		elseif not shouldRest and isRestingActive then
			pcall(function()
				restRemote:InvokeServer(false)
			end)
			isRestingActive = false
		end
	end
end)

---------------------------------------------------------
-- LOGIC SPEED & FLY
---------------------------------------------------------
local function UpdateSpeedUI()
    SpeedToggleBtnUni.Text = "Tốc độ (Speed): " .. getgenv().WalkSpeedValue .. (getgenv().SpeedEnabled and " [ BẬT ]" or " [ TẮT ]")
    SpeedToggleBtnUni.TextColor3 = getgenv().SpeedEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end

SpeedToggleBtnUni.MouseButton1Click:Connect(function()
    getgenv().SpeedEnabled = not getgenv().SpeedEnabled
    UpdateSpeedUI()
    if not getgenv().SpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

BtnSpeedMinus.MouseButton1Click:Connect(function()
    if getgenv().WalkSpeedValue > 20 then
        getgenv().WalkSpeedValue = getgenv().WalkSpeedValue - 20
    end
    UpdateSpeedUI()
end)

BtnSpeedPlus.MouseButton1Click:Connect(function()
    if getgenv().WalkSpeedValue < 500 then
        getgenv().WalkSpeedValue = math.min(500, getgenv().WalkSpeedValue + 20)
    end
    UpdateSpeedUI()
end)

local function UpdateFlyUI()
    FlyToggleBtn.Text = "Bay (Fly): " .. getgenv().flySpeed .. (getgenv().flyEnabled and " [ BẬT ]" or " [ TẮT ]")
    FlyToggleBtn.TextColor3 = getgenv().flyEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end

local function startFly()
    getgenv().flyEnabled = true
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if att then att:Destroy() end
    if lv then lv:Destroy() end
    if ag then ag:Destroy() end

    att = Instance.new("Attachment", hrp)

    lv = Instance.new("LinearVelocity")
    lv.Attachment0 = att
    lv.MaxForce = math.huge
    lv.VectorVelocity = Vector3.new(0, 0, 0)
    lv.Parent = hrp

    ag = Instance.new("AlignOrientation")
    ag.Attachment0 = att
    ag.MaxTorque = math.huge
    ag.Responsiveness = 200
    ag.Parent = hrp

    UpdateFlyUI()
end

local function stopFly()
    getgenv().flyEnabled = false
    if lv then lv:Destroy() end
    if ag then ag:Destroy() end
    if att then att:Destroy() end
    UpdateFlyUI()
end

FlyToggleBtn.MouseButton1Click:Connect(function()
    if getgenv().flyEnabled then stopFly() else startFly() end
end)

BtnFlyMinus.MouseButton1Click:Connect(function()
    if getgenv().flySpeed > 10 then 
        getgenv().flySpeed = getgenv().flySpeed - 10 
    end
    UpdateFlyUI()
end)

BtnFlyPlus.MouseButton1Click:Connect(function()
    if getgenv().flySpeed < 500 then
        getgenv().flySpeed = math.min(500, getgenv().flySpeed + 10)
    end
    UpdateFlyUI()
end)

RunService.RenderStepped:Connect(function()
    if not getgenv().flyEnabled then return end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    
    if not hrp or not lv or not ag then return end
    
    local cam = workspace.CurrentCamera
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    
    local moveDir = Vector3.new()
    if humanoid then moveDir = humanoid.MoveDirection end
    
    local targetVel = Vector3.new()
    if moveDir.Magnitude > 0 then
        local camCF = cam.CFrame
        local camLook = camCF.LookVector
        local camRight = camCF.RightVector
        local flatLook = Vector3.new(camLook.X, 0, camLook.Z).Unit
        local flatRight = Vector3.new(camRight.X, 0, camRight.Z).Unit
        local lookDot = moveDir:Dot(camLook)
        local rightDot = moveDir:Dot(camRight)
        targetVel = (flatLook * lookDot + flatRight * rightDot + Vector3.new(0, camLook.Y * math.abs(lookDot), 0)).Unit * getgenv().flySpeed
    else
        targetVel = Vector3.new(0, 0, 0)
    end
    
    lv.VectorVelocity = targetVel
    ag.CFrame = cam.CFrame
end)

---------------------------------------------------------
-- CÁC NÚT VÀ CHỨC NĂNG CÒN LẠI
---------------------------------------------------------
local function UpdateNoclipUI()
    local txt = getgenv().NoclipEnabled and "Xuyên vật thể (Noclip): BẬT" or "Xuyên vật thể (Noclip): TẮT"
    local col = getgenv().NoclipEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
    NoclipBtn.Text = txt
    NoclipBtn.TextColor3 = col
    NoclipBtnUni.Text = txt
    NoclipBtnUni.TextColor3 = col
end

NoclipBtn.MouseButton1Click:Connect(function()
    getgenv().NoclipEnabled = not getgenv().NoclipEnabled
    UpdateNoclipUI()
end)

NoclipBtnUni.MouseButton1Click:Connect(function()
    getgenv().NoclipEnabled = not getgenv().NoclipEnabled
    UpdateNoclipUI()
end)

InvisBtn.MouseButton1Click:Connect(function()
    getgenv().InvisEnabled = not getgenv().InvisEnabled
    InvisBtn.Text = getgenv().InvisEnabled and "Tàng hình: BẬT" or "Tàng hình: TẮT"
    InvisBtn.TextColor3 = getgenv().InvisEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.Transparency = getgenv().InvisEnabled and 1 or 0
            end
        end
    end
end)

ScanHitboxBtn.MouseButton1Click:Connect(function()
    getgenv().ScanHitboxEnabled = not getgenv().ScanHitboxEnabled
    ScanHitboxBtn.Text = getgenv().ScanHitboxEnabled and "Vẽ Hitbox Địch: BẬT" or "Vẽ Hitbox Địch: TẮT"
    ScanHitboxBtn.TextColor3 = getgenv().ScanHitboxEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(255, 255, 255)
end)

AutoOrbitBtn.MouseButton1Click:Connect(function()
    getgenv().AutoOrbitEnabled = not getgenv().AutoOrbitEnabled
    if getgenv().AutoOrbitEnabled then
        AutoOrbitBtn.Text = "BÁM CHÓT ĐUÔI: BẬT"
        AutoOrbitBtn.TextColor3 = Color3.fromRGB(0, 255, 170)
        targetPlayer = GetClosestPlayer()
    else
        AutoOrbitBtn.Text = "BÁM CHÓT ĐUÔI: TẮT"
        AutoOrbitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        targetPlayer = nil
    end
end)

SwitchTargetBtn.MouseButton1Click:Connect(function()
    targetPlayer = GetNextClosestPlayer(targetPlayer)
    if targetPlayer then
        SwitchTargetBtn.Text = "Đã đổi sang: " .. targetPlayer.Name
        task.wait(1)
        SwitchTargetBtn.Text = "ĐỔI MỤC TIÊU (CHUYỂN SANG ĐỊCH KHÁC)"
    else
        SwitchTargetBtn.Text = "Không tìm thấy địch khác!"
        task.wait(1)
        SwitchTargetBtn.Text = "ĐỔI MỤC TIÊU (CHUYỂN SANG ĐỊCH KHÁC)"
    end
end)

ServerHopBtnUni.MouseButton1Click:Connect(function()
    ServerHopBtnUni.Text = "Đang tìm server ít người..."
    local placeId = game.PlaceId
    local serversUrl = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
    
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(serversUrl))
    end)
    
    if success and result and result.data then
        for _, server in ipairs(result.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                ServerHopBtnUni.Text = "Đang chuyển Server..."
                TeleportService:TeleportToPlaceInstance(placeId, server.id, LocalPlayer)
                break
            end
        end
    else
        ServerHopBtnUni.Text = "Lỗi tìm Server! Thử lại sau."
        task.wait(2)
        ServerHopBtnUni.Text = "VÀO SERVER ÍT NGƯỜI (SERVER HOP)"
    end
end)

---------------------------------------------------------
-- STEPPED / HEARTBEAT LOGIC
---------------------------------------------------------
local highlightFolder = Instance.new("Folder")
highlightFolder.Name = "0painph10Visualizer"
highlightFolder.Parent = workspace

-- FOLDER CHO ESP BOX PET
local petBoxFolder = Instance.new("Folder")
petBoxFolder.Name = "0painph10PetBox"
petBoxFolder.Parent = workspace

RunService.Stepped:Connect(function()
    if getgenv().NoclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
    
    if getgenv().SpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
end)

function GetTrueTailPart(character)
    if not character then return nil end
    local tailKeywords = {"tail3", "tailend", "tail_end", "tail2", "tail1", "tail"}
    for _, name in ipairs(tailKeywords) do
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and string.find(string.lower(part.Name), name) then
                return part
            end
        end
    end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local furthestPart = root
    local maxRearDistance = -math.huge
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") and part ~= root then
            local localPos = root.CFrame:PointToObjectSpace(part.Position)
            if localPos.Z > maxRearDistance then
                maxRearDistance = localPos.Z
                furthestPart = part
            end
        end
    end
    return furthestPart
end

function GetClosestPlayer()
    local closest = nil
    local shortestDistance = math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local rootPart = player.Character.HumanoidRootPart
                local screenPoint, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                if onScreen then
                    local mousePos = UserInputService:GetMouseLocation()
                    local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - mousePos).Magnitude
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closest = player
                    end
                end
            end
        end
    end
    return closest
end

function GetNextClosestPlayer(currentToken)
    local playersList = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                table.insert(playersList, player)
            end
        end
    end

    if #playersList == 0 then return nil end

    table.sort(playersList, function(a, b)
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not myRoot then return false end
        local distA = (a.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude
        local distB = (b.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude
        return distA < distB
    end)

    if not currentToken then
        return playersList[1]
    end

    for i, p in ipairs(playersList) do
        if p == currentToken then
            local nextIndex = i + 1
            if nextIndex > #playersList then
                nextIndex = 1
            end
            return playersList[nextIndex]
        end
    end

    return playersList[1]
end

-- HÀM LẤY PET CỦA NGƯỜI KHÁC
local function GetOtherPlayersPets()
    local pets = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            for _, obj in pairs(player.Character:GetChildren()) do
                if obj:IsA("Model") and (string.find(string.lower(obj.Name), "pet") or string.find(string.lower(obj.Name), "dino") or string.find(string.lower(obj.Name), "creature")) then
                    table.insert(pets, {Player = player, Pet = obj})
                end
            end
        end
    end
    return pets
end

RunService.Heartbeat:Connect(function()
    highlightFolder:ClearAllChildren()
    if getgenv().ScanHitboxEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local char = player.Character
                local hum = char:FindFirstChild("Humanoid")
                if hum and hum.Health > 0 then
                    for _, part in pairs(char:GetChildren()) do
                        if part:IsA("BasePart") then
                            local box = Instance.new("BoxHandleAdornment")
                            box.Size = part.Size + Vector3.new(0.3, 0.3, 0.3)
                            box.Adornee = part
                            box.AlwaysOnTop = true
                            box.ZIndex = 4
                            box.Transparency = 0.5
                            box.Color3 = Color3.fromRGB(255, 50, 50)
                            box.Parent = highlightFolder
                        end
                    end
                end
            end
        end
    end

    -- ESP BOX PET NGƯỜI KHÁC
    petBoxFolder:ClearAllChildren()
    if getgenv().EspBoxPetEnabled or getgenv().EspHealthPetEnabled then
        local pets = GetOtherPlayersPets()
        for _, data in ipairs(pets) do
            local petModel = data.Pet
            local primaryPart = petModel.PrimaryPart or petModel:FindFirstChildWhichIsA("BasePart")
            
            if primaryPart then
                -- ESP BOX
                if getgenv().EspBoxPetEnabled then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Size = petModel:GetExtentsSize() + Vector3.new(0.5, 0.5, 0.5)
                    box.Adornee = primaryPart
                    box.AlwaysOnTop = true
                    box.ZIndex = 4
                    box.Transparency = 0.5
                    box.Color3 = Color3.fromRGB(255, 0, 255)
                    box.Parent = petBoxFolder
                end
                
                -- ESP HEALTH PET
                if getgenv().EspHealthPetEnabled then
                    local hum = petModel:FindFirstChildOfClass("Humanoid")
                    if hum then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = petModel.Name .. "_PetHealth"
                        billboard.AlwaysOnTop = true
                        billboard.Size = UDim2.new(0, 120, 0, 40)
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        billboard.Adornee = primaryPart
                        
                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.Size = UDim2.new(1, 0, 0, 16)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        nameLabel.TextStrokeTransparency = 0
                        nameLabel.Font = Enum.Font.GothamBold
                        nameLabel.TextSize = 10
                        nameLabel.Text = petModel.Name .. " (" .. data.Player.Name .. ")"
                        nameLabel.Parent = billboard
                        
                        local barBg = Instance.new("Frame")
                        barBg.Size = UDim2.new(0.8, 0, 0, 5)
                        barBg.Position = UDim2.new(0.1, 0, 0, 18)
                        barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        barBg.BorderSizePixel = 0
                        barBg.Parent = billboard
                        
                        local barCorner = Instance.new("UICorner")
                        barCorner.CornerRadius = UDim.new(1, 0)
                        barCorner.Parent = barBg
                        
                        local healthBar = Instance.new("Frame")
                        healthBar.Size = UDim2.new(math.clamp(hum.Health / hum.MaxHealth, 0, 1), 0, 1, 0)
                        healthBar.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
                        healthBar.BorderSizePixel = 0
                        healthBar.Parent = barBg
                        
                        local hbCorner = Instance.new("UICorner")
                        hbCorner.CornerRadius = UDim.new(1, 0)
                        hbCorner.Parent = healthBar
                        
                        billboard.Parent = petBoxFolder
                    end
                end
            end
        end
    end

    if getgenv().AutoOrbitEnabled and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character then
        local enemyRoot = targetPlayer.Character.HumanoidRootPart
        local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        
        if myRoot then
            local tailPart = GetTrueTailPart(targetPlayer.Character)
            local tailPos = tailPart and tailPart.Position or enemyRoot.Position
            local rearDirection = -enemyRoot.CFrame.LookVector
            local targetPos = tailPos + (rearDirection * getgenv().CustomOffset)
            
            AutoInfoLabel.Text = string.format("Mục tiêu: %s\nĐang bám: %s", targetPlayer.Name, tailPart and tailPart.Name or "Đuôi")
            
            myRoot.CFrame = CFrame.new(targetPos, enemyRoot.Position)
            myRoot.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            myRoot.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end
    else
        AutoInfoLabel.Text = "Mục tiêu: Chưa chọn\nChế độ: Bám chót đuôi"
    end
end)
