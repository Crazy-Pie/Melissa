HC = require 'HC'
anim8 = require 'anim8'
player = require 'scripts/plrs'
gamera = require 'scripts/gamera'


function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	cam = gamera.new(0,0,2000,2000)
	cam:setWorld(0,0,2000,2000)
	cam:setWindow(0,0,1280,720)
	cam:setScale(3) -- make everything twice as bigger. By default, scale is 1 (no change)
	player.load()
	rect = HC.rectangle(50,50,100,100)


end

function love.update(dt)
	player.update(dt)
	cam:setPosition(player.x, player.y)

end

local function drawWorld()
rect:draw('fill')
plr:draw('fill')
end

local function drawPlayer()
  player.draw()
end

function love.draw()
	love.graphics.setBackgroundColor(0,1,1)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
  love.graphics.setColor(255,255,255)
  cam:draw(function(l,t,w,h)
	drawWorld()
	drawPlayer()
	end)

end

