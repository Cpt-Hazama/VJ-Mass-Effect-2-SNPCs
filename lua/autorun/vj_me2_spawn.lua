/*-----------------------------------------------
	*** Copyright (c) 2025 by Cpt. Hazama, All rights reserved. *** 
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Mass Effect 2 SNPCs"
local AddonName = "Mass Effect 2"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_me2_spawn.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Mass Effect 2"

	VJ.AddNPC_HUMAN("Legion","npc_vj_me_legion",{"weapon_vj_mepistol"},vCat)
	VJ.AddNPC("Thresher Maw","npc_vj_me_threshermaw",vCat)
	VJ.AddNPC("Varren","npc_vj_me_varren",vCat)
	VJ.AddNPC("Y.M.I.R.","npc_vj_me_ymir",vCat)
	
	VJ.AddNPCWeapon("VJ_M-8 Avenger", "weapon_vj_avenger")
	VJ.AddNPCWeapon("VJ_M-6 Carnifex", "weapon_vj_carnifex")
	VJ.AddNPCWeapon("VJ_Graal Spike Launcher", "weapon_vj_graalspike")
	VJ.AddNPCWeapon("VJ_Geth Pulse Rifle", "weapon_vj_gethr")
	VJ.AddNPCWeapon("VJ_M-3 Predator", "weapon_vj_predator")
	VJ.AddNPCWeapon("VJ_M-27 Scrimitar", "weapon_vj_scrimitar")

	game.AddParticles("particles/blood_impact_blue.pcf")
	game.AddParticles("particles/dlc03.pcf")
	game.AddParticles("particles/threshermaw_acid.pcf")
	game.AddParticles("particles/threshermaw_acid2.pcf")
	game.AddParticles("particles/vortex.pcf")
	game.AddParticles("particles/hunter_shield_impact.pcf")
	local particlename = {}
	for _,v in ipairs(particlename) do PrecacheParticleSystem(v) end

	function VJ_GetSequenceName(ent, anim)
		if VJ_AnimationExists(ent, anim) == false then return 0 end
		if isnumber(anim) then
			return ent:GetSequenceName(ent:SelectWeightedSequence(anim))
		end
		if isstring(anim) then
			return ent:GetSequenceName(ent:LookupSequence(anim))
		end
		return nil
	end

-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end