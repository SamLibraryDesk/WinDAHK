;Window Displacement AHK

Game_Icon = ;Path of the executable or icon

Menu, Tray, Icon, %Game_Icon%

; Initialize a variable to store original Y positions
originalY := {}
isMoved := {}

MButton::
    ; Get the window under the mouse
    MouseGetPos, , , windowID

    ; Get the current window position and size
    WinGetPos, , currentY, width, height, ahk_id %windowID%

    ; Calculate the new Y position (70% of window height)
    newY := currentY - (height * 0.5)

    ; Toggle between moving up and restoring
    if (!isMoved[windowID]) {
        ; Store the original Y position on the first move
        originalY[windowID] := currentY
        ; Move the window up
        WinMove, ahk_id %windowID%, , , newY
        isMoved[windowID] := true  ; Set the moved state to true
    } else {
        ; Restore to the original position
        WinMove, ahk_id %windowID%, , , originalY[windowID]
        isMoved[windowID] := false  ; Reset the moved state
    }
return

F1::
    ; Restore all moved windows to their original position
    for windowID, moved in isMoved {
        if (moved) {
            WinMove, ahk_id %windowID%, , , originalY[windowID]
            isMoved[windowID] := false  ; Reset the moved state
        }
    }
return

#singleinstance, Ignore
