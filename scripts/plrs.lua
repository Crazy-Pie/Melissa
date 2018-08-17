player = {}
player.x=0
player.y=0
player.sp=120
player.boost=50
player.dir="left"
player.moving=false
love.graphics.setDefaultFilter("nearest", "nearest")
player.plrsprite = love.graphics.newImage('graphics/player/plrr_strip32.png')

local g = anim8.newGrid(32, 64, player.plrsprite:getWidth(), player.plrsprite:getHeight())
player.sd = anim8.newAnimation(g('1-1',1), 0.2)
player.wd = anim8.newAnimation(g('2-5',1), 0.2)
player.su = anim8.newAnimation(g('32-32',1), 0.2)
player.wu = anim8.newAnimation(g('28-31',1), 0.2)
player.sl = anim8.newAnimation(g('27-27',1), 0.2)
player.wl = anim8.newAnimation(g('23-26',1), 0.2)
player.sr = anim8.newAnimation(g('22-22',1), 0.2)
player.wr = anim8.newAnimation(g('18-21',1), 0.2)
player.currentanim=player.sd

function player.load()
	
	plr = HC.rectangle(player.x,player.y,20,22)


end

function player.update(dt)
plr:moveTo(player.x+16,player.y+50)
player.currentanim:update(dt)

if love.keyboard.isDown("w") then player.y = player.y-(player.sp+player.boost)*dt player.moving=true player.dir="up" end
if love.keyboard.isDown("s") then player.y = player.y+(player.sp+player.boost)*dt player.moving=true player.dir="down" end
if love.keyboard.isDown("a") then player.x = player.x-(player.sp+player.boost)*dt player.moving=true player.dir="left" end
if love.keyboard.isDown("d") then player.x = player.x+(player.sp+player.boost)*dt player.moving=true player.dir="right"end
if love.keyboard.isDown("lshift") then player.boost=100 else player.boost=0 end	

function love.keyreleased(key)
   if key == "w" or key == "a" or key == "d" or key == "s" then
      player.moving=false
   end
end


 -- check for collisions
  for shape, delta in pairs(HC.collisions(plr)) do
	   player.x=player.x+delta.x
	   player.y=player.y+delta.y
	end

end

function player.draw()

if player.moving==true then 
	
	if player.dir=="left" then 		player.wl:draw(player.plrsprite, player.x,player.y) player.currentanim=player.wl end
	if player.dir=="right" then 	player.wr:draw(player.plrsprite, player.x,player.y) player.currentanim=player.wr end
	if player.dir=="up" then 		player.wu:draw(player.plrsprite, player.x,player.y) player.currentanim=player.wu end
	if player.dir=="down" then 		player.wd:draw(player.plrsprite, player.x,player.y) player.currentanim=player.wd end
	
	end
	
	if player.moving==false then 
	
	if player.dir=="left" then 		player.sl:draw(player.plrsprite, player.x,player.y) player.currentanim=player.sl end
	if player.dir=="right" then 	player.sr:draw(player.plrsprite, player.x,player.y) player.currentanim=player.sr end
	if player.dir=="up" then 		player.su:draw(player.plrsprite, player.x,player.y) player.currentanim=player.su end
	if player.dir=="down" then 		player.sd:draw(player.plrsprite, player.x,player.y) player.currentanim=player.sd end
	
	end 

end

return player