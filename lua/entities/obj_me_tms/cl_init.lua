include('shared.lua')

language.Add("obj_me_tms", "Thresher Maw")
killicon.Add("obj_me_tms","HUD/killicons/default",Color ( 255, 80, 0, 255 ) )

language.Add("#obj_me_tms", "Thresher Maw")
killicon.Add("#obj_me_tms","HUD/killicons/default",Color ( 255, 80, 0, 255 ) )

function ENT:Draw()
	self.Entity:DrawModel()
end
