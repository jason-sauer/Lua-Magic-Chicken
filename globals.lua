-- globals.lua
local globals = {}

globals.font = 
{
  regular = "GiddyupStd",
  bold = "GiddyupStd",
}

globals.display = {
	_W = display.contentWidth;
	_H = display.contentHeight;
	_centerW = display.contentWidth / 2;
	_centerH = display.contentHeight / 2;
}



return globals
