include util.inc

.data
on			dword	0
codeF		byte	0C6h,47h,48h,01h			;�����ֵ
codeN		byte	80h,7Fh,48h,00h				;ԭ���ֵ			
cClearAddr	dword	487280h			;���ú��������ַ

freeM		byte	"�����̴����˷ܼ�������Ͱ�ֲ���˹�����~",0ah,0dh,0
normM		byte	"��������Ъһ����ɣ���~~~",0ah,0dh,0

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