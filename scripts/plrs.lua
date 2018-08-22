--переменные
local cols_len = 0

local player = {x=100,y=100,w=24,h=20,speed=100,boost=50,dir="down",moving=false,blink=5,blink2=false,jiggle=0}

cols_len=0

local function updatePlayer(dt)

	local speed = player.speed+player.boost

	local dx, dy = 0, 0
	
  if love.keyboard.isDown('d') then
	player.moving=true
    dx = speed * dt
	player.dir="right"
  elseif love.keyboard.isDown('a') then
	player.moving=true
    dx = -speed * dt
	player.dir="left"
  end
  
  if love.keyboard.isDown('s') then
	player.moving=true
    dy = speed * dt
	player.dir="down"
  elseif love.keyboard.isDown('w') then
	player.moving=true
    dy = -speed * dt
	player.dir="up"
  end

  if love.keyboard.isDown("lshift") then player.boost=100 else player.boost=0 end	
  
  if dx ~= 0 or dy ~= 0 then
    local cols
		player.x, player.y, cols, cols_len = world:move(player, player.x + dx, player.y + dy)
	end
 
 	function love.keyreleased(key)
		if key == "w" or key == "a" or key == "d" or key == "s" then
			player.moving=false
		end
	end
 
end

local function loadhead()

	plrspritehead = love.graphics.newImage('graphics/player/melissa_head.png')
	local g2 = anim8.newGrid(24, 31,plrspritehead:getWidth(), plrspritehead:getHeight())
	hd = anim8.newAnimation(g2('1-1',1), 0.18)
	hdblink = anim8.newAnimation(g2('1-4',1), 0.18)
	hr = anim8.newAnimation(g2('5-5',1), 0.18)
	hrblink = anim8.newAnimation(g2('5-8',1), 0.18)
	hl = anim8.newAnimation(g2('9-9',1), 0.18)
	hlblink = anim8.newAnimation(g2('9-12',1), 0.18)
	hu = anim8.newAnimation(g2('13-13',1), 0.18)
	currentanim2=hd
	
end

local function loadbody()

	plrsprite = love.graphics.newImage('graphics/player/melissa_body.png')
	local g = anim8.newGrid(32, 64, plrsprite:getWidth(), plrsprite:getHeight())
	sd = anim8.newAnimation(g('2-2',1), 0.18)
	wd = anim8.newAnimation(g('1-4',1), 0.18)
	su = anim8.newAnimation(g('16-16',1), 0.18)
	wu = anim8.newAnimation(g('13-16',1), 0.18)
	sl = anim8.newAnimation(g('10-10',1), 0.18)
	wl = anim8.newAnimation(g('9-12',1), 0.18)
	sr = anim8.newAnimation(g('8-8',1), 0.18)
	wr = anim8.newAnimation(g('5-8',1), 0.18)
	currentanim=sd
end

function player.load()
	world:add(player, player.x, player.y,player.w,player.h)
	loadhead()
	loadbody()
	
	for k, object in pairs(map.objects) do
		if object.name == "SpawnPoint" then
			player.x = object.x
			player.y = object.y
			break
		end
	end

end

function player.update(dt)
	currentanim:update(dt)
	currentanim2:update(dt)
	cols_len=0
	updatePlayer(dt)
	
-- отвечает за тайминг моргания 
		if player.blink>0 then 
			player.blink=player.blink-(1*dt) 
		else 
			player.blink2=true player.blink=math.random(1,15) 
		end

--отвечает за возвращения обычного спрайта после моргания
		if currentanim2==hdblink or currentanim2==hrblink or currentanim2==hlblink then 
			if currentanim2:currentFrame()==4 then 
				currentanim2:gotoFrame(1) player.blink2=false 
			end 
		end 

--чтоб башка двигалась с телом
		if currentanim==wl or currentanim==wr or currentanim==wu or currentanim==wd then 
			if currentanim:currentFrame()==1 or currentanim:currentFrame()==3 then 
					player.jiggle=-1
				else 
					player.jiggle=0
				end 
				else player.jiggle=0
			end 

end

function player.draw()
--ТЕЛО
if player.moving==true then 
	
	if player.dir=="left" then 		wl:draw(plrsprite, math.floor(player.x-5),math.floor(player.y-41)) currentanim=wl end
	if player.dir=="right" then 	wr:draw(plrsprite, math.floor(player.x-5),math.floor(player.y-41)) currentanim=wr end
	if player.dir=="up" then 		wu:draw(plrsprite, math.floor(player.x-5),math.floor(player.y-41)) currentanim=wu end
	if player.dir=="down" then 		wd:draw(plrsprite, math.floor(player.x-5),math.floor(player.y-41)) currentanim=wd end
	
	end

if player.moving==false then 
	
	if player.dir=="left" then 		sl:draw(plrsprite, math.floor(player.x-5),math.floor(player.y-41)) currentanim=sl end
	if player.dir=="right" then 	sr:draw(plrsprite, math.floor(player.x-5),math.floor(player.y-41)) currentanim=sr end
	if player.dir=="up" then 		su:draw(plrsprite, math.floor(player.x-5),math.floor(player.y-41)) currentanim=su end
	if player.dir=="down" then 		sd:draw(plrsprite, math.floor(player.x-5),math.floor(player.y-41)) currentanim=sd end
		
	end
	
---ГОЛОВА
if player.blink2==true then 
	if player.dir=="left" then 		hlblink:draw(plrspritehead, math.floor(player.x-5)+3,math.floor(player.y-41)+9+player.jiggle) currentanim2=hlblink end
	if player.dir=="right" then 	hrblink:draw(plrspritehead, math.floor(player.x-5)+5,math.floor(player.y-41)+9+player.jiggle) currentanim2=hrblink end
	if player.dir=="up" then 		hu:draw(plrspritehead, math.floor(player.x-5)+4,math.floor(player.y-41)+9+player.jiggle) currentanim2=su end
	if player.dir=="down" then 		hdblink:draw(plrspritehead, math.floor(player.x-5)+4,math.floor(player.y-41)+9+player.jiggle) currentanim2=hdblink end
end
if player.blink2==false then
	if player.dir=="left" then 		hl:draw(plrspritehead, math.floor(player.x-5)+3,math.floor(player.y-41)+9+player.jiggle) currentanim2=hl end
	if player.dir=="right" then 	hr:draw(plrspritehead, math.floor(player.x-5)+5,math.floor(player.y-41)+9+player.jiggle) currentanim2=hr end
	if player.dir=="up" then 		hu:draw(plrspritehead, math.floor(player.x-5)+4,math.floor(player.y-41)+9+player.jiggle) currentanim2=hu end
	if player.dir=="down" then 		hd:draw(plrspritehead, math.floor(player.x-5)+4,math.floor(player.y-41)+9+player.jiggle) currentanim2=hd end
end

end



return player