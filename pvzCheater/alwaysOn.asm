include util.inc

.data
on			dword	0
codeF		byte	0C6h,47h,48h,01h			;不清除值
codeN		byte	80h,7Fh,48h,00h				;原清除值			
cClearAddr	dword	487280h			;放置后清除语句地址

freeM		byte	"种子商打了兴奋剂，立马就把植物运过来啦~",0ah,0dh,0
normM		byte	"让种子商歇一会儿吧，呼~~~",0ah,0dh,0

.code
alwaysOn proc,
	hp:	dword
		cmp on,0
		.if	ZERO?
			mov on,1
			invoke WriteProcessMemory, hp, cClearAddr, OFFSET codeF, 4, NULL
			invoke crt_printf,offset freeM
		.else
			mov	on,0
			invoke WriteProcessMemory, hp, cClearAddr, OFFSET codeN, 4, NULL
			invoke crt_printf,offset normM
		.endif
	ret
alwaysOn endp
end