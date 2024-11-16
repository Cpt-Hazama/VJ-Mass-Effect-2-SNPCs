AddCSLuaFile( "shared.lua" )
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2025 by Cpt. Hazama, All rights reserved. *** 
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/masseffect/varren.mdl"
ENT.StartHealth = 125
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_VARREN"}
ENT.BloodColor = "Red"

ENT.MeleeAttackDamage = 22
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.MeleeAttackDamageDistance = 110

ENT.HasFootStepSound = true
ENT.FootStepTimeRun = 0.22
ENT.FootStepTimeWalk = 0.35

ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav","npc/zombie/foot2.wav","npc/zombie/foot3.wav"}
ENT.SoundTbl_Alert = {"varren/ss_new_varrens_S.001.wav","varren/ss_new_varrens_S.002.wav","varren/ss_new_varrens_S.003.wav","varren/ss_new_varrens_S.004.wav","varren/ss_new_varrens_S.005.wav","varren/ss_new_varrens_S.006.wav","varren/ss_new_varrens_S.007.wav","varren/ss_new_varrens_S.008.wav","varren/ss_new_varrens_S.009.wav","varren/ss_new_varrens_S.010.wav","varren/ss_new_varrens_S.011.wav","varren/ss_new_varrens_S.012.wav","varren/ss_new_varrens_S.013.wav","varren/ss_new_varrens_S.014.wav","varren/ss_new_varrens_S.015.wav"}
ENT.SoundTbl_Idle = {"varren/ss_new_varrens_S.001.wav","varren/ss_new_varrens_S.002.wav","varren/ss_new_varrens_S.003.wav","varren/ss_new_varrens_S.004.wav","varren/ss_new_varrens_S.005.wav","varren/ss_new_varrens_S.006.wav","varren/ss_new_varrens_S.007.wav","varren/ss_new_varrens_S.008.wav","varren/ss_new_varrens_S.009.wav","varren/ss_new_varrens_S.010.wav","varren/ss_new_varrens_S.011.wav","varren/ss_new_varrens_S.012.wav","varren/ss_new_varrens_S.013.wav","varren/ss_new_varrens_S.014.wav","varren/ss_new_varrens_S.015.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"varren/ss_new_varrens_S.001.wav","varren/ss_new_varrens_S.002.wav","varren/ss_new_varrens_S.003.wav","varren/ss_new_varrens_S.004.wav","varren/ss_new_varrens_S.005.wav","varren/ss_new_varrens_S.006.wav","varren/ss_new_varrens_S.007.wav","varren/ss_new_varrens_S.008.wav","varren/ss_new_varrens_S.009.wav","varren/ss_new_varrens_S.010.wav","varren/ss_new_varrens_S.011.wav","varren/ss_new_varrens_S.012.wav","varren/ss_new_varrens_S.013.wav","varren/ss_new_varrens_S.014.wav","varren/ss_new_varrens_S.015.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self:SetSkin(math.random(0,2))
	-- self:SetCollisionBounds(Vector(60, 30, 70), Vector(-50, -30, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
	if self.VJ_IsBeingControlled == true then return end
	if math.random(1,3) == 1 then
		self:VJ_ACT_PLAYACTIVITY(ACT_ARM,true,false,true)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if string.find(key,"mattack") then
		self:MeleeAttackCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if !self:IsMoving() then
		self.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
		self.MeleeAttackDistance = 60
		self.TimeUntilMeleeAttackDamage = false
	else
		self.AnimTbl_MeleeAttack = "run_bite"
		self.MeleeAttackDistance = 75
		self.TimeUntilMeleeAttackDamage = 0.8
	end
end