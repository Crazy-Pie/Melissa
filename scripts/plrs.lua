player = {}
player.x=0
player.y=0
player.sp=120
player.boost=50
player.dir="down"
player.moving=false
love.graphics.setDefaultFilter("nearest", "nearest")
player.blink=5
player.blink2=false
player.jiggle=0
player.upfree=true
player.downfree=true
player.leftfree=true
player.rightfree=true

function player.load()
	player:head()
	player:body()

	plrup = HC.rectangle(player.x,player.y,10,8)
	plrdown = HC.rectangle(player.x,player.y,10,8)
	plrleft = HC.rectangle(player.x,player.y,8,10)
	plrright = HC.rectangle(player.x,player.y,8,10)

end

function player.update(dt)

	plrup:moveTo(player.x+16,player.y+40)
	plrdown:moveTo(player.x+16,player.y+60)
	plrleft:moveTo(player.x+7,player.y+50)
	plrright:moveTo(player.x+25,player.y+50)

	player.currentanim:update(dt)
	player.currentanim2:update(dt)

	if love.keyboard.isDown("w") then 
		player.dir="up" 
		if player.upfree==true then 
			player.y = player.y-(player.sp+player.boost)*dt player.moving=true 
		end
 	end
	if love.keyboard.isDown("s") then 
		player.dir="down" 
		if player.downfree==true then 
			player.y = player.y+(player.sp+player.boost)*dt player.moving=true 
		end 
	end
	if love.keyboard.isDown("a") then 
		player.dir="left" 
		if player.leftfree==true then 
			player.x = player.x-(player.sp+player.boost)*dt player.moving=true 
		end 
	end
	if love.keyboard.isDown("d") then 
		player.dir="right"
		if player.rightfree==true then 
			player.x = player.x+(player.sp+player.boost)*dt player.moving=true 
		end 
	end
	if love.keyboard.isDown("lshift") then player.boost=50 else player.boost=0 end	

	function love.keyreleased(key)
   		if key == "w" or key == "a" or key == "d" or key == "s" then
      	player.moving=false
   		end
	end
	player.upfree=true
	player.downfree=true
	player.leftfree=true
	player.rightfree=true

 --check for collisions
  	for shape, delta in pairs(HC.collisions(plrup)) do
		player.upfree=false
		--player.x=player.x+delta.x
		--player.y=player.y+delta.y
	end
--check for collisions
  	for shape, delta in pairs(HC.collisions(plrdown)) do
		player.downfree=false
	end
--check for collisions
  	for shape, delta in pairs(HC.collisions(plrleft)) do
		player.leftfree=false
	end
--check for collisions
  	for shape, delta in pairs(HC.collisions(plrright)) do
		player.rightfree=false
	end

	if player.blink>0 then player.blink=player.blink-(1*dt) else player.blink2=true player.blink=math.random(1,15) end

	if player.currentanim2==player.hdblink or player.currentanim2==player.hrblink or player.currentanim2==player.hlblink then if player.currentanim2:currentFrame()==4 then player.currentanim2:gotoFrame(1) player.blink2=false end end 
	if player.currentanim==player.wl or player.currentanim==player.wr or player.currentanim==player.wu or player.currentanim==player.wd then if player.currentanim:currentFrame()==1 or player.currentanim:currentFrame()==3 then player.jiggle=1 else player.jiggle=0 end end 
end

function player.draw()
--ТЕЛО
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
	

		---ГОЛОВА
	if player.blink2==true then 
		if player.dir=="left" then 		player.hlblink:draw(player.plrspritehead, player.x+3,player.y+9+player.jiggle) player.currentanim2=player.hlblink end
		if player.dir=="right" then 	player.hrblink:draw(player.plrspritehead, player.x+5,player.y+9+player.jiggle) player.currentanim2=player.hrblink end
		if player.dir=="up" then 		player.hu:draw(player.plrspritehead, player.x+4,player.y+9+player.jiggle) player.currentanim2=player.su end
		if player.dir=="down" then 		player.hdblink:draw(player.plrspritehead, player.x+4,player.y+9+player.jiggle) player.currentanim2=player.hdblink end
	end
	if player.blink2==false then
		if player.dir=="left" then 		player.hl:draw(player.plrspritehead, player.x+3,player.y+9+player.jiggle) player.currentanim2=player.hl end
		if player.dir=="right" then 	player.hr:draw(player.plrspritehead, player.x+5,player.y+9+player.jiggle) player.currentanim2=player.hr end
		if player.dir=="up" then 		player.hu:draw(player.plrspritehead, player.x+4,player.y+9+player.jiggle) player.currentanim2=player.hu end
		if player.dir=="down" then 		player.hd:draw(player.plrspritehead, player.x+4,player.y+9+player.jiggle) player.currentanim2=player.hd end
	end

end

function player:head()

	player.plrspritehead = love.graphics.newImage('graphics/player/melissa_head.png')
	local g2 = anim8.newGrid(24, 31, player.plrspritehead:getWidth(), player.plrspritehead:getHeight())
	player.hd = anim8.newAnimation(g2('1-1',1), 0.18)
	player.hdblink = anim8.newAnimation(g2('1-4',1), 0.18)
	player.hr = anim8.newAnimation(g2('5-5',1), 0.18)
	player.hrblink = anim8.newAnimation(g2('5-8',1), 0.18)
	player.hl = anim8.newAnimation(g2('9-9',1), 0.18)
	player.hlblink = anim8.newAnimation(g2('9-12',1), 0.18)
	player.hu = anim8.newAnimation(g2('13-13',1), 0.18)
	player.currentanim2=player.hd
end

function player:body()

	player.plrsprite = love.graphics.newImage('graphics/player/melissa_body.png')
	local g = anim8.newGrid(32, 64, player.plrsprite:getWidth(), player.plrsprite:getHeight())
	player.sd = anim8.newAnimation(g('2-2',1), 0.18)
	player.wd = anim8.newAnimation(g('1-4',1), 0.18)
	player.su = anim8.newAnimation(g('16-16',1), 0.18)
	player.wu = anim8.newAnimation(g('13-16',1), 0.18)
	player.sl = anim8.newAnimation(g('10-10',1), 0.18)
	player.wl = anim8.newAnimation(g('9-12',1), 0.18)
	player.sr = anim8.newAnimation(g('8-8',1), 0.18)
	player.wr = anim8.newAnimation(g('5-8',1), 0.18)
	player.currentanim=player.sd
end


return player