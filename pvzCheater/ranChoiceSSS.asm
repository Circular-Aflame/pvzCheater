include util.inc

.data
on			dword	0
delta1		dword		?		;��ַƫ����1
delta2		dword		?		;��ַƫ����2			
delta3		dword		?		;��ַƫ����2
var			dword		?		;ֲ��id����

codeToZ		byte	90h,90h			;��ʬ���
codeToP		byte	0EBh,14h		;ֲ�����
codeN		byte	74h,14h				;ԭ���
cAddr		dword		40FDCDh	;�жϽ�ʬֲ�����λ��

codeP		byte	52h,6Ah,11h,90h,90h			;ָ��ֲ�����
codePN		byte	8Bh,40h,28h,52h,50h				;ԭ���			
cAddrP		dword	410A91h			;��������ֲ������ַ

codeZ1		byte	0FFh,74h		;ָ����ʬ���1
codeZ2		byte	31h,0C0h,
					0B0h,11h
codeZN1		byte	8Bh,44h				;ԭ���1		
codeZN2		byte	50h,
					8Bh,42h,28h
cAddrZ1		dword	42A408h			;�������½�ʬ����ַ
cAddrZ2		dword	42A415h


freeM		byte	"���ʱ�䣡������֪��������������Ӵ�������ʲô",0ah,0dh,0
normM		byte	"��ʱ��ʵһ���~~~",0ah,0dh,0

th			dword	0	;�߳̾��
th2			dword	0

.code
ranThreadpng proc,
	hp: dword
	invoke crt_time,0
	invoke crt_srand,eax
SPn:	
	;��һ�������ͼ��
	invoke crt_rand
	mov ecx,57
	div ecx
	.if edx > 39
		add edx,18
	.endif	
	cmp edx,16
	je nea
	cmp edx,19
	je nea
	cmp edx,24
	je nea
	cmp edx,35
	je nea
	jmp ok
nea:
	mov edx,50
ok:
	mov var,edx
	invoke WriteProcessMemory, hp, delta3, offset var, 4, NULL
	invoke Sleep,25		;��ֹ�޸Ĺ���
	cmp on,0
	jne SPn
	ret
ranThreadpng endp

ranThreadcSSS proc,			;����޸��߳�
	hp: dword
	invoke crt_time,0
	invoke crt_srand,eax
S0:	
	;�ڶ��������������
	invoke crt_rand
	mov ecx,142
	div ecx
	.if edx > 105
		sub edx,106
		mov esi,offset codeZ2
		mov [esi+3],dl
		invoke WriteProcessMemory, hp, cAddr, offset codeToZ, 2, NULL
		invoke WriteProcessMemory, hp, cAddrZ1, offset codeZ1, 2, NULL
		invoke WriteProcessMemory, hp, cAddrZ2, offset codeZ2, 4, NULL
		jmp done
	.endif
	.if edx > 52
		sub edx,53
	.endif
	.if edx == 48
		mov edx,47
		mov esi,offset codeZ2
		mov [esi+3],dl
		invoke WriteProcessMemory, hp, cAddr, offset codeToZ, 2, NULL
		invoke WriteProcessMemory, hp, cAddrZ1, offset codeZ1, 2, NULL
		invoke WriteProcessMemory, hp, cAddrZ2, offset codeZ2, 4, NULL
	.else
		mov esi,offset codeP
		mov [esi+2],dl
		invoke WriteProcessMemory, hp, cAddr, offset codeToP, 2, NULL
		invoke WriteProcessMemory, hp, cAddrP, offset codeP, 5, NULL
	.endif

done:
	invoke Sleep,100		;��ֹ�޸Ĺ���
	cmp on,0
	jne S0
	ret
ranThreadcSSS endp

ranChoiceSSS proc,
	hp:	dword
		cmp on,0
		.if	ZERO?
			mov on,1
			invoke ReadProcessMemory, hp, 6A9EC0h, offset delta1, 4, NULL
			add delta1, 768h		;ƫ����1

			invoke ReadProcessMemory, hp, delta1, offset delta2, 4, NULL
			add delta2, 138h		;ƫ����2

			invoke ReadProcessMemory, hp, delta2, offset delta3, 4, NULL
			add delta3, 28h		;ƫ����3
			invoke CreateThread, NULL, 0, OFFSET ranThreadpng, hp, 0,th2
			invoke CreateThread, NULL, 0, OFFSET ranThreadcSSS, hp, 0,th
			invoke crt_printf,offset freeM
		.else
			mov	on,0
			invoke TerminateThread,th,0
			invoke TerminateThread,th2,0
			invoke WriteProcessMemory, hp, cAddr, offset codeN, 2, NULL
			invoke WriteProcessMemory, hp, cAddrZ1, offset codeZN1, 2, NULL
			invoke WriteProcessMemory, hp, cAddrZ2, offset codeZN2, 4, NULL
			invoke WriteProcessMemory, hp, cAddrP, offset codePN, 5, NULL
			invoke crt_printf,offset normM
		.endif
	ret
ranChoiceSSS endp
end