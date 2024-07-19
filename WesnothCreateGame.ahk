; This script was created using Pulover's Macro Creator
; www.macrocreator.com

#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Client
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1

; UserGlobalVars

Numpad5::
WesnothStartGame:
BlockInput, MouseMove
Run, "C:\Program Files (x86)\Battle for Wesnoth 1.14.9\wesnoth.exe"
WinWait, The Battle for Wesnoth - 1.14.9
Sleep, 500
WinActivate, The Battle for Wesnoth - 1.14.9
Sleep, 333
WinMove, The Battle for Wesnoth - 1.14.9,, -7, 40, 974, 1047
Sleep, 333
Loop
{
    CoordMode, Pixel, Client
    PixelSearch, FoundX, FoundY, 318, 23, 694, 255, 0xF7EAAC, 100, Fast RGB
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY%, 0
    If ErrorLevel
    	Loop, 2
    		Sleep, 1
}
Until ErrorLevel = 0
Loop
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 759, 529, 935, 599, *50 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719201323.png
    CenterImgSrchCoords("*50 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719201323.png", FoundX, FoundY)
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY% Left, 1
    If ErrorLevel
    	Loop, 2
    		Sleep, 1
}
Until ErrorLevel = 0
Loop, 10
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 248, 611, 706, 763, *100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719201953.png
    CenterImgSrchCoords("*100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719201953.png", FoundX, FoundY)
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY% Left, 1
    If ErrorLevel
    	Loop, 2
    		Sleep, 1
}
Until ErrorLevel = 0
Loop, 10
{
    ControlClick, , A,, Left, 1,  x484 y754 NA
    Sleep, 10
}
Loop, 10
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 689, 954, 831, 1000, *100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719222247.png
    CenterImgSrchCoords("*100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719222247.png", FoundX, FoundY)
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY% Left, 1
    If ErrorLevel
    	Loop, 2
    		Sleep, 1
}
Until ErrorLevel = 0
Loop
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 406, 228, 602, 322, *100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719202508.png
    CenterImgSrchCoords("*100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719202508.png", FoundX, FoundY)
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY% Left, 1
}
Until ErrorLevel = 0
Loop
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 409, 299, 633, 385, *100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719203125.png
    CenterImgSrchCoords("*100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719203125.png", FoundX, FoundY)
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY% Left, 1
    If ErrorLevel
    	Loop, 2
    		Sleep, 1
}
Until ErrorLevel = 0
Loop
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 666, 5, 868, 59, *100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719203336.png
    CenterImgSrchCoords("*100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719203336.png", FoundX, FoundY)
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY% Left, 1
    If ErrorLevel
    	Loop, 2
    		Sleep, 1
}
Until ErrorLevel = 0
Loop, 10
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 330, 416, 644, 610, *100 C:\Users\musli\AppData\Roaming\MacroCreator\Screenshots\Screen_20240719203558.png
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY% Left, 1
    If ErrorLevel
    	Loop, 2
    		Sleep, 1
}
Until ErrorLevel = 0
BlockInput, MouseMoveOff
Return


CenterImgSrchCoords(File, ByRef CoordX, ByRef CoordY)
{
	static LoadedPic
	LastEL := ErrorLevel

	Gui, Pict:Add, Pic, vLoadedPic, % RegExReplace(File, "^(\*\w+\s)+")
	GuiControlGet, LoadedPic, Pict:Pos
	Gui, Pict:Destroy
	CoordX += LoadedPicW // 2
	CoordY += LoadedPicH // 2
	ErrorLevel := LastEL
}
