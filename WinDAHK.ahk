;Window Displacement AHK

Game_Icon = ;Path of the executable or icon

Menu, Tray, Icon, %Game_Icon%

MButton::
    ; Get the window under the mouse
    MouseGetPos, , , windowID
    
    ; Get the current window position
    WinGetPos, , currentY, , , ahk_id %windowID%
    
    ; Toggle between the two positions
    if (currentY = 540) {
        WinMove, ahk_id %windowID%, , , 315  ; Move to y-pos 315
        currentYPos := 315
    } else if (currentY = 315) {
        WinMove, ahk_id %windowID%, , , 540  ; Move back to y-pos 540
        currentYPos := 540
    } else if (currentY = 384) {
        WinMove, ahk_id %windowID%, , , 50  ; Move back to y-pos 50
        currentYPos := 50
    } else if (currentY = 50) {
        WinMove, ahk_id %windowID%, , , 384  ; Move back to y-pos 384
        currentYPos := 384
    }
return

#singleinstance, Ignore
