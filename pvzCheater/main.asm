.386
.model flat, stdcall

option casemap:none

includelib      msvcrt.lib
include         msvcrt.inc
include         windows.inc

.data
hwnd  HANDLE ?
NAME  byte "PlantsVsZombies Plus Version 95",0



.code
main PROC
    invoke  crt_scanf, offset scanMsg, offset varA, offset varB ; ����scanf
    
    mov eax, varA
    sar eax, 31
    xor varA,eax    ;��ȡ����ֵ
    mov eax, varB
    sar eax, 31
    xor varB,eax    ;��ȡ����ֵ

TOP:mov eax,varA
    mov ebx,varB
    mov edx,0
    div ebx
    mov varA,ebx
    mov varB,edx
    cmp edx, 0
    jg TOP


    invoke  crt_printf, offset ansMsg,varA
    ret
main endp
end		main