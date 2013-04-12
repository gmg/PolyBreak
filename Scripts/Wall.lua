class "Wall" (ScreenShape)

function Wall:Wall(x, y, w, h)
	ScreenShape.ScreenShape(self, ScreenShape.SHAPE_RECT, w, h)

	--shift wall position because TOPLEFT doesn't work with physics entities
	self:setPosition(x+w/2, y+h/2)
	self:setColor(0.5, 0.5, 0.7, 1.0)
	
	--isStatic and fixedRotation set true
	screen:addPhysicsChild(self, PhysicsScreenEntity.ENTITY_RECT, true, 0.0, 1.0, 1.0, false, true)
end