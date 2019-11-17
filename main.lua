--cette ligne permet d'afficher des traces dans la console pendant l'execution
io.stdout:setvbuf('no')

--Empeche love de filtrer les contours des images quand elles sont redimentionnées
--Indispensable pour le pixel art
love.graphics.setDefaultFilter("nearest")

--cette ligne permet de déboguer pas a pas dans ZeroBrainStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

Screan = require("ScreanManager")
Sound = require("SoundManager")


function love.load()
  
  Width = love.graphics.getWidth()
  Height = love.graphics.getHeight()

end

function love.update(dt)
  
 
    
      
end


function love.draw()
  
end

function love.keypressed(key)
  
print(key)

end