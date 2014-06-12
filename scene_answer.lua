---------------------------------------------------------------------------------
-- Answer Scene
-- This scene will display a random answer
---------------------------------------------------------------------------------
local globals = require( "globals" )
local sfx = require( "sfx" )

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- local forward references should go here --

local physics = require( "physics" )
physics.start()


---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------


-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  local background = display.newImageRect("images/answer_bg.png",globals.display._W,globals.display._H)
  background.x = globals.display._centerW
  background.y = globals.display._centerH
  group:insert(background)

  local answerText = display.newText( "", 0, 0, globals.font.bold, 18 )
  answerText.x = display.contentCenterX
  answerText.y = display.contentCenterY - 20
  
  group:insert( answerText )

  local visitChickenButton = display.newText( "Ask Another Question", 0, 0, globals.font.regular, 18 )
  visitChickenButton.x = display.contentCenterX
  visitChickenButton.y = display.contentCenterY + 60

  group:insert( visitChickenButton )

  local mainMenuButton = display.newText( "Go Back to Main Menu", 0, 0, globals.font.bold, 18 )
  mainMenuButton.x = display.contentCenterX
  mainMenuButton.y = display.contentCenterY + 110

  group:insert( mainMenuButton )

  local function onMenuBtnTap( event )
    audio.play(sfx.clickSound)
    storyboard.gotoScene( "scene_menu", {effect = "zoomOutInRotate"} )
  end
  mainMenuButton:addEventListener( "tap", onMenuBtnTap )

  local function onQuestionBtnTap( event )
    audio.play(sfx.clickSound)
    storyboard.gotoScene( "scene_chicken", {effect = "slideDown"} )
  end
  visitChickenButton:addEventListener( "tap", onQuestionBtnTap )

  -- Create a table to hold all available answers
  answers = {"Yesasdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf sadf", "No", "Maybe", "Possibly", "Nope", "Sure", "Without a Doubt",
             "Only on Tuesdays", "What'chu talkin' 'bout, Willis?"}
  -- Get a random number based on length of answers table
  temp = math.random(1,#answers)
  -- Choose text for the answer based on the random number chosen
  answerText.text = answers[temp]


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

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view

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
