include util.inc

.data
on			dword	0
delta1		dword		?		;��ַƫ����1
delta2		dword		?		;��ַƫ����2			
delta3		dword		?		;��ַƫ����2
var			dword		?		;ֲ��id����

freeM		byte	"����������ѡ��ʱ�䣬�ۼ��ֿ���������³ɣ�",0ah,0dh,0
normM		byte	"��ʱ��ʵһ���~~~",0ah,0dh,0

th			dword	0	;�߳̾��

.code
ranThreadcS proc,			;����޸��߳�
	hp: dword
	invoke crt_time,0
	invoke crt_srand,eax
S0:	invoke crt_rand
	mov ecx,48
	div ecx
	mov var,edx
	invoke WriteProcessMemory, hp, delta3, offset var, 4, NULL
	invoke Sleep,150		;��ֹ�޸Ĺ���
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
			add delta1, 768h		;ƫ����1

			invoke ReadProcessMemory, hp, delta1, offset delta2, 4, NULL
			add delta2, 138h		;ƫ����2

			invoke ReadProcessMemory, hp, delta2, offset delta3, 4, NULL
			add delta3, 28h		;ƫ����3

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