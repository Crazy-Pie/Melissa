HC = require 'HC'
anim8 = require 'anim8'
player = require 'scripts/plrs'
gamera = require 'scripts/gamera'

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	player.load()

	cameraSetup1()
	rect = HC.rectangle(50,50,100,100)
	rect2 = HC.rectangle(300,50,100,100)


end

function love.update(dt)
	player.update(dt)
	cameraUpdate()
end

local function drawWorld()
rect:draw('line')
rect2:draw('line')
---plr:draw('fill')
end

local function drawPlayer()
  player.draw()
end

function love.draw()
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	love.graphics.print(cam:getScale(), 10, 20)
	love.graphics.print("X: "..tostring(player.x), 10, 30)
	love.graphics.print("y: "..tostring(player.y), 10, 40)
	love.graphics.setColor(255,255,255)
	
  cam:draw(function(l,t,w,h)
	drawWorld()
	drawPlayer()
	end)

end

function love.keypressed(key)
if key == "left" then love.window.setMode(1280, 720, {resizable=false, vsync=false, minwidth=427, minheight=240}) end
if key == "right" then love.window.setMode(640, 480, {resizable=false, vsync=false, minwidth=427, minheight=240}) end
if key == "up" then love.window.setMode(1920, 1080, {resizable=false, vsync=false, minwidth=427, minheight=240}) end
end

function cameraSetup1()
	cam = gamera.new(0,0,2000,2000)
	cam:setWorld(0,0,2000,2000)
end

function cameraUpdate()
gameresheight=love.graphics.getHeight()
gamereswidth=love.graphics.getWidth()
cam:setPosition(player.x, player.y)
cam:setWindow(0,0,gamereswidth,gameresheight)
cam:setScale(gameresheight/240)
end