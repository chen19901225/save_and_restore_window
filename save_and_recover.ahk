; 设置 窗口然后 恢复活动窗口
; global active_id
#SingleInstance, force
global active_id_map := {}

^1::
   saveWindow(1)
return

^2::
   saveWindow(2)
return

^3::
   saveWindow(3)
return

^4::
   saveWindow(4)
return

^5::
   saveWindow(5)
return
^6::
   saveWindow(6)
return
^7::
   saveWindow(7)
return
^8::
   saveWindow(8)
return
^9::
   saveWindow(9)
return

!1::
    restoreWindow(1)
return 


!2::
    restoreWindow(2)
return 


!3::
    restoreWindow(3)
return 


!4::
    restoreWindow(4)
return 

!5::
    restoreWindow(5)
return 
!6::
    restoreWindow(6)
return 
!7::
    restoreWindow(7)
return 
!8::
    restoreWindow(8)
return 

!9::
    restoreWindow(9)
return 

^!b::
    printWindow()
return 


printWindow() {
    out := ""
    For Key, Value in active_id_map
        MsgBox % "key:" key ", value:" value
    ;MsgBox %out%
}

saveWindow(id) {
    local current_id := WinExist("A")
    active_id_map[id] := current_id
}

restoreWindow(id) {
    local current_id := active_id_map[id]
    WinActivate, ahk_id %current_id%
    ;MsgBox "active window"
}