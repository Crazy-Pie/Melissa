HC = require 'HC'
anim8 = require 'anim8'
local plrsprite,sd,wd,su,wu,sl,wl,sr,wr
x=0
y=0
sp=100
boost=20
dir="left"
moving=false;

function love.load()
love.graphics.setDefaultFilter("nearest", "nearest")

--sd = newAnimation(love.graphics.newImage("plrr_strip32.png"), 1024, 64, 1)

	plrsprite = love.graphics.newImage('plrr_strip32.png')
	local g = anim8.newGrid(32, 64, plrsprite:getWidth(), plrsprite:getHeight())
	sd = anim8.newAnimation(g('1-1',1), 0.2)
	wd = anim8.newAnimation(g('2-5',1), 0.2)
	su = anim8.newAnimation(g('32-32',1), 0.2)
	wu = anim8.newAnimation(g('28-31',1), 0.2)
	sl = anim8.newAnimation(g('27-27',1), 0.2)
	wl = anim8.newAnimation(g('23-26',1), 0.2)
	sr = anim8.newAnimation(g('22-22',1), 0.2)
	wr = anim8.newAnimation(g('18-21',1), 0.2)


ct2=love.graphics.newImage("wu1.png")

rect = HC.rectangle(50,50,100,100)
plr = HC.rectangle(x,y,32,64)


end

function love.update(dt)
plr:moveTo(x+16,y+32)

sd:update(dt)
su:update(dt)
sl:update(dt)
sr:update(dt)
wd:update(dt)
wl:update(dt)
wr:update(dt)
wu:update(dt)

if love.keyboard.isDown("w") then y = y-(sp+boost)*dt moving=true dir="up" end
if love.keyboard.isDown("s") then y = y+(sp+boost)*dt moving=true dir="down" end
if love.keyboard.isDown("a") then x = x-(sp+boost)*dt moving=true dir="left" end
if love.keyboard.isDown("d") then x = x+(sp+boost)*dt moving=true dir="right"end
if love.keyboard.isDown("lshift") then boost=50 else boost=0 end	

function love.keyreleased(key)
   if key == "w" or key == "a" or key == "d" or key == "s" then
      moving=false
   end
end


 -- check for collisions
    for shape, delta in pairs(HC.collisions(plr)) do
	   
	   plr:move(delta.x, delta.y)
	   x=x+delta.x
	   y=y+delta.y
	   -- other:move(-delta.x/2, -delta.y/2)

	end
	


end



function love.draw()
	love.graphics.setBackgroundColor(0,0,1)
	love.graphics.draw(ct2,40,50)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    love.graphics.setColor(255,255,255)
    --rect:draw('fill')
    --plr:draw('fill')
	
	if moving==true then 
	
	if dir=="left" then 	wl:draw(plrsprite, x, y) end
	if dir=="right" then 	wr:draw(plrsprite, x, y) end
	if dir=="up" then 	wu:draw(plrsprite, x, y) end
	if dir=="down" then 	wd:draw(plrsprite, x, y) end
	
	end
	
	if moving==false then 
	
	if dir=="left" then 	sl:draw(plrsprite, x, y) end
	if dir=="right" then 	sr:draw(plrsprite, x, y) end
	if dir=="up" then 	su:draw(plrsprite, x, y) end
	if dir=="down" then 	sd:draw(plrsprite, x, y) end
	
	end 
	

	
end

