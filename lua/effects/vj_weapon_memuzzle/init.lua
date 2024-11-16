if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
/*--------------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
function EFFECT:Init(data)
	if !IsValid(data:GetEntity()) then return end
	self.Pos = self:GetTracerShootPos(data:GetOrigin(),data:GetEntity(),data:GetAttachment())
	local Emitter = ParticleEmitter(self.Pos)
	if Emitter == nil then return end
	
	LocalPlayrMagnitude = 0
	if IsValid(data:GetEntity()) && IsValid(data:GetEntity():GetOwner()) && data:GetEntity():GetOwner():IsPlayer() && data:GetEntity().Owner == LocalPlayer() then
		LocalPlayrMagnitude = data:GetMagnitude() else
		LocalPlayrMagnitude = 0
	end

	-- Muzzle Flash
	if GetConVarNumber("vj_wep_nomuszzleflash") == 0 && IsValid(data:GetEntity()) then
	for i = 1,3 do
		// "effects/combinemuzzle"..math.random(1,2)
		local EffectCode = Emitter:Add("effects/combinemuzzle"..math.random(1,2),self.Pos + LocalPlayrMagnitude * data:GetNormal())
		EffectCode:SetVelocity(data:GetNormal() + 1.1 * data:GetEntity():GetOwner():GetVelocity())
		//EffectCode:SetAirResistance(200)
		EffectCode:SetDieTime(math.Rand(0.05,0.05)) -- How much time until it dies
		EffectCode:SetStartAlpha(math.Rand(200,255)) -- Transparency
		EffectCode:SetStartSize(math.Rand(5,6)) -- Size of the effect
		EffectCode:SetEndSize(math.Rand(16,20)) -- Size of the effect at the end (The effect slowly trasnsforms to this size)
		EffectCode:SetRoll(math.Rand(480,540))
		EffectCode:SetRollDelta(math.Rand(-1,1)) -- How fast it rolls
		EffectCode:SetColor(0,31,225) -- The color of the effect
		//EffectCode:SetGravity(Vector(0,0,100)) -- The Gravity
		end
		local EffectCode = Emitter:Add("effects/yellowflare", self.Pos)
		EffectCode:SetVelocity(data:GetNormal() + 1.1 * data:GetEntity():GetOwner():GetVelocity())
		EffectCode:SetAirResistance(160)
		EffectCode:SetDieTime(0.05)
		EffectCode:SetStartAlpha(255)
		EffectCode:SetEndAlpha(0)
		EffectCode:SetStartSize(.5)
		EffectCode:SetEndSize(15)
		EffectCode:SetRoll(math.Rand(180, 480))
		EffectCode:SetRollDelta(math.Rand(-1, 1))
		EffectCode:SetColor(0,31,225)
	end

	-- Heat wave
	if GetConVarNumber("vj_wep_nomuzzleheatwave") == 0 && IsValid(data:GetEntity()) then
		local EffectCode = Emitter:Add("sprites/heatwave",self.Pos + LocalPlayrMagnitude * data:GetNormal())
		EffectCode:SetVelocity(data:GetNormal() + 1.1 * data:GetEntity():GetOwner():GetVelocity())
		EffectCode:SetDieTime(math.Rand(0.15,0.2)) -- How much time until it dies
		//EffectCode:SetStartAlpha(math.Rand(90,100)) -- Transparency
		EffectCode:SetStartSize(math.Rand(7,9)) -- Size of the effect
		EffectCode:SetEndSize(math.Rand(4,6)) -- Size of the effect at the end (The effect slowly trasnsforms to this size)
		EffectCode:SetRoll(math.Rand(480,540))
		EffectCode:SetRollDelta(math.Rand(-1,1)) -- How fast it rolls
		EffectCode:SetColor(0,40,225) -- The color of the effect
		//EffectCode:SetGravity(Vector(0,0,100)) -- The Gravity
	end

	if GetConVarNumber("vj_wep_nomuszzleflash") == 0 && IsValid(data:GetEntity()) then
  	if IsValid(data:GetEntity():GetOwner()) then
	 if data:GetEntity():GetOwner():IsPlayer() then
	  for i = 1,4 do
		local EffectCode = Emitter:Add("effects/yellowflare",self.Pos)
		EffectCode:SetVelocity(((data:GetNormal() + VectorRand() * 0.5) * math.Rand(150, 200)))
		EffectCode:SetDieTime(math.Rand(0.5, 0.8))
		EffectCode:SetStartAlpha(255)
		EffectCode:SetStartSize(.5)
		EffectCode:SetEndSize(2)
		EffectCode:SetRoll(0)
		EffectCode:SetGravity(Vector(0, 0, -1))
		EffectCode:SetBounce(.8)
		EffectCode:SetAirResistance(400)
		EffectCode:SetStartLength(0.01)
		EffectCode:SetEndLength(0)
		EffectCode:SetVelocityScale(true)
		EffectCode:SetCollide(false)
		end
	 end
	end
  end
	Emitter:Finish()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function EFFECT:Think()
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function EFFECT:Render()
end
/*--------------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/