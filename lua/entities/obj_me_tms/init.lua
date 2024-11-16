AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2014 by DrVrej, All rights reserved. *** 
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.IdleSound1 = Sound("vj_acid/acid_idle1.wav")
ENT.TouchSound = Sound("vj_acid/acid_splat.wav")
ENT.TouchSoundv = 80
ENT.Decal = "vj_acidslime1"
ENT.AlreadyPaintedDecal = false
ENT.Damage = 45
ENT.DamageDistance = 200
ENT.Dead = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
	self:SetModel("models/spitball_large.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetMoveCollide(COLLISION_GROUP_PROJECTILE)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	self:SetSolid(SOLID_CUSTOM)
	self:SetOwner(self:GetOwner())
	self:DrawShadow(false)
	self:SetNoDraw(true)
	
	-- Physics Functions
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		//phys:SetMass(1)
		phys:SetBuoyancyRatio(0)
		phys:EnableDrag(false)
	end
	
	-- Misc Functions
	ParticleEffectAttach("threshermaw_acid", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_b", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_c", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_exp", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_exp_a", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_exp_b", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Think()
if self.Dead == true then if self.idlesoundc then self.idlesoundc:Stop() end end
if self:IsValid() then
	if self.Dead == false then
	self.idlesoundc = CreateSound(self, self.IdleSound1)
	self.idlesoundc:Play()
	-- ParticleEffectAttach("threshermaw_acid", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_b", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_c", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_exp", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_exp_a", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_exp_b", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	end
 end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PhysicsCollide(data,physobj,entity)
	-- Removes
	self.Dead = true
	if self.idlesoundc then self.idlesoundc:Stop() end
	self:StopParticles()
	
	-- Damages
	if self:GetOwner() == NULL then util.VJ_SphereDamage(self,self,self:GetPos(),150,45,DMG_POISON,true,true) else
	util.VJ_SphereDamage(self:GetOwner(),self,self:GetPos(),150,45,DMG_POISON,true,true) end
	
	-- Effects
	self:DeathEffects()
	self:EmitSound( self.TouchSound,self.TouchSoundv,math.random(80,100))
	for k, v in pairs (ents.FindInSphere(self:GetPos(),1)) do
	if v:IsValid() or v:IsWorld() then
	local decalchance = math.random(1,4)
	if decalchance == 1 then util.Decal("vj_acidslime1", data.HitPos +data.HitNormal, data.HitPos -data.HitNormal) end
	if decalchance == 2 then util.Decal("vj_acidslime2", data.HitPos +data.HitNormal, data.HitPos -data.HitNormal) end
	if decalchance == 3 then util.Decal("vj_acidslime3", data.HitPos +data.HitNormal, data.HitPos -data.HitNormal) end
	if decalchance == 4 then util.Decal("vj_acidslime4", data.HitPos +data.HitNormal, data.HitPos -data.HitNormal) end end end
	self:Remove()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects()
	local effectdata = EffectData()
	effectdata:SetOrigin(self:GetPos())
	effectdata:SetScale( 1 )
	util.Effect( "StriderBlood", effectdata )
	util.Effect( "StriderBlood", effectdata )
	util.Effect( "StriderBlood", effectdata )

	ParticleEffectAttach("threshermaw_acid_exp", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_exp_a", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- ParticleEffectAttach("threshermaw_acid_exp_b", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRemove()
	self.Dead = true
	if self.idlesoundc then self.idlesoundc:Stop() end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2014 by DrVrej, All rights reserved. *** 
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/