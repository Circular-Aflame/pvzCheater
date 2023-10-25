.386
.model flat, stdcall

option casemap:none

include /masm32/include/windows.inc
include /masm32/macros/macros.asm
include /masm32/include/msvcrt.inc
includelib /masm32/lib/msvcrt.lib
 
  ; -----------------------------------------------------------------
  ; include files that have MASM format prototypes for function calls
  ; -----------------------------------------------------------------
    include /masm32/include/masm32.inc
    include /masm32/include/gdi32.inc
    include /masm32/include/user32.inc
    include /masm32/include/kernel32.inc
 
  ; ------------------------------------------------
  ; Library files that have definitions for function
  ; exports and tested reliable prebuilt code.
  ; ------------------------------------------------
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\gdi32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib

include         util.inc

.data
hwnd    HANDLE ?
pname   byte "PlantsVsZombies Plus Version 95",0
greetM  byte "Welcome To PVZ Cheater.",0ah,0dh,0


.code
main PROC
    invoke crt_printf,offset greetM

    ret
main endp
end main