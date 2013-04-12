class "Ball" (ScreenShape)

function Ball:Ball(x, y, direction, speed)
	ScreenShape.ScreenShape(self, ScreenShape.SHAPE_RECT, 16, 16)

	self:setPosition(x, y)
	self:setColor(1.0, 1.0, 1.0, 1.0)

	--Convert direction and speed to a vector
	self.speed = Vector2(cos(direction)*speed, sin(direction)*speed)

	screen:addPhysicsChild(self,  PhysicsScreenEntity.ENTITY_CIRCLE, false, 0.0, 1.0, 1.0, false, true, -1)
	screen:setVelocity(self, self.speed.x, self.speed.y)
end

function Ball:Update(elapsed)
	--check lose condition
end