include util.inc

.data
on			dword	0
delta1		dword		?		;地址偏移量1
delta2		dword		?		;地址偏移量2			
delta3		dword		?		;地址偏移量2
var			dword		?		;植物id变量

freeM		byte	"现在是自由选择时间，眼疾手快就能心想事成！",0ah,0dh,0
normM		byte	"暂时老实一点吧~~~",0ah,0dh,0

th			dword	0	;线程句柄

.code
ranThreadcS proc,			;随机修改线程
	hp: dword
	invoke crt_time,0
	invoke crt_srand,eax
S0:	invoke crt_rand
	mov ecx,48
	div ecx
	mov var,edx
	invoke WriteProcessMemory, hp, delta3, offset var, 4, NULL
	invoke Sleep,150		;防止修改过快
	cmp on,0
	jne S0
	ret
ranThreadcS endp

ranChoiceS proc,
	hp:	dword
		cmp on,0
		.if	ZERO?
			mov on,1
			invoke ReadProcessMemory, hp, 6A9EC0h, offset delta1, 4, NULL
			add delta1, 768h		;偏移量1

			invoke ReadProcessMemory, hp, delta1, offset delta2, 4, NULL
			add delta2, 138h		;偏移量2

			invoke ReadProcessMemory, hp, delta2, offset delta3, 4, NULL
			add delta3, 28h		;偏移量3

			invoke CreateThread, NULL, 0, OFFSET ranThreadcS, hp, 0,th
			invoke crt_printf,offset freeM
		.else
			mov	on,0
			invoke TerminateThread,th,0
			invoke crt_printf,offset normM
		.endif
	ret
ranChoiceS endp
end