AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2025 by Cpt. Hazama, All rights reserved. *** 
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/masseffect/legion.mdl"
ENT.StartHealth = 325
ENT.Shields = 250
ENT.Armor = 0

ENT.BloodColor = "White"

ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY","CLASS_ME_GETH"}
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true

ENT.AnimTbl_MeleeAttack = "vjseq_fc_punchhigh_combat"
ENT.MeleeAttackDistance = 60
ENT.MeleeAttackDamageDistance = 95
ENT.MeleeAttackDamage = 12
ENT.TimeUntilMeleeAttackDamage = 0.65

ENT.DisableFootStepSoundTimer = true

ENT.CanCrouchOnWeaponAttack = false
ENT.AnimTbl_WeaponAttackFiringGesture = {"cb_firestart"}

ENT.AnimTbl_GrenadeAttack = {"vjseq_cb_grenade1","vjseq_cb_grenade2"}

ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_BIG_FLINCH
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = {{HitGroup = {HITGROUP_HEAD}, IsSchedule = false, Animation = {ACT_FLINCH_HEAD}},{HitGroup = {HITGROUP_CHEST,HITGROUP_STOMACH,HITGROUP_GEAR}, IsSchedule = false, Animation = {ACT_FLINCH_CHEST}},{HitGroup = {HITGROUP_LEFTARM}, IsSchedule = false, Animation = {ACT_FLINCH_LEFTARM}},{HitGroup = {HITGROUP_RIGHTARM}, IsSchedule = false, Animation = {ACT_FLINCH_RIGHTARM}}} -- "Animation" should be an "SCHED_" if IsSchedule is true, if not then "ACT_" | If it doesn't get hit in any of this hitgroups, it will use the regular schedule or activity (Depending on what self.FlinchUseACT is set on)
ENT.Weapon_NoSpawnMenu = true

ENT.RGB = "0 161 255"
ENT.Collisions = Vector(13,13,90)

ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(40,30,-60), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "headBase", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(10,0,0), -- The offset for the controller when the camera is in first person
	FirstP_ShrinkBone = false, -- Should the bone shrink? Useful if the bone is obscuring the player's view
}

ENT.FootStepVolume = 75
ENT.GeneralSoundPitch2 = 100

ENT.SoundTbl_FootStep = {"legion/legion_foot01.wav","legion/legion_foot02.wav","legion/legion_foot03.wav"}
ENT.SoundTbl_Idle = {"legion/cithub_tp_legion_a_S_INT.001.wav","legion/cithub_tp_legion_a_S_INT.002.wav","legion/cithub_tp_legion_a_S_INT.003.wav","legion/krohub_tp_legion_a_S_INT.001.wav","legion/krohub_tp_legion_a_S_INT.002.wav","legion/krohub_tp_legion_a_S_INT.006.wav","legion/omghub_tp_legion_a_S_INT.001.wav","legion/twrhub_tp_legion_a_S_INT.001.wav"}
ENT.SoundTbl_Alert = {"legion/legion_alert01.mp3","legion/legion_alert02.mp3","legion/legion_alert03.mp3","legion/legion_alert04.mp3","legion/legion_alert05.mp3","legion/legion_alert06.mp3","legion/legion_alert07.mp3","legion/legion_alert08.mp3","legion/legion_alert09.mp3","legion/legion_alert10.mp3","legion/legion_alert11.mp3"}
ENT.SoundTbl_CombatIdle = {"legion/legion_command_attack01.mp3","legion/legion_command_attack02.mp3","legion/legion_command_attack03.mp3","legion/legion_command_attack04.mp3","legion/legion_command_attack05.mp3","legion/legion_command_move01.mp3","legion/legion_command_move02.mp3","legion/legion_command_move03.mp3","legion/legion_command_move04.mp3","legion/legion_areaclear01.mp3","legion/legion_areaclear02.mp3","legion/legion_areaclear03.mp3","legion/legion_areaclear04.mp3","legion/legion_areaclear05.mp3","legion/legion_areaclear06.mp3","legion/legion_areaclear07.mp3","legion/legion_areaclear08.mp3","legion/legion_areaclear09.mp3","legion/legion_areaclear10.mp3","legion/legion_areaclear11.mp3","legion/legion_areaclear12.mp3","legion/legion_areaclear13.mp3","legion/legion_areaclear14.mp3"}
ENT.SoundTbl_Grenade = {"legion/legion_command_move01.mp3","legion/legion_command_move04.mp3"}
ENT.SoundTbl_Pain = {"legion/legion_injured01.mp3","legion/legion_injured02.mp3","legion/legion_injured03.mp3","legion/legion_injured04.mp3","legion/legion_injured05.mp3","legion/legion_injured06.mp3","legion/legion_injured07.mp3","legion/legion_injured08.mp3","legion/legion_injured09.mp3","legion/legion_injured10.mp3","legion/legion_injured11.mp3","legion/legion_injured12.mp3","legion/legion_injured13.mp3","legion/legion_injured14.mp3","legion/legion_injured15.mp3","legion/legion_injured16.mp3"}
ENT.SoundTbl_Death = {"legion/legion_death01.mp3","legion/legion_death02.mp3","legion/legion_death03.mp3","legion/legion_death04.mp3","legion/legion_death05.mp3","legion/legion_death06.mp3"}
ENT.SoundTbl_FollowPlayer = {"legion/legion_command_follow01.mp3","legion/legion_command_follow02.mp3","legion/legion_command_follow03.mp3"}
ENT.SoundTbl_UnFollowPlayer = {"legion/legion_command_affirmative01.mp3","legion/legion_command_affirmative02.mp3","legion/legion_command_affirmative03.mp3","legion/legion_command_affirmative04.mp3","legion/legion_command_affirmative05.mp3","legion/legion_command_securepos01.mp3","legion/legion_command_securepos02.mp3","legion/legion_command_securepos03.mp3"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"legion/legion_alert01.mp3","legion/legion_alert02.mp3","legion/legion_alert03.mp3","legion/legion_alert04.mp3","legion/legion_alert05.mp3","legion/legion_alert06.mp3","legion/legion_alert07.mp3","legion/legion_alert08.mp3","legion/legion_alert09.mp3","legion/legion_alert10.mp3","legion/legion_alert11.mp3"}
ENT.SoundTbl_OnPlayerSight = {"legion/cithub_tp_legion_a_S_INT.001.wav","legion/cithub_tp_legion_a_S_INT.002.wav","legion/cithub_tp_legion_a_S_INT.003.wav","legion/krohub_tp_legion_a_S_INT.001.wav","legion/krohub_tp_legion_a_S_INT.002.wav","legion/krohub_tp_legion_a_S_INT.006.wav","legion/omghub_tp_legion_a_S_INT.001.wav","legion/twrhub_tp_legion_a_S_INT.001.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(self.Collisions.x,self.Collisions.y,self.Collisions.z),Vector(-self.Collisions.x,-self.Collisions.y,0))
	self:SetHealth(self:VJ_GetDifficultyValue(self.StartHealth +self.Shields +self.Armor)) -- These values stack in Mass Effect, however Shields and Armor will effect certain damage types if they exist. For some reason, Geth Troopers do not have armor even though the rest of the Geth have armor
	self:Give("weapon_vj_mepistol")
	timer.Simple(0,function() if IsValid(self) then self:SetWeaponState(VJ.NPC_WEP_STATE_HOLSTERED) end end)

	local eyeglow = ents.Create("env_sprite")
	eyeglow:SetKeyValue("model","sprites/light_glow01.vmt")
	eyeglow:SetKeyValue("scale","2")
	eyeglow:SetKeyValue("rendermode","9")
	eyeglow:SetKeyValue("rendercolor",self.RGB .. " 0")
	eyeglow:SetKeyValue("spawnflags","1") -- If animated
	eyeglow:SetParent(self)
	eyeglow:Fire("SetParentAttachment","light",0)
	eyeglow:Spawn()
	eyeglow:Activate()
	self:DeleteOnRemove(eyeglow)

	self:SetSkin(math.random(0,1))

	util.SpriteTrail(self,2,Color(0,161,255,255),true,6,6,0.1,1/(6+12)*0.5,"VJ_Base/sprites/vj_trial1.vmt")

	local spotlight = ents.Create("env_projectedtexture")
	spotlight:SetPos( self:GetPos() + Vector(0,0,0) )
	spotlight:SetAngles( self:GetAngles() + Angle(0,0,0) )
	spotlight:SetKeyValue('lightcolor', self.RGB .. " 255")
	spotlight:SetKeyValue('lightfov', '40')
	spotlight:SetKeyValue('farz', '612')
	spotlight:SetKeyValue('nearz', '0.1')
	spotlight:SetKeyValue('shadowquality', '0')
	spotlight:Input( "SpotlightTexture", NULL, NULL, "effects/flashlight001" )
	spotlight:SetOwner( self.Owner )
	spotlight:SetParent(self)
	spotlight:Spawn()
	spotlight:Activate()
	spotlight:Fire("setparentattachment", "light")
	self:DeleteOnRemove(spotlight)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
	function controlEnt:CustomOnKeyPressed(key)	
		if key == KEY_SPACE && self.VJCE_NPC:GetActivity() != ACT_DISARM && self.VJCE_NPC:GetActivity() != ACT_ARM then
			if self.VJCE_NPC:GetWeaponState() == VJ.NPC_WEP_STATE_HOLSTERED then
				self.VJCE_NPC:UnHolsterGun()
			else
				self.VJCE_NPC:HolsterGun()
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(ent)
	if self.VJ_IsBeingControlled == true then return end
	
	if self:GetWeaponState() == VJ.NPC_WEP_STATE_HOLSTERED then
		self:UnHolsterGun()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HolsterGun()
	self:VJ_ACT_PLAYACTIVITY(ACT_DISARM,true,false,true)
	timer.Simple(0.5,function()
		if IsValid(self) && self:GetActivity() == ACT_DISARM && self:GetWeaponState() != VJ.NPC_WEP_STATE_HOLSTERED then
			self:SetWeaponState(VJ.NPC_WEP_STATE_HOLSTERED)
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:UnHolsterGun()
	self:StopMoving()
	self:VJ_ACT_PLAYACTIVITY(ACT_ARM,true,false,true)
	timer.Simple(0.5,function()
		if IsValid(self) && self:GetActivity() == ACT_ARM && self:GetWeaponState() == VJ.NPC_WEP_STATE_HOLSTERED then
			self:SetWeaponState()
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.VJ_IsBeingControlled == true or self.Dead == true or self:BusyWithActivity() then return end
	
	if IsValid(self:GetEnemy()) then
		if self:GetWeaponState() == VJ.NPC_WEP_STATE_HOLSTERED then
			self:UnHolsterGun()
		end
	elseif self:GetWeaponState() != VJ.NPC_WEP_STATE_HOLSTERED && !self.Alerted then
		self:HolsterGun()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "event_emit Foot" then
		self:FootStepSoundCode()
	end
	if key == "event_mattack" then
		self:MeleeAttackCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if IsValid(self:GetActiveWeapon()) then
		self:GetActiveWeapon():SetNoDraw(self:GetWeaponState() == VJ.NPC_WEP_STATE_HOLSTERED)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimData(idle,crouch,crouch_move,walk,run,fire,reload,melee,walk_aim,run_aim,idle_aim)
	if type(idle) == "string" then idle = VJ_SequenceToActivity(self,idle) end
	if type(crouch) == "string" then crouch = VJ_SequenceToActivity(self,crouch) end
	if type(crouch_move) == "string" then crouch_move = VJ_SequenceToActivity(self,crouch_move) end
	if type(walk) == "string" then walk = VJ_SequenceToActivity(self,walk) end
	if type(run) == "string" then run = VJ_SequenceToActivity(self,run) end
	if type(walk_aim) == "string" then walk_aim = VJ_SequenceToActivity(self,walk_aim) end
	if type(run_aim) == "string" then run_aim = VJ_SequenceToActivity(self,run_aim) end
	if type(idle_aim) == "string" then idle_aim = VJ_SequenceToActivity(self,idle_aim) end

	self.AnimationTranslations[ACT_IDLE] 							= idle
	self.AnimationTranslations[ACT_WALK] 							= walk
	self.AnimationTranslations[ACT_RUN] 							= run
	self.AnimationTranslations[ACT_IDLE_ANGRY] 					= idle_aim
	self.AnimationTranslations[ACT_WALK_AIM] 						= walk_aim
	self.AnimationTranslations[ACT_WALK_CROUCH] 					= run
	self.AnimationTranslations[ACT_WALK_CROUCH_AIM] 				= walk_aim
	self.AnimationTranslations[ACT_RUN_AIM] 						= run_aim
	self.AnimationTranslations[ACT_RUN_CROUCH] 					= run
	self.AnimationTranslations[ACT_RUN_CROUCH_AIM] 				= run_aim
	self.AnimationTranslations[ACT_RANGE_ATTACK1] 					= idle_aim
	self.AnimationTranslations[ACT_RANGE_ATTACK1_LOW] 				= crouch
	self.AnimationTranslations[ACT_RELOAD]							= "vjges_" .. reload
	self.AnimationTranslations[ACT_COVER_LOW] 						= crouch
	self.AnimationTranslations[ACT_RELOAD_LOW] 					= "vjges_" .. reload
	self.AnimTbl_WeaponReload 										= {"vjges_" .. reload}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimationTranslations(htype)
	self.CurrentHoldType = htype

	local idle = ACT_IDLE
	local idle_aim = ACT_IDLE_AIM_RELAXED
	local walk = ACT_WALK
	local walk_aim = ACT_WALK_AIM
	local run = ACT_RUN
	local run_aim = ACT_RUN_AIM
	local crouch_move = ACT_WALK_AIM
	local fire = "cb_firestart"
	local crouch = "cb_crouchidle"
	local reload = "cb_reload"
	local melee = ACT_MELEE_ATTACK1
	self:SetAnimData(idle,crouch,crouch_move,walk,run,fire,reload,melee,walk_aim,run_aim,idle_aim)
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	local dmg = dmginfo:GetDamage()
	if self.Shields > 0 then
		if dmginfo:IsBulletDamage() then
			self.Shields = self.Shields -dmg
			ParticleEffect("hunter_shield_impact",dmginfo:GetDamagePosition(),Angle(0,0,0))
			dmginfo:SetDamage(0)
			if self.Shields <= 0 then
				self.Shields = 0
				VJ_EmitSound(self,"ambient/energy/weld" .. math.random(1,2) .. ".wav",80,100)
				VJ_EmitSound(self,"geth/ss_geth_trooper_S.0" .. math.random(27,30) .. ".wav",90,100)
				ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*30,Angle(0,0,0),self)
				ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*70,Angle(0,0,0),self)
				ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*90,Angle(0,0,0),self)
				timer.Simple(10,function()
					if IsValid(self) then
						VJ_EmitSound(self,"ambient/energy/whiteflash.wav",80,115)
						VJ_EmitSound(self,"geth/ss_geth_trooper_S.0" .. math.random(13,15) .. ".wav",90,100)
						ParticleEffect("hunter_shield_impact",self:GetPos() + self:GetUp()*30,Angle(0,0,0),self)
						ParticleEffect("hunter_shield_impact",self:GetPos() + self:GetUp()*70,Angle(0,0,0),self)
						ParticleEffect("hunter_shield_impact",self:GetPos() + self:GetUp()*90,Angle(0,0,0),self)
						self.Shields = 250
					end
				end)
			end
		end
	end
	if self.Armor > 0 then
		if !dmginfo:IsBulletDamage() then
			if self.Armor -dmg < 0 then
				self.Armor = 0
			else
				self.Armor = self.Armor -dmg
			end
			dmginfo:SetDamage(0)
		end
	end
end