--cette ligne permet d'afficher des traces dans la console pendant l'execution
io.stdout:setvbuf('no')

--Empeche love de filtrer les contours des images quand elles sont redimentionnées
--Indispensable pour le pixel art
love.graphics.setDefaultFilter("nearest")

--cette ligne permet de déboguer pas a pas dans ZeroBrainStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

math.randomseed(love.timer.getTime()) -- genere des nombre aleatoire a chaque partie
 

DEBUGSHIP = false
DEBUGSLIM = true
---Constante---
-----Vaisseau------
 BOOST = 3  -- vitesse  de deplacement
 FREIN =BOOST/1.5 --- parametre de ralentissement
 ROTATION_SHIP = 5 -- vitesse de rotation du vaisseau
 
 
 ------Zone de Jeu---
 OFFSET = 5 --espace hors ecran pour le tp opposer rende mieux
 
 -----Ecran---------
 WIN_WIDTH,WIN_HEIGHT =love.window.getDesktopDimensions( display )








function love.load()
 Ship = require("SpaceShip") --utilisation de la bibliotheque pour gerer le Vaisseau.

end

function love.update(dt)
    Ship:update(dt)


end


function love.draw()
  Ship:draw()
end


function love.keypressed(key)
  if key == "i" then 
    love.event.quit()
    end


end

function CheckOutScreen(pObjet)
  if pObjet.x < 0-OFFSET then
    pObjet.x = WIN_WIDTH
  elseif pObjet.x > WIN_WIDTH+OFFSET then
    pObjet.x = 0
  elseif pObjet.y < 0-OFFSET then
    pObjet.y = WIN_HEIGHT
  elseif pObjet.y > WIN_HEIGHT+OFFSET then
    pObjet.y = 0
  end
end
