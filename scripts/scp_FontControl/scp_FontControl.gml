globalvar defSystemFont;
globalvar defMainFont;
globalvar defSecondFont;
globalvar defSystemFontOR;
globalvar defMainFontOR;
globalvar defSecondFontOR;

function importFont(fontName, isImageFile)
{
	var addedFontIndex = 0;
	
	if (font_add_get_enable_aa())
	{
		font_add_enable_aa(false);
	}
	
	if (file_exists("Fonts/" + fontName))
	{
		if (!isImageFile)
		{
			return font_add("Fonts/" + fontName, 20, false, false, 32, 128);
		}
	}
	else
	{
		return -1;
	}
}

function FontControlAddDefSysGMFontLib(fontGMLibName, fScale, fColour)
{
	defSystemFont = [fontGMLibName, fScale, fColour];
	defSystemFontOR = defSystemFont;
	
	return "[Font:" + string(fontGMLibName) + " | " + "Scale:" + string(fScale) + " | " + "Colour:" + string(fColour) + "]";
}

function FontControlAddDefMainSpriteLib(fontSprite, mapString, isPropFont, charSpacing, fScale, fColour)
{
	defMainFont = [font_add_sprite_ext(fontSprite, mapString, isPropFont, charSpacing), fScale, fColour];
	defMainFont = defMainFontOR;
	
	return "[Sprite:" + string(fontSprite) + " | " + "Map String:" + mapString + " | " + "Is Proportional Font:" + string(isPropFont) + " | " + "Character Spacing:" + string(charSpacing) + " | " + "Scale:" + string(fScale) + " | " + "Colour:" + string(fColour) + "]";
}

function FontControlAddMainOverrideReset()
{
	global.defSystemFontOR = global.defSystemFont;
	global.defMainFontOR = global.defMainFont;
	global.defSecondFontOR = global.defSecondFont;
}