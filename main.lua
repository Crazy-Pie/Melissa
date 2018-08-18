HC = require 'scripts/HC'
anim8 = require 'scripts/anim8'
player = require 'scripts/plrs'
gamera = require 'scripts/gamera'
loc = require 'scripts/locations'
camsetup = require 'scripts/camset'

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	loc.testloc() --Для дебага потом поменяю чтоб меню грузило
end

function love.update(dt)
	loc.update(dt)
end

function love.draw()
	loc.draw()
	
  cam:draw(function(l,t,w,h)
	loc.drawWorld()
	end)

end

function love.keypressed(key)
if key == "left" then love.window.setMode(1280, 720, {resizable=false, vsync=false, minwidth=427, minheight=240}) end
if key == "right" then love.window.setMode(640, 480, {resizable=false, vsync=false, minwidth=427, minheight=240}) end
if key == "up" then love.window.setMode(1920, 1080, {resizable=false, vsync=false, minwidth=427, minheight=240}) end
end

