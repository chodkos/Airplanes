
playerImg = nil

canShoot = true
canShootTimerMax = 0.4 
canShootTimer = canShootTimerMax

-- Image Storage
bulletImg = nil

-- Entity Storage
bullets = {} -- array of current bullets being drawn and updated

function love.load()
  
  player = { x = 200, y = 610, speed = 150, img = nil }
  player.img = love.graphics.newImage('assets/xplane.png')
  bulletImg = love.graphics.newImage('assets/bullet.png')
  
  
end

function love.update(dt)
  
  
  if love.keyboard.isDown("right") then
    if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
       player.x = player.x + player.speed * dt
    end
elseif love.keyboard.isDown("left") then
  if player.x > 0 then
  player.x = player.x - player.speed * dt
  end
end

  if love.keyboard.isDown("up") then
    if player.y > 0 then
      player.y = player.y - player.speed * dt
    end
  elseif love.keyboard.isDown("down") then
    if player.y < (love.graphics.getHeight() - player.img:getHeight()) then
      player.y = player.y + player.speed * dt
    end 
  end  
  
  if love.keyboard.isDown('space', 'rctrl', 'lctrl', 'ctrl') and canShoot then
	-- Create some bullets
	newBullet = { x = player.x + (player.img:getWidth()/2) - 5, y = player.y, img = bulletImg }
	table.insert(bullets, newBullet)
	canShoot = false
	canShootTimer = canShootTimerMax
end
  
  
    canShootTimer = canShootTimer - (dt)
    if canShootTimer < 0 then
        canShoot = true
    end
    
    for i, bullet in ipairs(bullets) do
	bullet.y = bullet.y - (250 * dt)

  	if bullet.y < 0 then -- remove bullets when they pass off the screen
		table.remove(bullets, i)
	end
end
  
    
    

end

function love.draw(dt)
  love.graphics.draw(player.img, player.x, player.y)
  
  for i, bullet in ipairs(bullets) do
  love.graphics.draw(bullet.img, bullet.x, bullet.y)
end

  
end
