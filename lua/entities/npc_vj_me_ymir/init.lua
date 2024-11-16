AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2025 by Cpt. Hazama, All rights reserved. *** 
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/masseffect/ymir.mdl"
ENT.StartHealth = 800
ENT.MoveType = MOVETYPE_STEP
ENT.HullType = HULL_LARGE
ENT.VJ_NPC_Class = {"CLASS_BLUESUNS"}

-- ENT.Bleeds = false -- Does the SNPC bleed? (Blood decal, particle and etc.)

ENT.HasFootStepSound = true -- Should the SNPC make a footstep sound when it's moving?
ENT.FootStepTimeRun = 0.63 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.63 -- Next foot step sound when it is walking
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.PushProps = false -- True = Pushes props (The ones in the code only!)
ENT.AttackProps = false -- True = Destroys props (The ones in the code only!)

ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.AnimTbl_RangeAttack = ACT_RANGE_ATTACK2_LOW -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_me_missile" -- The entity that is spawned when range attacking
ENT.RangeDistance = 3000 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "cannon" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.TimeUntilRangeAttackProjectileRelease = 1.1 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 6 -- How much time until it can use a range attack?
ENT.NextAnyAttackTime_Range = 1.5 -- How much time until it can use a attack again? | Counted in Seconds

ENT.ConstantlyFaceEnemy = true -- Should it face the enemy constantly?
ENT.ConstantlyFaceEnemy_IfVisible = true -- Should it only face the enemy if it's visible?
ENT.ConstantlyFaceEnemy_Postures = "Both" -- "Both" = Moving or standing | "Moving" = Only when moving | "Standing" = Only when standing
ENT.ConstantlyFaceEnemyDistance = 3000 -- How close does it have to be until it starts to face the enemy?
ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = 400 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 0 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "Regular" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack

ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIESIMPLE} -- Death Animations
ENT.DeathAnimationTime = 1.5 -- Time until the SNPC spawns its corpse and gets removed
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.GibOnDeathDamagesTable = {"All"}

ENT.HasWorldShakeOnMove = true -- Should the world shake when it's moving?
ENT.NextWorldShakeOnRun = 0.63 -- How much time until the world shakes while it's running
ENT.NextWorldShakeOnWalk = 0.63 -- How much time until the world shakes while it's walking
ENT.WorldShakeOnMoveAmplitude = 8 -- How much the screen will shake | From 1 to 16, 1 = really low 16 = really high
ENT.WorldShakeOnMoveRadius = 850 -- How far the screen shake goes, in world units
ENT.WorldShakeOnMoveDuration = 0.4 -- How long the screen shake will last, in seconds
ENT.WorldShakeOnMoveFrequency = 100 -- Just leave it to 100

ENT.SoundTbl_FootStep = {"YMIR/footsteps/fs_robot_giant2.wav","YMIR/footsteps/fs_robot_giant3.wav","YMIR/footsteps/fs_robot_giant4.wav","YMIR/footsteps/fs_robot_giant5.wav"}
ENT.SoundTbl_Idle = {"YMIR/ss_heavy_mech_S_INT.001.wav","YMIR/ss_heavy_mech_S_INT.002.wav","YMIR/ss_heavy_mech_S_INT.003.wav","YMIR/ss_heavy_mech_S_INT.005.wav","YMIR/ss_heavy_mech_S_INT.006.wav","YMIR/ss_heavy_mech_S_INT.008.wav","YMIR/ss_heavy_mech_S_INT.009.wav","YMIR/ss_heavy_mech_S_INT.011.wav","YMIR/ss_heavy_mech_S_INT.012.wav","YMIR/ss_heavy_mech_S_INT.013.wav","YMIR/ss_heavy_mech_S_INT.017.wav","YMIR/ss_heavy_mech_S_INT.018.wav","YMIR/ss_heavy_mech_S_INT.020.wav","YMIR/ss_heavy_mech_S_INT.021.wav","YMIR/ss_heavy_mech_S_INT.022.wav","YMIR/ss_heavy_mech_S_INT.024.wav","YMIR/ss_heavy_mech_S_INT.036.wav","YMIR/ss_heavy_mech_S_INT.037.wav","YMIR/ss_heavy_mech_S_INT.039.wav","YMIR/ss_heavy_mech_S_INT.040.wav","YMIR/ss_heavy_mech_S_INT.041.wav","YMIR/ss_heavy_mech_S_INT.042.wav"}
ENT.SoundTbl_CombatIdle = {"YMIR/ss_heavy_mech_S_INT.019.wav","YMIR/ss_heavy_mech_S_INT.023.wav","YMIR/ss_heavy_mech_S_INT.025.wav"}
ENT.SoundTbl_Pain = {"YMIR/ss_heavy_mech_S_INT.004.wav","YMIR/ss_heavy_mech_S_INT.010.wav","YMIR/ss_heavy_mech_S_INT.014.wav","YMIR/ss_heavy_mech_S_INT.015.wav","YMIR/ss_heavy_mech_S_INT.016.wav","YMIR/ss_heavy_mech_S_INT.029.wav","YMIR/ss_heavy_mech_S_INT.038.wav"}
ENT.SoundTbl_Death = {"YMIR/ss_heavy_mech_S_INT.044.wav"}

ENT.CollisionBounds = Vector(25,35,135)
ENT.ShootDistance = 3000
ENT.FireDelay = 0.001
ENT.NextFireT = CurTime() +1
ENT.PrimarySound = "weapons/smg1/smg1_fire1.wav"
ENT.PrimaryReloadSound = "weapons/ar2/npc_ar2_reload.wav"
ENT.PrimaryClip = 200
ENT.PrimaryClipDefault = 200
ENT.ReloadTime = 3
ENT.FirstTimeRan = false
ENT.PossibleFireAnimations = {ACT_IDLE,ACT_RANGE_ATTACK2,ACT_WALK,ACT_RUN}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self.ShieldHealth = 200
	self.ShieldActivated = true
	self.Bleeds = false
	self:SetCollisionBounds(self.CollisionBounds,Vector(self.CollisionBounds.x *-1,self.CollisionBounds.y *-1,0))
	timer.Simple(0,function()
		if IsValid(self) then
			self:VJ_ACT_PLAYACTIVITY(ACT_ARM,true,false,false)
			self.NextFireT = CurTime() +3
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomAttack(ent,vis)
	if self:IsBusy() or !vis then return end
	if self.PrimaryClip <= 0 then return self:VJ_Reload() end

	local startpos = self:GetAttachment(self:LookupAttachment("minigun")).Pos
	local bSpread = 150
	local bullet = {}
	bullet.Num = 1
	bullet.Src = startpos
	bullet.Dir = ((ent:GetPos() +ent:OBBCenter()) -startpos):GetNormalized() *4000
	bullet.Spread = Vector(math.random(-bSpread,bSpread),math.random(-bSpread,bSpread),math.random(-bSpread,bSpread))
	bullet.Tracer = 1
	bullet.TracerName = "AirboatGunTracer"
	bullet.Force = 5
	bullet.Damage = 3
	bullet.AmmoType = "AirboatGun"
	bullet.Callback = function(attacker,tr,dmginfo)
		util.ScreenShake(tr.HitPos,16,100,0.2,50)
	end
	self:FireBullets(bullet)
	ParticleEffect("vj_rifle_full_blue", startpos, self:GetAngles())
	sound.Play(Sound(self.PrimarySound),startpos,100,100,1)	
	local FireLight1 = ents.Create("light_dynamic")
	FireLight1:SetKeyValue("brightness", "4")
	FireLight1:SetKeyValue("distance", "120")
	FireLight1:SetPos(startpos)
	FireLight1:SetLocalAngles(self:GetAngles())
	FireLight1:Fire("Color", "255 150 60")
	FireLight1:SetParent(self)
	FireLight1:Spawn()
	FireLight1:Activate()
	FireLight1:Fire("TurnOn","",0)
	FireLight1:Fire("Kill","",0.07)
	self:DeleteOnRemove(FireLight1)
	self.PrimaryClip = self.PrimaryClip -1
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:VJ_Reload()
	if self.FirstTimeRan == true then return end
	self.FirstTimeRan = true
	self:EmitSound(Sound("hl1/fvox/ammo_depleted.wav",85,100))
	self:VJ_ACT_PLAYACTIVITY(ACT_RELOAD,false,false,false)
	self:EmitSound(Sound(self.PrimaryReloadSound,75,100))
	timer.Simple(self.ReloadTime,function() if IsValid(self) then
		self.PrimaryClip = self.PrimaryClipDefault
		self.FirstTimeRan = false
	end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if self.ShieldActivated == true then
		self.Bleeds = true
		self.BloodParticle = "hunter_shield_impact"
		self.BloodDecal = ""
	else
		self.Bleeds = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeImmuneChecks(dmginfo)
	if self.ShieldActivated == true then
		self:RemoveAllDecals()
		dmginfo:ScaleDamage(0.5)
		self.ShieldHealth = (self.ShieldHealth - dmginfo:GetDamage())
		ParticleEffect("hunter_shield_impact",dmginfo:GetDamagePosition(),Angle(0,0,0),self)
		if self.ShieldHealth <= 0 then
			self:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
		end
	else
		self:EmitSound(Sound("weapons/fx/rics/ric" .. math.random(1,5) .. ".wav",75,100))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
	if self.ShieldActivated == false then return end
	local att = self:GetAttachment(self:LookupAttachment("minigun"))
	local att2 = self:GetAttachment(self:LookupAttachment("cannon"))
	self:EmitSound(Sound("ambient/energy/weld" .. math.random(1,2) .. ".wav",90,100))
	self:EmitSound(Sound("YMIR/ss_heavy_mech_S_INT.027.wav",85,100))
	ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*30,Angle(0,0,0),self)
	ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*65,Angle(0,0,0),self)
	ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*40 + self:GetRight()*20,Angle(0,0,0),self)
	ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*40 + self:GetRight()*-20,Angle(0,0,0),self)
	ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*70,Angle(0,0,0),self)
	ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*90,Angle(0,0,0),self)
	ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*80 + self:GetRight()*20,Angle(0,0,0),self)
	ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*90 + self:GetRight()*-20,Angle(0,0,0),self)
	ParticleEffect("hunter_projectile_explosion_1",att.Pos,Angle(0,0,0),self)
	ParticleEffect("hunter_projectile_explosion_1",att2.Pos,Angle(0,0,0),self)
	self.ShieldActivated = false
	timer.Simple(15,function()
		if IsValid(self) then
			self.ShieldHealth = 200
			self.ShieldActivated = true
			self.Bleeds = false
			self:EmitSound(Sound("ambient/energy/weld" .. math.random(1,2) .. ".wav",90,100))
			ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*30,Angle(0,0,0),self)
			ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*65,Angle(0,0,0),self)
			ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*40 + self:GetRight()*20,Angle(0,0,0),self)
			ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*40 + self:GetRight()*-20,Angle(0,0,0),self)
			ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*70,Angle(0,0,0),self)
			ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*90,Angle(0,0,0),self)
			ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*80 + self:GetRight()*20,Angle(0,0,0),self)
			ParticleEffect("hunter_projectile_explosion_1",self:GetPos() + self:GetUp()*90 + self:GetRight()*-20,Angle(0,0,0),self)
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAngle = Angle(0,0,0)
--
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Finish" then
		util.BlastDamage(self, self, self:GetPos(), 400, 40)
		util.ScreenShake(self:GetPos(), 16, 200, 1, 5000)
		if self.HasGibOnDeathEffects == true then
			local pos = self:GetPos()
			util.ScreenShake(self:GetPos(), 15, 200, 1, 3000)
			if self.HasGibOnDeathEffects == true then ParticleEffect("vj_explosion2", pos, defAngle) end
			local effectdata = EffectData()
			effectdata:SetOrigin(pos)
			util.Effect("Explosion", effectdata)
		end
		local setupGibs, setupGibsExtra = self:SetUpGibesOnDeath(dmginfo, hitgroup)
		if setupGibs == true then
			if setupGibsExtra then
				if setupGibsExtra.AllowCorpse != true then self.HasDeathCorpse = false end
				if setupGibsExtra.DeathAnim != true then self.HasDeathAnimation = false end
			else
				self.HasDeathCorpse = false
				self.HasDeathAnimation = false
			end
			self.GibbedOnDeath = true
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
	self:VJ_ACT_PLAYACTIVITY(ACT_DIESIMPLE,true,false,false)
	self.ShieldActivated = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
local gibMdls = {"models/props_debris/metal_panelchunk01a.mdl","models/props_debris/metal_panelchunk01b.mdl","models/props_debris/metal_panelchunk01d.mdl","models/props_debris/metal_panelchunk01e.mdl","models/props_debris/metal_panelchunk01f.mdl","models/props_debris/metal_panelchunk01g.mdl","models/props_debris/metal_panelchunk02d.mdl","models/props_debris/metal_panelchunk02e.mdl"}
local gibColor = Color(134, 134, 134)
--
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	if self.DeathAnimationCodeRan == false then return false end
	for i = 0, self:GetBoneCount() *0.35 do
		if self:GetBoneName(i) == nil then continue end
		self:CreateGibEntity("prop_physics", gibMdls, {Pos=self:GetBonePosition(i), Vel=self:GetForward()*math.Rand(-200,200) + self:GetRight()*math.Rand(-200,200) + self:GetUp()*math.Rand(350,600)}, function(gib)
			gib:Ignite(math.Rand(20, 30), 0)
			gib:SetColor(gibColor)
		end)
	end
	return true, {DeathAnim=true}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup) return false end -- Disable gib sounds