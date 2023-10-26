include util.inc

.data
on		dword	0
codeF	byte	90h,90h		;nop语句
codeN	byte	2Bh,0F3h		;原语句
codeAddr	dword	41BA74h	;汇编语句地址
freeM	byte	"已经收买了种子商，不会收阳光的啦~",0ah,0dh,0
normM	byte	"变回了交阳光的好公民",0ah,0dh,0

.code
freeSun proc,
	hp:	dword
		cmp on,0
		.if	ZERO?
			mov on,1
			invoke WriteProcessMemory, hp, codeAddr, OFFSET codeF, 2, NULL
			invoke crt_printf,offset freeM
		.else
			mov	on,0
			invoke WriteProcessMemory, hp, codeAddr, OFFSET codeN, 2, NULL
			invoke crt_printf,offset normM
		.endif
	ret
freeSun endp
end