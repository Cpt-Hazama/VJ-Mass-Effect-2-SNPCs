if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Graal Spike Thrower"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://vrejgaming.webs.com/"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Mass Effect 2"
	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if (CLIENT) then
SWEP.Slot						= 3 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos					= 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.SwayScale 					= 1 -- Default is 1, The scale of the viewmodel sway
SWEP.CSMuzzleFlashes 			= false -- Use CS:S Muzzle flash?
end
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel					= "models/masseffect/weapons/v_crossbow.mdl"
SWEP.WorldModel					= "models/masseffect/weapons/w_crossbow.mdl"
SWEP.HoldType 					= "ar2"
SWEP.ViewModelFlip				= false -- Flip the model? Usally used for CS:S models
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= false
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 202/2 -- Damage
SWEP.Secondary.PlayerDamage		= 202/2 -- Put 1 to make it the same as above
SWEP.Primary.Force				= 1000 -- Force applied on the object the bullet hits
SWEP.Primary.NumberOfShots		= 1 -- How many shots per attack?
SWEP.Primary.ClipSize			= 3 -- Max amount of bullets per clip
SWEP.Primary.ClipSizeReload		= 2 -- If there is x amount of bullets left in the clip, then reload
SWEP.Primary.DefaultClip		= 24 -- How much ammo do you get when you first pick up the weapon?
SWEP.Primary.Recoil				= 0.75 -- How much recoil does the player get?
SWEP.Primary.Cone				= 0.1 -- How accurate is the bullet? (Players)
SWEP.Primary.Delay				= 0.6 -- Time until it can shoot again
SWEP.Primary.Tracer				= 0
SWEP.Primary.TakeAmmo			= 1 -- How much ammo should it take on each shot?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Ammo				= "XBowBolt" -- Ammo type
SWEP.Primary.Sound				= "weapons/carnifex/357_fire2.wav"
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= "weapons/carnifex/357_fire3.wav" -- The distant sound
-- SWEP.Primary.TracerType			= "AirboatGunTracer" -- Tracer type (Examples: AR2, laster, 9mm)
	-- Deployment Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DelayOnDeploy 				= 1 -- Time until it can shoot again after deploying the weapon
	-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasReloadSound				= true -- Does it have a reload sound? Remember even if this is set to false, the animation sound will still play!
SWEP.ReloadSound 				= "weapons/carnifex/thermal.wav"
SWEP.SetReloadingToFalseTime	= 1 -- Time until self.Reloading becomes false, so the gun for example can holster
	-- Idle Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasIdleAnimation			= true -- Does it have a idle animation?
SWEP.IdleAnimationID			= ACT_VM_IDLE -- The idle animation to play
SWEP.NextIdle_Deploy			= 1 -- How much time until it plays the idle animation after the weapon gets deployed
SWEP.NextIdle_PrimaryAttack		= 0.3 -- How much time until it plays the idle animation after attacking(Primary)
SWEP.NextIdle_Reload			= 1 -- How much time until it plays the idle animation after reloading
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_EnableDontUseRegulate 	= true -- Used for VJ Base SNPCs, if enabled the SNPC will remove use regulate
SWEP.NPC_NextPrimaryFire 		= 0.6 -- Next time it can use primary fire
SWEP.NPC_UsePistolBehavior 		= false -- Should it check the pistol activities when the NPC is firing the weapon?
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttack(ShootPos,ShootDir)
	//if self.Owner:KeyDown(IN_RELOAD) then return end
	//self.Owner:SetFOV( 45, 0.3 )
	if self.Owner:IsPlayer() then if self.Owner:WaterLevel() == 3 then return end end
	if (!self:CanPrimaryAttack()) then return end
	if (SERVER) then
		sound.Play(Sound(self.Primary.Sound),self:GetPos(),75,math.random(90,100))
		if self.Primary.HasDistantSound == true then
		sound.Play(Sound(self.Primary.DistantSound),self:GetPos(),150,math.random(110,150))
		end
	end
	//self.Weapon:EmitSound(Sound(self.Primary.Sound),80,self.Primary.SoundPitch)
	if (SERVER) then
		local bolt = ents.Create("crossbow_bolt")
		if !self.Owner:IsNPC() then
		bolt:SetPos( self.Owner:GetEyeTrace().StartPos )
		bolt:SetAngles( self.Owner:EyeAngles() )
		bolt:SetVelocity( self.Owner:GetAimVector() * 3499 )
		else
		bolt:SetPos( ShootPos )
		bolt:SetAngles( self.Owner:GetAngles() )
		bolt:SetVelocity( ShootDir * 3499 )
		end
		bolt:Spawn()
		bolt:SetOwner(self.Owner)
		bolt:SetPhysicsAttacker(self.Owner)
		bolt:SetUnFreezable( true )
	end
	if GetConVarNumber("vj_wep_nomuszzleflash") == 0 then
	self.Owner:MuzzleFlash() end
	self:PrimaryAttackEffects()
	if self.Owner:IsPlayer() then
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.Owner:ViewPunch(Angle(-self.Primary.Recoil,0,0)) end
	if !self.Owner:IsNPC() then
		self:TakePrimaryAmmo(self.Primary.TakeAmmo)
	end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	if self.HasIdleAnimation == true then
	timer.Simple(self.NextIdle_PrimaryAttack,function() if self:IsValid() then if self.Reloading == false then self.Weapon:SendWeaponAnim(self.IdleAnimationID) end end end) end
end

function SWEP:PrimaryAttackEffects()
	if (SERVER) then
	if GetConVarNumber("vj_wep_nomuszzleflash") == 0 then
	local FireLight1 = ents.Create("light_dynamic")
	FireLight1:SetKeyValue("brightness", "2")
	if self.Owner:IsPlayer() then
	FireLight1:SetKeyValue("distance", "200") else FireLight1:SetKeyValue("distance", "150") end
	FireLight1:SetLocalPos(self.Owner:GetShootPos() +self:GetForward()*40)
	FireLight1:SetLocalAngles(self:GetAngles())
	FireLight1:Fire("Color", "255 150 60")
	FireLight1:SetParent(self)
	FireLight1:Spawn()
	FireLight1:Activate()
	FireLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(FireLight1)
	timer.Simple(0.07,function() if self:IsValid() then FireLight1:Remove() end end)
	end
 end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:FireAnimationEvent(pos,ang,event,options)
	if (CLIENT) then
	local vjeffect = EffectData()
	vjeffect:SetEntity(self.Weapon)
	vjeffect:SetOrigin(self.Owner:GetShootPos())
	vjeffect:SetNormal(self.Owner:GetAimVector())
	vjeffect:SetAttachment(1)
	util.Effect("vj_weapon_memuzzle",vjeffect)
	
	local vjeffect = EffectData()
	vjeffect:SetEntity(self.Weapon)
	vjeffect:SetOrigin(self.Owner:GetShootPos())
	vjeffect:SetNormal(self.Owner:GetAimVector())
	vjeffect:SetAttachment(2)
	util.Effect("VJ_Weapon_RifleShell1",vjeffect)
	end
	
	//print(event)
	if GetConVarNumber("vj_wep_nomuszzleflash") == 1 then
	if event == 5001 then 
		return true end 
	end
	
	if GetConVarNumber("vj_wep_nobulletshells") == 1 then
	if event == 20 then 
		return true end 
	end
end