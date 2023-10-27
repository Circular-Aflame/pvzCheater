.386 
.model flat, stdcall
.STACK 4096
option casemap :none
include /masm32/include/windows.inc
include /masm32/include/masm32.inc
include /masm32/include/gdi32.inc
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
include     /masm32/include/msvcrt.inc
includelib  /masm32/lib/msvcrt.lib


;函数声明
freeSun		proto,	hp:dword		;不消耗阳光
stealMoney	proto,	hp:dword		;设置金币
stealSun	proto,	hp:dword		;设置阳光
