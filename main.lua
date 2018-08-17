HC = require 'HC'
anim8 = require 'anim8'
player = require 'scripts/plrs'
height = love.graphics.getHeight()
width = love.graphics.getWidth()

function love.load()

love.graphics.setDefaultFilter("nearest", "nearest")
player.load()
rect = HC.rectangle(50,50,100,100)
end

function love.update(dt)
player.update(dt)
end



function love.draw()
	love.graphics.setBackgroundColor(0,0,1)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    love.graphics.setColor(255,255,255)
	rect:draw('fill')
	plr:draw('fill')
	player.draw()
	

end

