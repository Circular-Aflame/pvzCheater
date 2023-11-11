include util.inc

.data
on			dword	0
codeF		byte	0C7h,41h,28h,00h,00h,00h,00h,90h,90h			;指定植物语句
codeN		byte	8Bh,55h,34h,89h,51h,28h,8Bh,45h,04h				;原语句			
cAddr		dword	488DE2h			;决定选中植物语句地址

freeM		byte	"现在是自由选择时间，眼疾手快就能心想事成！",0ah,0dh,0
normM		byte	"暂时老实一点吧~~~",0ah,0dh,0

th			dword	0	;线程句柄

.code
ranThreadc proc,			;随机修改线程
	hp: dword
	invoke crt_time,0
	invoke crt_srand,eax
S0:	invoke crt_rand
	mov ecx,53
	div ecx
	mov esi,offset codeF
	mov [esi+3],dl
	invoke WriteProcessMemory, hp, cAddr, OFFSET codeF, 9, NULL
	invoke Sleep,100		;防止修改过快
	cmp on,0
	jne S0
	ret
ranThreadc endp

ranChoice proc,
	hp:	dword
		cmp on,0
		.if	ZERO?
			mov on,1
			invoke CreateThread, NULL, 0, OFFSET ranThreadc, hp, 0,th
			invoke crt_printf,offset freeM
		.else
			mov	on,0
			invoke TerminateThread,th,0
			invoke WriteProcessMemory, hp, cAddr, OFFSET codeN, 9, NULL
			invoke crt_printf,offset normM
		.endif
	ret
ranChoice endp
end