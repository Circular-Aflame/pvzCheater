include util.inc

.data
on		dword	0
codeF	byte	90h,90h		;nop���
codeN	byte	2Bh,0F3h		;ԭ���
codeAddr	dword	41BA74h	;�������ַ
freeM	byte	"�Ѿ������������̣��������������~",0ah,0dh,0
normM	byte	"����˽�����ĺù���",0ah,0dh,0

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