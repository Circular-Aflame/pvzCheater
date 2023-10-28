include util.inc

.data
on			dword	0
codeF		byte	90h,90h,90h,90h			;nop语句
codeN		byte	7Fh,0Ch,2Bh,0F3h		;原sub语句			
cSubAddr	dword	41BA72h			;sub语句地址
codeS		byte	0B0h,01h,90h	;设置植物阳光检测高亮
codeOs		byte	0Fh,9Eh,0C0h	;原检测阳光指令
cShowAddr	dword	41BABFh			;检测指令地址
freeM		byte	"已经收买了种子商，不会收阳光的啦~",0ah,0dh,0
normM		byte	"变回了交阳光的好公民",0ah,0dh,0

.code
freeSun proc,
	hp:	dword
		cmp on,0
		.if	ZERO?
			mov on,1
			invoke WriteProcessMemory, hp, cSubAddr, OFFSET codeF, 4, NULL
			invoke WriteProcessMemory, hp, cShowAddr, OFFSET codeS, 3, NULL
			invoke crt_printf,offset freeM
		.else
			mov	on,0
			invoke WriteProcessMemory, hp, cSubAddr, OFFSET codeN, 4, NULL
			invoke WriteProcessMemory, hp, cShowAddr, OFFSET codeOs, 3, NULL
			invoke crt_printf,offset normM
		.endif
	ret
freeSun endp
end