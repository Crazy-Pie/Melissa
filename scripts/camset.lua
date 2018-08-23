camsetup = {}

function camsetup.cameraUpdate()
gameresheight=love.graphics.getHeight()
gamereswidth=love.graphics.getWidth()
cam:setPosition(math.floor(player.x), math.floor(player.y))
cam:setWindow(0,0,gamereswidth,gameresheight)
cam:setScale(gameresheight/240)
end

return camsetup