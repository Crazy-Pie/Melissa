loc = {}
function loc.mainmenu()

end

function loc.testloc()

    player.load()
	rect = HC.rectangle(50,50,100,100)
    rect2 = HC.rectangle(300,50,100,100)
    player.x=200
    player.y=150
    cam = gamera.new(0,0,900,900)
	cam:setWorld(0,0,900,900)

function loc.drawWorld()
    rect:draw('line')
    rect2:draw('line')
    player.draw()
    end
    
end

function loc.update(dt)
    player.update(dt)
    camsetup.cameraUpdate()
end

function loc.draw()
    love.graphics.setBackgroundColor(0,0,0)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	love.graphics.print(cam:getScale(), 10, 20)
	love.graphics.print("X: "..tostring(player.x), 10, 30)
    love.graphics.print("y: "..tostring(player.y), 10, 40)
    love.graphics.print(player.currentanim:currentFrame(), 10, 50)
    love.graphics.print(player.currentanim2:currentFrame(), 10, 60)
    
	love.graphics.setColor(255,255,255)
end

return loc