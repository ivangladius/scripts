; Global variable to store last active window for each application
LastActiveWindows := Map()

; Function to cycle through windows of primary app, fallback to secondary if primary not found
CycleWindowsPriority(primaryExe, fallbackExe := "") {
    winList := []
    currentExe := ""
    
    ; First try the primary executable
    windows := WinGetList("ahk_exe " primaryExe)
    if (windows.Length > 0) {
        ; If primary windows exist, use only those
        Loop windows.Length {
            winList.InsertAt(1, windows[A_Index])
        }
        currentExe := primaryExe
    } else if (fallbackExe) {
        ; If no primary windows and fallback is specified, try fallback
        windows := WinGetList("ahk_exe " fallbackExe)
        Loop windows.Length {
            winList.InsertAt(1, windows[A_Index])
        }
        currentExe := fallbackExe
    }

    ; If no windows are found, return
    if (winList.Length = 0) {
        return
    }

    ; Get the currently active window
    activeHwnd := WinGetID("A")
    activeExe := WinGetProcessName("A")
    
    ; Store current window before potentially switching
    if (activeExe != currentExe) {
        LastActiveWindows[activeExe] := activeHwnd
    }

    ; If we're switching from a different application
    if (activeExe != currentExe) {
        ; If we have a stored window for this application, use it
        if (LastActiveWindows.Has(currentExe)) {
            storedHwnd := LastActiveWindows[currentExe]
            ; Verify the stored window still exists
            if (WinExist("ahk_id " storedHwnd)) {
                WinActivate("ahk_id " storedHwnd)
                return
            }
        }
        ; If no stored window or it doesn't exist anymore, activate first window
        WinActivate("ahk_id " winList[1])
        return
    }

    ; Only do cycling if we're already in the target application
    if (activeExe = currentExe) {
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
}

; Keybindings for different applications
#HotIf
!a::CycleWindowsPriority("VSCodium.exe", "Cursor.exe")  ; Alt + A cycles through VSCodium, falls back to Cursor
!e::CycleWindowsPriority("Explorer.exe")             ; Alt + E cycles through File Explorer
!s::CycleWindowsPriority("brave.exe")                ; Alt + S cycles through Brave Browser
!q::CycleWindowsPriority("WindowsTerminal.exe")      ; Alt + Q cycles through Windows Terminal


