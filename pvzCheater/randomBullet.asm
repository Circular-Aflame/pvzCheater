include util.inc

.data
on			dword	0
codeF		byte	31h,0C0h,0B0h,0Ah			;ָ���ӵ����
codeN		byte	8Bh,44h,24h,10h				;ԭ���			
cAddr		dword	46729Ah			;�����ӵ�����ַ

freeM		byte	"�����ǿ�ʱ�䣡�������ѵ���ĳɹ���",0ah,0dh,0
normM		byte	"��ֲ����Ъһ�����~~~",0ah,0dh,0

th			dword	0	;�߳̾��

.code
ranThread proc,			;�޸��ӵ��߳�
	hp: dword
	invoke crt_time,0
	invoke crt_srand,eax
S0:	invoke crt_rand
	mov ecx,14
	div ecx
	mov esi,offset codeF
	mov [esi+3],dl
	invoke WriteProcessMemory, hp, cAddr, OFFSET codeF, 4, NULL
	invoke Sleep,100		;��ֹ�޸Ĺ���
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