---------------------------------------------------------------------------------
-- Menu Scene
-- This scene is the main menu
---------------------------------------------------------------------------------
local globals = require( "globals" )
local sfx = require( "sfx" )

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- local forward references should go here --
backgroundMusic = nil
backgroundMusicChannel = nil

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------


-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  local background = display.newImageRect("images/menu_bg.png",globals.display._W,globals.display._H)
  background.x = globals.display._centerW
  background.y = globals.display._centerH
  group:insert(background)
  
  
  local sceneTitle = display.newText( "Magic Chicken", 0, 0, globals.font.bold, 36 )
  sceneTitle.x = display.contentCenterX
  sceneTitle.y = display.contentCenterY - 20
  
  group:insert( sceneTitle )
  
  local visitChickenButton = display.newText( "Visit the Magic Chicken", 0, 0, globals.font.regular, 18 )
  visitChickenButton.x = display.contentCenterX
  visitChickenButton.y = display.contentCenterY + 80

  local viewCreditsButton = display.newText( "Credits", 0, 0, globals.font.regular, 18 )
  viewCreditsButton.x = display.contentCenterX
  viewCreditsButton.y = display.contentCenterY + 120
  
  
  
  
  group:insert( visitChickenButton )
  group:insert( viewCreditsButton )

  local function onChickenBtnTap( event )
    storyboard.gotoScene( "scene_chicken", {effect = "slideUp",time = 800} )
    audio.play(sfx.clickSound)
    audio.stop( backgroundMusic )
    audio.stop( backgroundMusicChannel )
    backgroundMusic = nil
    backgroundMusicChannel = nil
  end

  local function onCreditsBtnTap( event )
    storyboard.gotoScene( "scene_credits", {effect = "flip"} )
    audio.play(sfx.clickSound)
  end

  visitChickenButton:addEventListener( "tap", onChickenBtnTap )
  viewCreditsButton:addEventListener( "tap", onCreditsBtnTap )

  

end


-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  -- Clear previous scene
  local previousScene=storyboard.getPrevious()
  storyboard.purgeScene(previousScene)
  
  local group = self.view
  if audio.isChannelPlaying(1) then
    -- do nothing
  else
    backgroundMusic = audio.loadStream("audio/menu_music.mp3") 
    backgroundMusicChannel = audio.play( backgroundMusic, {channel = 1} )
  end
  
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
  audio.dispose(backgroundMusic)
  backgroundMusic = nil

end


-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view

end


-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view

end


-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
  
end


-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene

end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )

-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )

---------------------------------------------------------------------------------

return scene
