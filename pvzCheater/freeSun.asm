include util.inc

.data
on			dword	0
codeF		byte	90h,90h,90h,90h			;nop���
codeN		byte	7Fh,0Ch,2Bh,0F3h		;ԭsub���			
cSubAddr	dword	41BA72h			;sub����ַ
codeS		byte	0B0h,01h,90h	;����ֲ�����������
codeOs		byte	0Fh,9Eh,0C0h	;ԭ�������ָ��
cShowAddr	dword	41BABFh			;���ָ���ַ
freeM		byte	"�Ѿ������������̣��������������~",0ah,0dh,0
normM		byte	"����˽�����ĺù���",0ah,0dh,0

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