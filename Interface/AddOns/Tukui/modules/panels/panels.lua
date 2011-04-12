local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

local TukuiBar1 = CreateFrame("Frame", "TukuiBar1", UIParent, "SecureHandlerStateTemplate")
TukuiBar1:CreatePanel("Default", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 52)
TukuiBar1:CreateShadow("Default")
TukuiBar1:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar1:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar1:SetFrameStrata("BACKGROUND")
TukuiBar1:SetFrameLevel(1)

local TukuiBar2 = CreateFrame("Frame", "TukuiBar2", UIParent)
TukuiBar2:CreatePanel("Default", 1, 1, "BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", -6, 0)
TukuiBar2:CreateShadow("Default")
TukuiBar2:SetWidth((T.buttonsize * 6) + (T.buttonspacing * 7))
TukuiBar2:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar2:SetFrameStrata("BACKGROUND")
TukuiBar2:SetFrameLevel(2)
TukuiBar2:SetAlpha(0)
if T.lowversion then
	TukuiBar2:SetAlpha(0)
else
	TukuiBar2:SetAlpha(1)
end

local TukuiBar3 = CreateFrame("Frame", "TukuiBar3", UIParent)
TukuiBar3:CreatePanel("Default", 1, 1, "BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 6, 0)
TukuiBar3:CreateShadow("Default")
TukuiBar3:SetWidth((T.buttonsize * 6) + (T.buttonspacing * 7))
TukuiBar3:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar3:SetFrameStrata("BACKGROUND")
TukuiBar3:SetFrameLevel(2)
if T.lowversion then
	TukuiBar3:SetAlpha(0)
else
	TukuiBar3:SetAlpha(1)
end

local TukuiBar4 = CreateFrame("Frame", "TukuiBar4", UIParent)
TukuiBar4:CreatePanel("Default", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 52)
TukuiBar4:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar4:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar4:SetFrameStrata("BACKGROUND")
TukuiBar4:SetFrameLevel(2)
TukuiBar4:SetAlpha(0)

local TukuiBar5 = CreateFrame("Frame", "TukuiBar5", UIParent)
TukuiBar5:CreatePanel("Default", 1, 1,"TOPRIGHT", UIParent, "TOPRIGHT", -12, -853)
TukuiBar5:CreateShadow("Default")
TukuiBar5:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar5:SetHeight((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar5:SetFrameStrata("BACKGROUND")
TukuiBar5:SetFrameLevel(2)
TukuiBar5:SetAlpha(0)

--[[
local TukuiBar5 = CreateFrame("Frame", "TukuiBar5", TukuiChatBackgroundRight)
--TukuiBar5:SetWidth(T.DataWidth + 2)
TukuiBar5:CreateShadow("Default")
TukuiBar5:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar5:SetHeight((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar5:Point("BOTTOM", TukuiChatBackgroundRight, "TOP", -2, 0)
TukuiBar5:SetFrameStrata("BACKGROUND")
TukuiBar5:SetFrameLevel(2)
TukuiBar5:SetAlpha(0)
--]]

local TukuiBar6 = CreateFrame("Frame", "TukuiBar6", UIParent)
TukuiBar6:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar6:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar6:SetPoint("LEFT", TukuiBar5, "LEFT", 0, 0)
TukuiBar6:SetFrameStrata("BACKGROUND")
TukuiBar6:SetFrameLevel(2)
TukuiBar6:SetAlpha(0)

local TukuiBar7 = CreateFrame("Frame", "TukuiBar7", UIParent)
TukuiBar7:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar7:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar7:SetPoint("TOP", TukuiBar5, "TOP", 0 , 0)
TukuiBar7:SetFrameStrata("BACKGROUND")
TukuiBar7:SetFrameLevel(2)
TukuiBar7:SetAlpha(0)

local petbg = CreateFrame("Frame", "TukuiPetBar", UIParent, "SecureHandlerStateTemplate")
petbg:CreatePanel("Default", (T.petbuttonsize * 10) + (T.petbuttonspacing * 11), T.petbuttonsize + (T.petbuttonspacing * 2), "RIGHT", TukuiBar5, "LEFT", -6, 0)
petbg:CreateShadow("Default")
petbg:SetAlpha(0)

local ltpetbg1 = CreateFrame("Frame", "TukuiLineToPetActionBarBackground", petbg)
ltpetbg1:CreatePanel("Default", -265, 0, "TOP", petbg, "BOTTOM", 0, 0)
ltpetbg1:CreateShadow("Default")
ltpetbg1:SetParent(petbg)
ltpetbg1:SetFrameStrata("BACKGROUND")
ltpetbg1:SetFrameLevel(0)

local AsphyxiaPetBar = CreateFrame("Frame")
local function AsphyxiaPetBarUpdate(self)
	if TukuiBar5 and TukuiBar5:IsShown() then
		petbg:ClearAllPoints()
		petbg:SetPoint("BOTTOMRIGHT", TukuiBar5, "TOPRIGHT", 0, 3)
	else
		petbg:ClearAllPoints()
		petbg:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -12, -853)
	end
end
AsphyxiaPetBar:SetScript("OnUpdate", AsphyxiaPetBarUpdate)

-- INVISIBLE FRAME COVERING BOTTOM ACTIONBARS JUST TO PARENT UF CORRECTLY
local invbarbg = CreateFrame("Frame", "InvTukuiActionBarBackground", UIParent)
if T.lowversion then
	invbarbg:SetPoint("TOPLEFT", TukuiBar1)
	invbarbg:SetPoint("BOTTOMRIGHT", TukuiBar1)
	TukuiBar2:Hide()
	TukuiBar3:Hide()
else
	invbarbg:SetPoint("TOPLEFT", TukuiBar2)
	invbarbg:SetPoint("BOTTOMRIGHT", TukuiBar3)
end

-- LEFT VERTICAL LINE
local ileftlv = CreateFrame("Frame", "TukuiInfoLeftLineVertical", TukuiBar1)
ileftlv:CreatePanel("Default", 2, 130, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 22, 30)

-- RIGHT VERTICAL LINE
local irightlv = CreateFrame("Frame", "TukuiInfoRightLineVertical", TukuiBar1)
irightlv:CreatePanel("Default", 2, 130, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -22, 30)

if not C.chat.background then
	-- CUBE AT LEFT, ACT AS A BUTTON (CHAT MENU)
	local cubeleft = CreateFrame("Frame", "TukuiCubeLeft", TukuiBar1)
	cubeleft:CreatePanel("Default", 10, 10, "BOTTOM", ileftlv, "TOP", 0, 0)
	cubeleft:EnableMouse(true)
	cubeleft:SetScript("OnMouseDown", function(self, btn)
		if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
			if btn == "RightButton" then
				if TukuiInfoLeftBattleGround:IsShown() then
					TukuiInfoLeftBattleGround:Hide()
				else
					TukuiInfoLeftBattleGround:Show()
				end
			end
		end
		
		if btn == "LeftButton" then	
			ToggleFrame(ChatMenu)
		end
	end)

	-- CUBE AT RIGHT, ACT AS A BUTTON (CONFIGUI or BG'S)
	local cuberight = CreateFrame("Frame", "TukuiCubeRight", TukuiBar1)
	cuberight:CreatePanel("Default", 10, 10, "BOTTOM", irightlv, "TOP", 0, 0)
	if C["bags"].enable then
		cuberight:EnableMouse(true)
		cuberight:SetScript("OnMouseDown", function(self)
			ToggleKeyRing()
		end)
	end
end

-- HORIZONTAL LINE LEFT
local ltoabl = CreateFrame("Frame", "TukuiLineToABLeft", TukuiBar1)
ltoabl:CreatePanel("Default", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabl:ClearAllPoints()
ltoabl:Point("BOTTOMLEFT", ileftlv, "BOTTOMLEFT", 0, 0)
ltoabl:Point("RIGHT", TukuiBar1, "BOTTOMLEFT", -1, 17)
ltoabl:SetFrameStrata("BACKGROUND")
ltoabl:SetFrameLevel(1)

-- HORIZONTAL LINE RIGHT
local ltoabr = CreateFrame("Frame", "TukuiLineToABRight", TukuiBar1)
ltoabr:CreatePanel("Default", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabr:ClearAllPoints()
ltoabr:Point("LEFT", TukuiBar1, "BOTTOMRIGHT", 1, 17)
ltoabr:Point("BOTTOMRIGHT", irightlv, "BOTTOMRIGHT", 0, 0)
ltoabr:SetFrameStrata("BACKGROUND")
ltoabr:SetFrameLevel(1)

-- MOVE/HIDE SOME ELEMENTS IF CHAT BACKGROUND IS ENABLED
local movechat = 0
if C.chat.background then movechat = 10 ileftlv:SetAlpha(0) irightlv:SetAlpha(0) end

-- INFO LEFT (FOR STATS)
local ileft = CreateFrame("Frame", "TukuiInfoLeft", TukuiBar1)
ileft:CreatePanel("Default", T.InfoLeftRightWidth, 23, "LEFT", ltoabl, "LEFT", 3 - movechat, 0)
ileft:SetFrameLevel(2)
ileft:SetFrameStrata("BACKGROUND")

-- INFO RIGHT (FOR STATS)
local iright = CreateFrame("Frame", "TukuiInfoRight", TukuiBar1)
iright:CreatePanel("Default", T.InfoLeftRightWidth, 23, "RIGHT", ltoabr, "RIGHT", -3 + movechat, 0)
iright:SetFrameLevel(2)
iright:SetFrameStrata("BACKGROUND")

if C.chat.background then
	-- Alpha horizontal lines because all panels is dependent on this frame.
	ltoabl:SetAlpha(0)
	ltoabr:SetAlpha(0)
	
	-- CHAT BG LEFT
	local chatleftbg = CreateFrame("Frame", "TukuiChatBackgroundLeft", TukuiInfoLeft)
	chatleftbg:CreatePanel("Transparent", T.InfoLeftRightWidth + 12, 175, "BOTTOM", TukuiInfoLeft, "BOTTOM", 0, -6)
	chatleftbg:CreateShadow("Default")
	
	-- CHAT BG RIGHT
	local chatrightbg = CreateFrame("Frame", "TukuiChatBackgroundRight", TukuiInfoRight)
	chatrightbg:CreatePanel("Transparent", T.InfoLeftRightWidth + 12, 175, "BOTTOM", TukuiInfoRight, "BOTTOM", 0, -6)
	chatrightbg:CreateShadow("Default")
	
	-- LEFT TAB PANEL
	local tabsbgleft = CreateFrame("Frame", "TukuiTabsLeftBackground", TukuiBar1)
	tabsbgleft:CreatePanel("Default", 325, 23, "TOP", chatleftbg, "TOP", -22, -6)
	tabsbgleft:SetFrameLevel(2)
	tabsbgleft:SetFrameStrata("BACKGROUND")
		
	-- RIGHT TAB PANEL
	local tabsbgright = CreateFrame("Frame", "TukuiTabsRightBackground", TukuiBar1)
	tabsbgright:CreatePanel("Default", 325, 23, "TOP", chatrightbg, "TOP", -22, -6)
	tabsbgright:SetFrameLevel(2)
	tabsbgright:SetFrameStrata("BACKGROUND")
end

--BATTLEGROUND STATS FRAME
if C["datatext"].battleground == true then
	local bgframe = CreateFrame("Frame", "TukuiInfoLeftBattleGround", UIParent)
	bgframe:CreatePanel("Default", 1, 1, "TOPLEFT", UIParent, "BOTTOMLEFT", 0, 0)
	bgframe:SetAllPoints(ileft)
	bgframe:SetFrameStrata("LOW")
	bgframe:SetFrameLevel(0)
	bgframe:EnableMouse(true)
end

--Additional Panels
-------------------
-- Tukui v13
-------------------

-- INFO CENTER BOTTOM (FOR STATS)
local icenterbottom = CreateFrame("Frame", "TukuiInfoCenterBottom", UIParent)
icenterbottom:CreatePanel("Default", 190, 18, "TOP", TukuiBar2, "BOTTOM", 0, -5)
icenterbottom:Point("CENTER", UIParent, "CENTER", 0, -5)
icenterbottom:CreateShadow("Default")
icenterbottom:SetFrameLevel(2)
icenterbottom:SetFrameStrata("BACKGROUND")

-- INFO CENTER BOTTOM RIGHT(FOR STATS)
local icenterbottomright = CreateFrame("Frame", "TukuiInfoCenterBottomRight", UIParent)
icenterbottomright:CreatePanel("Default", 190, 18, "TOP", TukuiBar3, "BOTTOM", 0, -5)
icenterbottomright:CreateShadow("Default")
icenterbottomright:SetFrameLevel(2)
icenterbottomright:SetFrameStrata("BACKGROUND")

--[[-- MINIMAP INFO LEFT(FOR STATS)
local ilmmap = CreateFrame("Frame", "TukuiInfoLeftMinimap", TukuiMinimap)
ilmmap:CreatePanel("Default", (TukuiMinimap:GetWidth() / 2) - 7, 23, "LEFT", TukuiMinimap, "BOTTOMLEFT", 5, 0)
ilmmap:CreateShadow("Default")
ilmmap:SetFrameLevel(TukuiMinimap:GetFrameLevel() + 2)

-- MINIMAP IFNO RIGHT(FOR STATS)
local irmmap = CreateFrame("Frame", "TukuiInfoRightMinimap", TukuiMinimap)
irmmap:CreatePanel("Default", (TukuiMinimap:GetWidth() / 2) - 7, 23, "RIGHT", TukuiMinimap, "BOTTOMRIGHT", -5, 0)
irmmap:CreateShadow("Default")
irmmap:SetFrameLevel(TukuiMinimap:GetFrameLevel() + 2)]]

-- CONFIG BUTTON
local configbutton = CreateFrame("Button", "TukuiConfigButton", UIParent, "SecureActionButtonTemplate")
configbutton:CreatePanel("Default", 55, 17, "TOP", TukuiBar1, "BOTTOM", -142, -22)
configbutton:CreateShadow("Default")
configbutton:SetAttribute("type", "macro")
configbutton:SetAttribute("macrotext", "/tc")
configbutton:SetFrameStrata("BACKGROUND")
configbutton:SetFrameLevel(0)

configbutton.Text = T.SetFontString(configbutton, C.media.pixelfont, 10)
configbutton.Text:Point("CENTER", configbutton, "CENTER", 0, 0.5)
configbutton.Text:SetText(T.StatColor.."Config UI")

configbutton:HookScript("OnEnter", function(self) configbutton:SetBackdropBorderColor(unpack(TukuiCF["media"].statcolor)) end)
configbutton:HookScript("OnLeave", function(self) configbutton:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor)) end)

-- MOVEUI BUTTON
local moveuibutton = CreateFrame("Button", "TukuiMoveUIButton", UIParent, "SecureActionButtonTemplate")
moveuibutton:CreatePanel("Default", 55, 17, "LEFT", configbutton, "RIGHT", 5, 0)
moveuibutton:CreateShadow("Default")
moveuibutton:SetAttribute("type", "macro")
moveuibutton:SetAttribute("macrotext", "/mtukui")
moveuibutton:SetFrameStrata("BACKGROUND")
moveuibutton:SetFrameLevel(0)

moveuibutton.Text = T.SetFontString(moveuibutton, C.media.pixelfont, 10)
moveuibutton.Text:Point("CENTER", moveuibutton, "CENTER", 0, 0.5)
moveuibutton.Text:SetText(T.StatColor.."Move UI")

moveuibutton:HookScript("OnEnter", function(self) moveuibutton:SetBackdropBorderColor(unpack(TukuiCF["media"].statcolor)) end)
moveuibutton:HookScript("OnLeave", function(self) moveuibutton:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor)) end)

-- RESETUI BUTTON
local resetuibutton = CreateFrame("Button", "TukuiResetUIButton", UIParent, "SecureActionButtonTemplate")
resetuibutton:CreatePanel("Default", 55, 17, "TOP", TukuiBar1, "BOTTOM", 82, -22)
resetuibutton:CreateShadow("Default")
resetuibutton:SetAttribute("type", "macro")
resetuibutton:SetAttribute("macrotext", "/resetui")
resetuibutton:SetFrameStrata("BACKGROUND")
resetuibutton:SetFrameLevel(0)

resetuibutton.Text = T.SetFontString(resetuibutton, C.media.pixelfont, 10)
resetuibutton.Text:Point("CENTER", resetuibutton, "CENTER", 0, 0.5)
resetuibutton.Text:SetText(T.StatColor.."Reset UI")

resetuibutton:HookScript("OnEnter", function(self) resetuibutton:SetBackdropBorderColor(unpack(TukuiCF["media"].statcolor)) end)
resetuibutton:HookScript("OnLeave", function(self) resetuibutton:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor)) end)

-- RELOADUI BUTTON
local rluibutton = CreateFrame("Button", "TukuiReloadUIButton", UIParent, "SecureActionButtonTemplate")
rluibutton:CreatePanel("Default", 55, 17, "LEFT", resetuibutton, "RIGHT", 5, 0)
rluibutton:CreateShadow("Default")
rluibutton:SetAttribute("type", "macro")
rluibutton:SetAttribute("macrotext", "/rl")
rluibutton:SetFrameStrata("BACKGROUND")
rluibutton:SetFrameLevel(0)

rluibutton.Text = T.SetFontString(rluibutton, C.media.pixelfont, 10)
rluibutton.Text:Point("CENTER", rluibutton, "CENTER", 0, 0.5)
rluibutton.Text:SetText(T.StatColor.."Reload UI")

rluibutton:HookScript("OnEnter", function(self) rluibutton:SetBackdropBorderColor(unpack(TukuiCF["media"].statcolor)) end)
rluibutton:HookScript("OnLeave", function(self) rluibutton:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor)) end)

-- ADDONS BUTTON
local adbutton = CreateFrame("Button", "TukuiAddonsButton", UIParent, "SecureActionButtonTemplate")
adbutton:CreatePanel("Default", 100, 17, "TOP", TukuiBar1, "BOTTOM", 0, -22)
adbutton:CreateShadow("Default")
adbutton:SetAttribute("type", "macro")
adbutton:SetAttribute("macrotext", "/al")
adbutton:SetFrameStrata("BACKGROUND")
adbutton:SetFrameLevel(0)

adbutton.Text = T.SetFontString(adbutton, C.media.pixelfont, 10)
adbutton.Text:Point("CENTER", adbutton, "CENTER", 0, 0.5)
adbutton.Text:SetText(T.StatColor..ADDONS)

adbutton:HookScript("OnEnter", function(self) adbutton:SetBackdropBorderColor(unpack(TukuiCF["media"].statcolor)) end)
adbutton:HookScript("OnLeave", function(self) adbutton:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor)) end)

-- DPS BUTTON
local dpsb = CreateFrame("Button", "TukuiDPSButton", UIParent)
local buttontext = dpsb:CreateFontString(nil,"OVERLAY",nil)
buttontext:SetFont(C.media.pixelfont, C["datatext"].fontsize)
buttontext:SetText(T.StatColor.."Dps")
buttontext:SetPoint("CENTER", TukuiDB.Scale(2), 0.5)
TukuiDPSButton:CreatePanel(dpsb, 30, 17, "TOP", Minimap, "BOTTOM", 54, 4)
TukuiDPSButton:CreateShadow(dpsb)
dpsb:SetFrameLevel(3)
dpsb:EnableMouse(true)

dpsb:HookScript("OnEnter", function(self) dpsb:SetBackdropBorderColor(unpack(TukuiCF["media"].statcolor)) end)
dpsb:HookScript("OnLeave", function(self) dpsb:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor)) end)
dpsb:RegisterForClicks("AnyUp") dpsb:SetScript("OnClick", function() DisableAddOn("Tukui_Raid_Healing") EnableAddOn("Tukui_Raid") ReloadUI() end)

-- HEAL BUTTON
local healb = CreateFrame("Button", "TukuiHEALButton", UIParent)
local buttontext = healb:CreateFontString(nil,"OVERLAY",nil)
buttontext:SetFont(C.media.pixelfont, C["datatext"].fontsize)
buttontext:SetText(T.StatColor.."Heal")
buttontext:SetPoint("CENTER", TukuiDB.Scale(2), 0.5)
TukuiHEALButton:CreatePanel(healb, 30, 17, "TOP", Minimap, "BOTTOM", -54, 4)
TukuiHEALButton:CreateShadow(healb)
healb:SetFrameLevel(3)
healb:EnableMouse(true)

healb:HookScript("OnEnter", function(self) healb:SetBackdropBorderColor(unpack(TukuiCF["media"].statcolor)) end)
healb:HookScript("OnLeave", function(self) healb:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor)) end)
healb:RegisterForClicks("AnyUp") healb:SetScript("OnClick", function() EnableAddOn("Tukui_Raid_Healing") DisableAddOn("Tukui_Raid") ReloadUI() end)
	
--Commenting them out for now...	
--[[-- TOP STAT FRAMES
local topstatbar1 = CreateFrame("Frame", "TukuiTopStat1", UIParent)
TukuiTopStat1:CreatePanel(topstatbar1, 105, 23, "TOP", UIParent, "TOP", 0, -7)
TukuiTopStat1:CreateShadow(topstatbar1)
topstatbar1:SetFrameLevel(2)

local topstatbar2 = CreateFrame("Frame", "TukuiTopStat2", UIParent)
TukuiTopStat2:CreatePanel(topstatbar2, 90, 23, "LEFT", TukuiTopStat1, "RIGHT", 3, 0)
TukuiTopStat2:CreateShadow(topstatbar2)
topstatbar2:SetFrameLevel(2)

local topstatbar3 = CreateFrame("Frame", "TukuiTopStat3", UIParent)
TukuiTopStat3:CreatePanel(topstatbar3, 90, 23, "RIGHT", TukuiTopStat1, "LEFT", -3, 0)
TukuiTopStat3:CreateShadow(topstatbar3)
topstatbar3:SetFrameLevel(2)

-- TOP STAT FRAME GRAPHICS
local timeleft = CreateFrame("Button", "Tukuitimeleft", UIParent)
	timeleft:CreatePanel("Default",40, 23, "RIGHT", TukuiTopStat3, "LEFT", TukuiDB.Scale(-3), -TukuiDB.Scale(0))
	timeleft:CreateShadow(timeleft)
	timeleft:SetFrameLevel(2)
	timeleft:SetFrameStrata("BACKGROUND")
	timeleft:SetBackdrop({
	bgFile = C["media"].timeleft,
	edgeFile = C["media"].blank, 
	tile = false, tileSize = 0, edgeSize = 1, 
	insets = { left = -1, right = -1, top = -1, bottom = -1}
	})
	timeleft:SetBackdropBorderColor(unpack(C["media"].bordercolor))
	
local timeright = CreateFrame("Button", "Tukuitimeright", UIParent)
	timeright:CreatePanel("Default",40, 23, "LEFT", TukuiTopStat2, "RIGHT", TukuiDB.Scale(3), -TukuiDB.Scale(0))
	timeright:CreateShadow(timeright)
	timeright:SetFrameLevel(2)
	timeright:SetFrameStrata("BACKGROUND")
	timeright:SetBackdrop({
	bgFile = C["media"].timeright,
	edgeFile = C["media"].blank, 
	tile = false, tileSize = 0, edgeSize = 1, 
	insets = { left = -1, right = -1, top = -1, bottom = -1}
	})
	timeright:SetBackdropBorderColor(unpack(C["media"].bordercolor))
--]]
	
-- TIME PANEL
local watch = CreateFrame("Frame", "Tukuiwatch", UIParent)
Tukuiwatch:CreatePanel(watch, 73, 23, "TOP", Minimap, "BOTTOM", TukuiDB.Scale(0), 10)
Tukuiwatch:CreateShadow(watch)
watch:SetFrameLevel(3)

--[[
--UI CONTROL PANEL
local cpanellogo = CreateFrame("Button", "Tukuicpanellogo", UIParent)
	--cpanellogo:CreatePanel("Default",235, 23, "TOPLEFT", UIParent, "TOPLEFT", 20, -7)
	cpanellogo:CreatePanel("Default",235, 17, "TOP", TukuiBar1, "BOTTOM", 0, -6)
	cpanellogo:CreateShadow(cpanellogo)
	cpanellogo:SetFrameLevel(2)
	cpanellogo:SetFrameStrata("BACKGROUND")
	cpanellogo:SetBackdrop({
	bgFile = C["media"].cpanellogo,
	edgeFile = C["media"].blank, 
	tile = false, tileSize = 0, edgeSize = 1, 
	insets = { left = -1, right = -1, top = -1, bottom = -1}
	})
	cpanellogo:SetBackdropBorderColor(unpack(C["media"].bordercolor))
--]]	

--[[	
-- CUBE LEFT (Control Panel Left)
local cubeleft = CreateFrame("Frame", "Tukuicubeleft", UIParent)
cubeleft:CreatePanel(cubeleft, TukuiDB.Scale(10), 23, "RIGHT", Tukuicpanellogo, "LEFT", -TukuiDB.Scale(3), 0)
cubeleft:CreateShadow(cubeleft)
cubeleft:SetFrameLevel(2)

-- CUBE RIGHT (Control Panel Right)
local cuberight = CreateFrame("Frame", "Tukuicuberight", UIParent)
cuberight:CreatePanel(cuberight, TukuiDB.Scale(10), 23, "LEFT", Tukuicpanellogo, "RIGHT", TukuiDB.Scale(3), 0)
cuberight:CreateShadow(cuberight)
cuberight:SetFrameLevel(2)

-- CUBE RIGHT (Rep/Exp Right)
local cuberight = CreateFrame("Frame", "Tukuicuberight", UIParent)
cuberight:CreatePanel(cuberight, TukuiDB.Scale(10), 23, "LEFT", Tukuicpanellogo, "RIGHT", TukuiDB.Scale(256), 0)
cuberight:CreateShadow(cuberight)
cuberight:SetFrameLevel(2)	
--]]

-- Toggle Button for TukuiInfoCenterBottom
local centerbtoggle = CreateFrame("Button", "CenterBToggle", UIParent)
local centerbtext = centerbtoggle:CreateFontString(nil, "OVERLAY", nil)
centerbtext:SetFont(C.media.pixelfont, C["datatext"].fontsize)
centerbtext:SetText(T.StatColor..">")
centerbtext:SetPoint("CENTER", 2, 1)
centerbtoggle:CreatePanel(centerbtoggle, 17, 18, "LEFT", TukuiInfoCenterBottom, "LEFT", -20, 0)
centerbtoggle:SetFrameLevel(2)
centerbtoggle:SetAlpha(0)
centerbtoggle:CreateShadow("Default")
		
-- Make Button Toggle TukuiInfoCenterBottom Show/Hide
centerbtoggle:HookScript("OnEnter", function(self) centerbtoggle:SetBackdropBorderColor(unpack(C["media"].statcolor)) end)
centerbtoggle:HookScript("OnLeave", function(self) centerbtoggle:SetBackdropBorderColor(unpack(C["media"].bordercolor)) end)
centerbtoggle:RegisterForClicks("AnyUp") 
	
centerbtoggle:SetScript("OnClick", function()
	if icenterbottom:IsShown() then
		icenterbottom:Hide()
		centerbtext:SetText(T.StatColor.."<")
	else
		icenterbottom:Show()
		UIFrameFadeIn(icenterbottom, 0.6, 0, 1)
		centerbtext:SetText(T.StatColor..">")
	end
end)	

centerbtoggle:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
centerbtoggle:SetScript("OnLeave", function(self) self:SetAlpha(0) end)

-- Toggle Button for TukuiInfoCenterBottomRight
local centerbrtoggle = CreateFrame("Button", "CenterBRToggle", UIParent)
local centerbrtext = centerbrtoggle:CreateFontString(nil, "OVERLAY", nil)
centerbrtext:SetFont(C.media.pixelfont, C["datatext"].fontsize)
centerbrtext:SetText(T.StatColor.."<")
centerbrtext:SetPoint("CENTER", 2, 1)
centerbrtoggle:CreatePanel(centerbrtoggle, 17, 18, "RIGHT", TukuiInfoCenterBottomRight, "RIGHT", 20, 0)
centerbrtoggle:SetFrameLevel(2)
centerbrtoggle:SetAlpha(0)
centerbrtoggle:CreateShadow("Default")
		
-- Make Button Toggle Main Frame On/Off
centerbrtoggle:HookScript("OnEnter", function(self) centerbrtoggle:SetBackdropBorderColor(unpack(C["media"].statcolor)) end)
centerbrtoggle:HookScript("OnLeave", function(self) centerbrtoggle:SetBackdropBorderColor(unpack(C["media"].bordercolor)) end)
centerbrtoggle:RegisterForClicks("AnyUp") 
	
centerbrtoggle:SetScript("OnClick", function()
	if icenterbottomright:IsShown() then
		icenterbottomright:Hide()
		centerbrtext:SetText(T.StatColor..">")
	else
		icenterbottomright:Show()
		UIFrameFadeIn(icenterbottomright, 0.6, 0, 1)
		centerbrtext:SetText(T.StatColor.."<")
	end
end)	

centerbrtoggle:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
centerbrtoggle:SetScript("OnLeave", function(self) self:SetAlpha(0) end)