loc = {}

function loc.mainmenu()

end

function loc.testloc()
    map = sti("tests/test.lua", { "bump" })
    world = bump.newWorld()
    map:bump_init(world)
    player.load()
    cam = gamera.new(0,0,1120,768)
    cam:setWorld(0,0,1120,768)
    playercollisionshow=false

function loc.drawWorld()
    map:draw(0,0)
    --bump_debug.draw(world)
    player.draw()

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
    player.update(dt)
    camsetup.cameraUpdate()
    map:update(dt)
end

function loc.draw()
    
    love.graphics.setBackgroundColor(0,0,0)
    love.graphics.setColor(1,1,0)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	love.graphics.print(cam:getScale(), 10, 20)
	love.graphics.print("X: "..tostring(player.x), 10, 30)
    love.graphics.print("y: "..tostring(player.y), 10, 40)
    love.graphics.print(currentanim:currentFrame(), 10, 50)
    love.graphics.print(currentanim2:currentFrame(), 10, 60)
	love.graphics.setColor(255,255,255)
end

function loc.delete()

end

return loc