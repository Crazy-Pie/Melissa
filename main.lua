HC = require 'scripts/HC'
anim8 = require 'scripts/anim8'
player = require 'scripts/plrs'
gamera = require 'scripts/gamera'
loc = require 'scripts/locations'
camsetup = require 'scripts/camset'
sti = require 'scripts/sti'

function love.load()
	mres = love.graphics.getWidth()/16
	love.window.setMode(16*mres, 9*mres, {resizable=false, vsync=false, minwidth=427, minheight=240})
	love.graphics.setDefaultFilter("nearest", "nearest")
	loc.testloc() --Для дебага потом поменяю чтоб меню грузило
end

function love.update(dt)
	loc.update(dt)
end

function love.draw()
	
  	cam:draw(function(l,t,w,h)loc.drawWorld()end)

  	loc.draw()
	love.graphics.print(love.graphics.getWidth(),100,100)
	love.graphics.print(love.graphics.getHeight(),100,110)

end
