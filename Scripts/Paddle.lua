class "Paddle" (ScreenShape)

function Paddle:Paddle(x, y, w, h)
	ScreenShape.ScreenShape(self, ScreenShape.SHAPE_RECT, w, h)

	self:setPosition(x, y)
	self:setColor(0.5, 0.5, 0.7, 1.0)

	screen:addCollisionChild(self, PhysicsScreenEntity.ENTITY_RECT)
end

function Paddle:Update(elapsed)
	--To access the mouse, we need to store the returned vector in a local variable
	local pos = Services.Core:getInput():getMousePosition()
	--Lua doesn't have a clamp function, so this hack job is necessary
	self.position.x = max(64, min(576, pos.x))
	--The local variable needs to be deleted for memory management purposes
	delete(pos)
end