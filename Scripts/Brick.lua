class "Brick" (ScreenShape)

function Brick:Brick(x, y)
	ScreenShape.ScreenShape(self, ScreenShape.SHAPE_RECT, 64, 32)
	
	--shift brick position because TOPLEFT doesn't work with physics entities
	self:setPosition(x+32, y+16)
	--pick a random pastel colour for the brick
	--(in future, subclass ScreenImage and set an image from a sprite sheet)
	self:setColor(0.5+random()*0.5, 0.5+random()*0.5, 0.5+random()*0.5, 1.0)
	
	screen:addPhysicsChild(self,  PhysicsScreenEntity.ENTITY_RECT, true, 0.0, 1.0, 1.0, false, true, -2)
	self:addTag("BRICK")
end