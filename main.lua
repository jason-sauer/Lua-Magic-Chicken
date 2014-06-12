-- Hide the iPhone status bar
display.setStatusBar( display.HiddenStatusBar )

-- Initialize global variables
local globals = require( "globals" )

-- Start up Storyboard
local storyboard = require( "storyboard" )
storyboard.gotoScene( "scene_menu" )

