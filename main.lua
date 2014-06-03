-- Hide the iPhone status bar
display.setStatusBar( display.HiddenStatusBar )

-- Add a global background
local bg = display.newRect( display.screenOriginX,
                            display.screenOriginY, 
                            display.pixelWidth, 
                            display.pixelHeight)
                            
bg.x = display.contentCenterX
bg.y = display.contentCenterY
bg:setFillColor( 137, 168, 254 )

-- Initialize global variables
local globals = require( "globals" )

-- Start up Storyboard
local storyboard = require( "storyboard" )
storyboard.gotoScene( "scene_menu" )

