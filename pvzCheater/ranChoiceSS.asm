include util.inc

.data
on			dword	0
codeF		byte	52h,6Ah,11h,90h,90h			;ָ��ֲ�����
codeN		byte	8Bh,40h,28h,52h,50h				;ԭ���			
cAddr		dword	410A91h			;��������ֲ������ַ

freeM		byte	"��������������ʱ�䣡",0ah,0dh,0
normM		byte	"��ʱ��ʵһ���~~~",0ah,0dh,0

th			dword	0	;�߳̾��

.code
ranThreadcSS proc,			;����޸��߳�
	hp: dword
	invoke crt_time,0
	invoke crt_srand,eax
S0:	invoke crt_rand
	mov ecx,48
	div ecx
	mov esi,offset codeF
	mov [esi+2],dl
	invoke WriteProcessMemory, hp, cAddr, OFFSET codeF, 6, NULL
	invoke Sleep,100		;��ֹ�޸Ĺ���
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