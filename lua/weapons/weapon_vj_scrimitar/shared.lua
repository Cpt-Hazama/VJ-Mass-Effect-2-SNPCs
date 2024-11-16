if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "M-27 Scrimitar"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://vrejgaming.webs.com/"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Mass Effect 2"
	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if (CLIENT) then
SWEP.Slot						= 3 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos					= 3 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.SwayScale 					= 1 -- Default is 1, The scale of the viewmodel sway
SWEP.CSMuzzleFlashes 			= false -- Use CS:S Muzzle flash?
end
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel					= "models/masseffect/weapons/v_shotgun.mdl"
SWEP.WorldModel					= "models/masseffect/weapons/w_shotgun.mdl"
SWEP.HoldType 					= "shotgun"
SWEP.ViewModelFlip				= false -- Flip the model? Usally used for CS:S models
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= false
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 10/2 -- Damage
SWEP.Secondary.PlayerDamage		= 10/2 -- Put 1 to make it the same as above
SWEP.Primary.Force				= 15 -- Force applied on the object the bullet hits
SWEP.Primary.NumberOfShots		= 6 -- How many shots per attack?
SWEP.Primary.ClipSize			= 8 -- Max amount of bullets per clip
SWEP.Primary.ClipSizeReload		= 7 -- If there is x amount of bullets left in the clip, then reload
SWEP.Primary.DefaultClip		= 13 -- How much ammo do you get when you first pick up the weapon?
SWEP.Primary.Recoil				= 0.35 -- How much recoil does the player get?
SWEP.Primary.Cone				= 18 -- How accurate is the bullet? (Players)
SWEP.Primary.Delay				= 0.65 -- Time until it can shoot again
SWEP.Primary.Tracer				= 1
SWEP.Primary.TracerType			= "AirboatGunTracer" -- Tracer type (Examples: AR2, laster, 9mm)
SWEP.Primary.TakeAmmo			= 1 -- How much ammo should it take on each shot?
SWEP.Primary.Automatic			= false -- Is it automatic?
SWEP.Primary.Ammo				= "Buckshot" -- Ammo type
SWEP.Primary.Sound				= "weapons/scimitar/shotgun_fire7.wav"
SWEP.Primary.HasDistantSound	= false -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= "weapons/scimitar/shotgun_dbl_fire.wav" -- The distant sound
	-- Deployment Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DelayOnDeploy 				= 1 -- Time until it can shoot again after deploying the weapon
	-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasReloadSound				= true -- Does it have a reload sound? Remember even if this is set to false, the animation sound will still play!
SWEP.ReloadSound 				= "weapons/avenger/smg1_reload.wav"
SWEP.SetReloadingToFalseTime	= 1 -- Time until self.Reloading becomes false, so the gun for example can holster
	-- Idle Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasIdleAnimation			= true -- Does it have a idle animation?
SWEP.IdleAnimationID			= ACT_VM_IDLE -- The idle animation to play
SWEP.NextIdle_Deploy			= 1 -- How much time until it plays the idle animation after the weapon gets deployed
SWEP.NextIdle_PrimaryAttack		= 0.3 -- How much time until it plays the idle animation after attacking(Primary)
SWEP.NextIdle_Reload			= 1 -- How much time until it plays the idle animation after reloading
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_EnableDontUseRegulate 	= false -- Used for VJ Base SNPCs, if enabled the SNPC will remove use regulate
SWEP.NPC_NextPrimaryFire 		= 0.65 -- Next time it can use primary fire
SWEP.NPC_UsePistolBehavior 		= false -- Should it check the pistol activities when the NPC is firing the weapon?
---------------------------------------------------------------------------------------------------------------------------------------------
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
function SWEP:FireAnimationEvent(pos,ang,event,options,ShootDir)
	if (CLIENT) then
	local vjeffect = EffectData()
	vjeffect:SetEntity(self.Weapon)
	if !self.Owner:IsNPC() then
	vjeffect:SetOrigin(self.Owner:GetShootPos())
	else
	vjeffect:SetOrigin(pos)
	end
	if !self.Owner:IsNPC() then
	vjeffect:SetNormal(self.Owner:GetAimVector())
	else return end
	vjeffect:SetAttachment(1)
	util.Effect("vj_weapon_memuzzle",vjeffect)
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