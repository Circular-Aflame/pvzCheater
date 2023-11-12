include util.inc

.data
on			dword	0
codeF		byte	52h,6Ah,11h,90h,90h			;指定植物语句
codeN		byte	8Bh,40h,28h,52h,50h				;原语句			
cAddr		dword	410A91h			;决定种下植物语句地址

freeM		byte	"现在是听天由命时间！",0ah,0dh,0
normM		byte	"暂时老实一点吧~~~",0ah,0dh,0

th			dword	0	;线程句柄

.code
ranThreadcSS proc,			;随机修改线程
	hp: dword
	invoke crt_time,0
	invoke crt_srand,eax
S0:	invoke crt_rand
	mov ecx,48
	div ecx
	mov esi,offset codeF
	mov [esi+2],dl
	invoke WriteProcessMemory, hp, cAddr, OFFSET codeF, 6, NULL
	invoke Sleep,100		;防止修改过快
	cmp on,0
	jne S0
	ret
ranThreadcSS endp

ranChoiceSS proc,
	hp:	dword
		cmp on,0
		.if	ZERO?
			mov on,1
			invoke CreateThread, NULL, 0, OFFSET ranThreadcSS, hp, 0,th
			invoke crt_printf,offset freeM
		.else
			mov	on,0
			invoke TerminateThread,th,0
			invoke WriteProcessMemory, hp, cAddr, OFFSET codeN, 6, NULL
			invoke crt_printf,offset normM
		.endif
	ret
ranChoiceSS endp
end