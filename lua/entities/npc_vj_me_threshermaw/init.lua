AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2025 by Cpt. Hazama, All rights reserved. *** 
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/masseffect/threshermaw.mdl"
ENT.StartHealth = 10000

ENT.HullType = HULL_LARGE
ENT.SightDistance = 10000 -- How far it can see | 5000 is a good Number
ENT.TurningSpeed = 5 -- This is how fast it can turn around | 5000 is the usual number, but sometimes it may need change
ENT.VJ_IsHugeMonster = true -- Is this a huge monster?
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.VJ_NPC_Class = {"CLASS_THRESHERMAW"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle and etc.)
ENT.BloodColor = "Blue"
ENT.Immune_CombineBall = true -- Immune to Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Makes the SNPC not get damage from Acid, posion, radiation
ENT.Immune_Physics = true -- If set to true, the SNPC won't take damage from props
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"vjseq_attack_spit"} -- Melee Attack Animations
ENT.MeleeAttackDistance = 750 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 1200 -- How far does the damage go?
ENT.TimeUntilMeleeAttackDamage = 1 -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttackDamage = 400
ENT.MeleeAttackDamageType = DMG_CRUSH -- Type of Damage
ENT.HasFootStepSound = false -- Should the SNPC make a footstep sound when it's moving?
ENT.HasSounds = true
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIESIMPLE} -- Death Animations
ENT.DeathAnimationTime = 4 -- Time until the SNPC spawns its corpse and gets removed
ENT.UsesDamageForceOnDeath = false -- Disables the damage force on death | Useful for SNPCs with Death Animations
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.AnimTbl_RangeAttack = {ACT_RANGE_ATTACK1} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_me_tms" -- The entity that is spawned when range attacking
ENT.RangeDistance = 10000 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "mouth" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.TimeUntilRangeAttackProjectileRelease = 1.6 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 2 -- How much time until it can use a range attack?
ENT.NextAnyAttackTime_Range = 1.8 -- How much time until it can use a attack again? | Counted in Seconds

	-- Sounds --
-- Reminder: If you leave a sound blank, the game will still try to play!
ENT.SoundTbl_Alert = {"threshermaw/ss_maw_bat1.mp3", "threshermaw/ss_maw_bat2.mp3", "threshermaw/ss_maw_bat3.mp3", "threshermaw/ss_maw_bat4.mp3", "threshermaw/ss_maw_bat5.mp3", "threshermaw/ss_maw_bat6.mp3"}
ENT.SoundTbl_Idle = {"threshermaw/ss_maw_kbk1.mp3", "threshermaw/ss_maw_kbk2.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"threshermaw/ss_maw_atk1.mp3", "threshermaw/ss_maw_atk2.mp3", "threshermaw/ss_maw_atk3.mp3", "threshermaw/ss_maw_atk4.mp3", "threshermaw/ss_maw_atk5.mp3", "threshermaw/ss_maw_atk6.mp3"}
ENT.SoundTbl_MeleeAttackMiss = {"threshermaw/ss_maw_atk1.mp3", "threshermaw/ss_maw_atk2.mp3", "threshermaw/ss_maw_atk3.mp3", "threshermaw/ss_maw_atk4.mp3", "threshermaw/ss_maw_atk5.mp3", "threshermaw/ss_maw_atk6.mp3"}
ENT.SoundTbl_BeforeRangeAttack = {"threshermaw/ss_maw_atk1.mp3", "threshermaw/ss_maw_atk2.mp3", "threshermaw/ss_maw_atk3.mp3", "threshermaw/ss_maw_atk4.mp3", "threshermaw/ss_maw_atk5.mp3", "threshermaw/ss_maw_atk6.mp3"}
ENT.SoundTbl_Death = {"threshermaw/ss_maw_dead1.mp3", "threshermaw/ss_maw_dead2.mp3", "threshermaw/ss_maw_dead3.mp3"}
ENT.SoundTbl_Pain = {"threshermaw/ss_maw_hit1.mp3", "threshermaw/ss_maw_hit2.mp3", "threshermaw/ss_maw_hit3.mp3", "threshermaw/ss_maw_hit4.mp3", "threshermaw/ss_maw_hit5.mp3", "threshermaw/ss_maw_hit6.mp3"}

ENT.AlertSoundLevel = 110
ENT.IdleSoundLevel = 110
ENT.BeforeMeleeAttackSoundLevel = 110
ENT.PainSoundLevel = 110
ENT.DeathSoundLevel = 110
ENT.BeforeRangeAttackSoundLevel = 110
ENT.ThemeSoundLevel = 0.9
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self:SetCollisionBounds(Vector(300, 300, 600), Vector(-300, -300, 0))
	self.BurrowState = 0
	self.BurrowTime = CurTime() +6
	timer.Simple(0,function() if IsValid(self) then local _,dur = self:VJ_ACT_PLAYACTIVITY(ACT_ARM,true,false,false) util.ScreenShake(self:GetPos(),16,100,dur,2000) end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetClearPos(origin)
	local mins = self:OBBMins()
	local maxs = self:OBBMaxs()
	local pos = origin || self:GetPos()
	local nearents = ents.FindInBox(pos +mins,pos +maxs)
	maxs.x = maxs.x *2
	maxs.y = maxs.y *2
	local zMax = 0
	local entTgt

	for _,ent in ipairs(nearents) do
		if(ent != self && ent:GetSolid() != SOLID_NONE && ent:GetSolid() != SOLID_BSP && gamemode.Call("ShouldCollide",self,ent) != false) then
			local obbMaxs = ent:OBBMaxs()
			if(obbMaxs.z > zMax) then
				zMax = obbMaxs.z
				entTgt = ent
			end
		end
	end

	local tbl_filter = {self,entTgt}
	local stayaway = zMax > 0

	if(!stayaway) then
		pos.z = pos.z +10
	else
		zMax = zMax +10
	end

	local left = Vector(0,1,0)
	local right = left *-1
	local forward = Vector(1,0,0)
	local back = forward *-1

	local trace_left = util.TraceLine({
		start = pos,
		endpos = pos +left *maxs.y,
		filter = tbl_filter
	})

	local trace_right = util.TraceLine({
		start = pos,
		endpos = pos +right *maxs.y,
		filter = tbl_filter
	})

	if(trace_left.Hit || trace_right.Hit) then
		if(trace_left.Fraction < trace_right.Fraction) then
			pos = pos +right *((trace_right.Fraction -trace_left.Fraction) *maxs.y)
		elseif(trace_right.Fraction < trace_left.Fraction) then
			pos = pos +left *((trace_left.Fraction -trace_right.Fraction) *maxs.y)
		end
	elseif(stayaway) then
		pos = pos +(math.random(1,2) == 1 && left || right) *maxs.y *1.8
		stayaway = false
	end

	local trace_forward = util.TraceLine({
		start = pos,
		endpos = pos +forward *maxs.x,
		filter = tbl_filter
	})

	local trace_backward = util.TraceLine({
		start = pos,
		endpos = pos +back *maxs.x,
		filter = tbl_filter
	})

	if(trace_forward.Hit || trace_backward.Hit) then
		if(trace_forward.Fraction < trace_backward.Fraction) then
			pos = pos +back *((trace_backward.Fraction -trace_forward.Fraction) *maxs.x)
		elseif(trace_backward.Fraction < trace_forward.Fraction) then
			pos = pos +forward *((trace_forward.Fraction -trace_backward.Fraction) *maxs.x)
		end
	elseif(stayaway) then
		pos = pos +(math.random(1,2) == 1 && forward || back) *maxs.x *1.8
		stayaway = false
	end

	if(stayaway) then -- We can't avoid whatever it is we're stuck in, let's try to spawn on top of it
		local start = entTgt:GetPos()
		start.z = start.z +zMax
		local endpos = start
		endpos.z = endpos.z +maxs.z

		local tr = util.TraceLine({
			start = start,
			endpos = endpos,
			filter = tbl_filter
		})
	
		if(!tr.Hit || (!tr.HitWorld && gamemode.Call("ShouldCollide",self,tr.Entity) == false)) then
			pos.z = start.z
			stayaway = false
		else -- Just try to move to whatever direction seems best
			local trTgt = trace_left
			if(trace_right.Fraction < trTgt.Fraction) then trTgt = trace_right end
			if(trace_forward.Fraction < trTgt.Fraction) then trTgt = trace_forward end
			if(trace_backward.Fraction < trTgt.Fraction) then trTgt = trace_backward end
			pos = pos +trTgt.Normal *maxs.x
		end
	end
	self:SetPos(pos)
	self:DropToFloor()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(proj)
	return VJ.CalculateTrajectory(self, self:GetEnemy(), "CurveAntlion", proj:GetPos(), 0.75, 1000)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BurrowCode()
	if self.BurrowState == 0 then
		self:ClearSchedule()
		self:ResetIdealActivity(ACT_IDLE)
		self:SetState(VJ_STATE_ONLY_ANIMATION_NOATTACK)
		local anim,dur = self:VJ_ACT_PLAYACTIVITY(ACT_DISARM,true,false,false,0,{OnFinish=function(interrupted)
			if interrupted then return end
			self:SetNoDraw(true)
			self:DrawShadow(false)
			self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self:AddFlags(FL_NOTARGET)
			timer.Simple(math.Rand(2,5),function()
				if IsValid(self) then
					self:BurrowCode()
				end
			end)
		end})
		util.ScreenShake(self:GetPos(),16,100,dur,2000)
		self.BurrowState = 1
		self.BurrowTime = CurTime() +math.Rand(6,15)
	elseif self.BurrowState == 1 then
		self:RemoveFlags(FL_NOTARGET)
		local nodegraph = table.Copy(VJ_Nodegraph.Data.Nodes)
		local possibleNodes = {}
		for _,node in pairs(nodegraph) do
			local dist = self:GetPos():Distance(node.pos)
			if node.type == 2 && dist < 1500 && dist > 500 then
				table.insert(possibleNodes,node.pos)
			end
		end
		if #possibleNodes > 0 then
			local newPos = VJ.PICK(possibleNodes)
			self:SetClearPos(newPos)
			self:SetAngles(Angle(0,math.random(0,360),0))
		end
		self:SetNoDraw(false)
		self:DrawShadow(true)
		self:SetCollisionGroup(COLLISION_GROUP_NPC)
		local anim,dur = self:VJ_ACT_PLAYACTIVITY(ACT_ARM,true,false,false,0,{OnFinish=function(interrupted)
			if interrupted then return end
			self:SetState()
		end})
		util.ScreenShake(self:GetPos(),16,100,dur,2000)
		self.BurrowState = 0
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomAttack(ent,vis)
	if self:IsBusy() or self:BusyWithActivity() then return end

	if self.BurrowState == 0 && CurTime() > self.BurrowTime && math.random(1,12) == 1 then
		self:BurrowCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.MeleeAttacking then
		self:SetPlaybackRate(2.5)
	else
		self:SetPlaybackRate(1)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleRangeAttacks()
	if math.random(1,4) == 1 then
		self.RangeAttackExtraTimers = {1.45,1.75}
	else
		self.RangeAttackExtraTimers = {}
	end
end