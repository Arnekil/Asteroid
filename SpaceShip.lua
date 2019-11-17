local myShip = {} 
myShip.image={ship=love.graphics.newImage("image/vaissau.png"),boost=love.graphics.newImage("image/boost.png")}
myShip.Width = myShip.image.ship:getWidth()
myShip.Height = myShip.image.ship:getHeight()
myShip.x = 500
myShip.y = 500
myShip.vx= 0
myShip.vy= 0
myShip.boost = BOOST
myShip.angle = 0
myShip.engineOn = true


function myShip:update(dt)
  if love.keyboard.isDown("z","up") then
    self.engineOn = true
    self.vx= self.vx +math.cos(self.angle)*self.boost*dt
    self.vy=self.vy +math.sin(self.angle)*self.boost*dt
  else
        self.engineOn = false
    angle = math.atan2(self.vy,self.vx)
    if math.abs(self.vx) >= 0.1 then
      self.vx= self.vx -FREIN*dt*math.cos(angle)
    else
      self.vx=0
    end
    if math.abs(self.vy) >= 0.1 then
      self.vy=self.vy - FREIN*dt*math.sin(angle)
    else 
      self.vy =0 
    end
  end
  if love.keyboard.isDown("q","left") then
    self.angle = self.angle - ROTATION_SHIP*dt
  elseif love.keyboard.isDown("d","right") then
    self.angle =self.angle +ROTATION_SHIP * dt
  end
  self.angle = self.angle%(2*math.pi)
  self.x = self.x + self.vx
  self.y= self.y + self.vy
  CheckOutScreen(self)
  
  
  
  
end


function myShip:draw()
  local t=love.graphics
  t.draw(self.image.ship,self.x,self.y,self.angle+math.pi/2,1,1,self.Width/2,self.Height/2)
  if self.engineOn then
    t.draw(self.image.boost,self.x,self.y,self.angle+math.pi/2,1,1,self.Width/2,self.Height/2)
    end
  if DEBUG == true then
    t.print("Position x : "..self.x.."\nPosition y : "..self.y.."\nAngle : "..self.angle.."\nVitesse vx"..self.vx.."\nVitesse vy"..self.vy.."\nangleVitesse : "..angle)
    t.setColor(1,1,0)
    t.circle("fill",self.x,self.y,2)
    t.setColor(1,1,1)
  end
end

return myShip
