#SingleInstance Force

; Sroll through task switcher with mouse wheel
!WheelUp::
	Send {Alt down}+{LEFT}
Return

!WheelDown::
	Send {Alt down}+{RIGHT}
Return

; Vim bindings
!k::
	Send {Alt down}+{UP}
Return

!j::
	Send {Alt down}+{DOWN}
Return

!h::
	Send {Alt down}+{LEFT}
Return

!l::
	Send {Alt down}+{RIGHT}
Return