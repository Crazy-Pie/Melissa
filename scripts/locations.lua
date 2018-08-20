loc = {}
function loc.mainmenu()

end

function loc.testloc()
    map = sti("tests/hex.lua")
    player.load()
	rect =  HC.rectangle(50,50,100,100)
    rect2 = HC.rectangle(300,50,100,100)
    rect3 = HC.rectangle(450,50,100,100)
    rect4 = HC.rectangle(450,150,100,100)
    player.x=200
    player.y=300
    cam = gamera.new(0,0,900,900)
    cam:setWorld(0,0,900,900)
    playercollisionshow=false

function loc.drawWorld()

    map:draw(0,0,3,3)
    rect:draw('line')
    rect2:draw('line')
    rect3:draw('line')
    rect4:draw('line')
    
    player.draw()
    if playercollisionshow==true then
    plrup:draw('line')
    plrdown:draw('line')
    plrleft:draw('line')
    plrright:draw('line')
        end
    end
    
end

function love.keypressed(key)
    if key == "l" then playercollisionshow=true end
    if key == "k" then playercollisionshow=false end
    if key == "left" then love.window.setMode(1280, 720, {resizable=false, vsync=false, minwidth=427, minheight=240}) end
    if key == "right" then love.window.setMode(640, 360, {resizable=false, vsync=false, minwidth=427, minheight=240}) end
    if key == "up" then love.window.setMode(1920, 1080, {resizable=false, vsync=false, minwidth=427, minheight=240}) end
    end
    
    

function loc.update(dt)
    map:update(dt)
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
    love.graphics.print("Left: "..tostring(player.leftfree), 10, 70)
    love.graphics.print("Right: "..tostring(player.rightfree), 10, 80)
    love.graphics.print("Up: "..tostring(player.upfree), 10, 90)
    love.graphics.print("Down: "..tostring(player.downfree), 10, 100)
    
	love.graphics.setColor(255,255,255)
end

return loc