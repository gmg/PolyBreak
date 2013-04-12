require("Scripts/Ball")
require("Scripts/Brick")
require("Scripts/Paddle")
require("Scripts/Wall")

--[[ 
PolyBreak 
by Gwyn Perry
--]]

screen = PhysicsScreen(10, 60)
screen:setGravity(Vector2(0, 0))

--Create first ball with x, y, direction, speed
ball = Ball(640/2, 480*0.6, -90, 10)

--Create bricks (replace with proper loader function later)
for i=0, 8 do
	for j=0, 4 do
		brick = Brick(32+i*64, 64+j*32)
	end
end

--Create walls
wallL = Wall(0, 0, 32, 480)
wallR = Wall(608, 0, 32, 480)
wallT = Wall(32, 0, 576, 32)

--Create paddle
paddle = Paddle(640/2, 480-32, 64, 16)

function onNewCollision(t, event)
	physicsEvent = safe_cast(event, PhysicsScreenEvent)
	ent1 = physicsEvent:getFirstEntity()
	ent2 = physicsEvent:getSecondEntity()
	if ent1:hasTag("BRICK") then
		print("Hit a brick")
		screen:removePhysicsChild(ent1)
	elseif ent2:hasTag("BRICK") then
		print("Hit a brick")
		screen:removePhysicsChild(ent2)
		--damage or remove bricks, check win
	end
end

screen:addEventListener(nil, onNewCollision, PhysicsScreenEvent.EVENT_NEW_SHAPE_COLLISION)

function Update(elapsed)
	paddle:Update(elapsed)
	ball:Update(elapsed)
end




