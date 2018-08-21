camsetup = {}

function camsetup.cameraUpdate()
    gameresheight=love.graphics.getHeight()
    gamereswidth=love.graphics.getWidth()
    cam:setPosition(math.floor(player.x+16), math.floor(player.y+32))
    cam:setWindow(0,0,gamereswidth,gameresheight)
    cam:setScale(gameresheight/240)
end

return camsetup