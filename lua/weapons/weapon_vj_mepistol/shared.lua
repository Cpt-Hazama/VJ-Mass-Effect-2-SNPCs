if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Shuriken"
SWEP.Author 					= "Cpt. Hazama"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Mass Effect 2"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel					= "models/masseffect/weapons/w_pistolc.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.HoldType 					= "pistol" -- List of holdtypes are in the GMod wiki
SWEP.MadeForNPCsOnly 			= true -- Is this weapon meant to be for NPCs only?
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 0.6 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFireExtraTimers = {0.1,0.2} -- Extra timers, which will make the gun fire again! | The seconds are counted after the self.NPC_TimeUntilFire!
SWEP.NPC_ReloadSound			= {"legion/handgun_reload.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.PrimaryEffects_MuzzleParticles = {"vj_rifle_full_blue"}
SWEP.PrimaryEffects_MuzzleAttachment = "muzzleA"
SWEP.PrimaryEffects_SpawnShells = false
SWEP.PrimaryEffects_DynamicLightColor = Color(0, 150, 255)
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 9 -- Damage
SWEP.Primary.ClipSize			= 18 -- Max amount of bullets per clip
SWEP.Primary.Sound				= {"legion/handgun_gen.wav"}
SWEP.Primary.TracerType			= "AirboatGunTracer"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_AfterShoot()
	if IsValid(self:GetOwner()) then
		self:GetOwner():RestartGesture(ACT_RANGE_ATTACK1)
	end
end