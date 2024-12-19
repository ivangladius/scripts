; Function to cycle through windows
CycleWindows(exeName) {
    ; Get all windows matching the executable
    winList := []
    windows := WinGetList("ahk_exe " exeName)
    
    ; Store windows in reverse order (as WinGetList returns them in bottom-to-top order)
    Loop windows.Length {
        winList.InsertAt(1, windows[A_Index])
    }

    ; If no windows are found, return
    if (winList.Length = 0) {
        return
    }

    ; Get the currently active window
    activeHwnd := WinGetID("A")
    
    ; Find position of active window in list
    activePos := 0
    Loop winList.Length {
        if (winList[A_Index] = activeHwnd) {
            activePos := A_Index
            break
        }
    }

    ; If current window is not in list or is the last window
    if (activePos = 0 || activePos = winList.Length) {
        WinActivate("ahk_id " winList[1])
    } else {
        WinActivate("ahk_id " winList[activePos + 1])
    }
}

; Keybindings for different applications
#HotIf
!a::CycleWindows("Cursor.exe")         ; Alt + A cycles through Cursor windows
!e::CycleWindows("Explorer.exe")       ; Alt + E cycles through File Explorer
!s::CycleWindows("brave.exe")          ; Alt + S cycles through Brave Browser
!q::CycleWindows("WindowsTerminal.exe") ; Alt + Q cycles through Windows Terminal


