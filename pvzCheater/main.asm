.386
.model flat, stdcall

option casemap:none

includelib      msvcrt.lib
include         msvcrt.inc

.data
scanMsg			byte    "%d %d", 0
ansMsg			byte    "%d", 0  ; 0ah 0dh是回车换行
varA			dword  0
varB			dword  0

.code
main PROC
    invoke  crt_scanf, offset scanMsg, offset varA, offset varB ; 调用scanf
    
    mov eax, varA
    sar eax, 31
    xor varA,eax    ;获取绝对值
    mov eax, varB
    sar eax, 31
    xor varB,eax    ;获取绝对值

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