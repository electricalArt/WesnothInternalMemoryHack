
Playspeed:=2 

Loop, 1
{

SetTitleMatchMode, 2
CoordMode, Mouse, Window

      tt = The Battle for Wesnoth - 1.14.9 ahk_class SDL_app
      WinWait, %tt%
      IfWinNotActive, %tt%,, WinActivate, %tt%

  Sleep, % 1531 //playspeed

MouseClick, L, 832, 566

  Sleep, % 1437 //playspeed

MouseClick, L, 562, 692

  Sleep, % 765 //playspeed

MouseClick, L, 498, 764

  Sleep, % 2781 //playspeed

MouseClick, L, 688, 610

  Sleep, % 766 //playspeed

MouseClick, L, 754, 986

  Sleep, % 1812 //playspeed

MouseClick, L, 484, 308

  Sleep, % 531 //playspeed

MouseClick, L, 510, 382

  Sleep, % 843 //playspeed

MouseClick, L, 724, 68

  Sleep, % 2859 //playspeed

MouseClick, L, 588, 256

  Sleep, 1000  //PlaySpeed 

}
