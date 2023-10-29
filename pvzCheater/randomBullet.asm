include util.inc

.data
on			dword	0
codeF		byte	31h,0C0h,0B0h,0Ah			;指定子弹语句
codeN		byte	8Bh,44h,24h,10h				;原语句			
cAddr		dword	46729Ah			;决定子弹语句地址

freeM		byte	"现在是狂欢时间！！这就是训练的成果吗！",0ah,0dh,0
normM		byte	"让植物们歇一会儿吧~~~",0ah,0dh,0

th			dword	0	;线程句柄

.code
ranThread proc,			;修改子弹线程
	hp: dword
	invoke crt_time,0
	invoke crt_srand,eax
S0:	invoke crt_rand
	mov ecx,14
	div ecx
	mov esi,offset codeF
	mov [esi+3],dl
	invoke WriteProcessMemory, hp, cAddr, OFFSET codeF, 4, NULL
	invoke Sleep,100		;防止修改过快
	cmp on,0
	jne S0
	ret
ranThread endp

randomBullet proc,
	hp:	dword
		cmp on,0
		.if	ZERO?
			mov on,1
			invoke CreateThread, NULL, 0, OFFSET ranThread, hp, 0,th
			invoke crt_printf,offset freeM
		.else
			mov	on,0
			invoke TerminateThread,th,0
			invoke WriteProcessMemory, hp, cAddr, OFFSET codeN, 4, NULL
			invoke crt_printf,offset normM
		.endif
	ret
randomBullet endp
end