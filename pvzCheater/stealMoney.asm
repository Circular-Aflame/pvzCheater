include util.inc

.data
coinCount	dword		?		;�������
delta1		dword		?		;��ҵ�ַƫ����1
delta2		dword		?		;��ҵ�ַƫ����2
coinSet		byte		"����Ҫ��ȡ�����Σ��Ľ���ǣ�",0ah,0dh,0
scanNum		byte		"%d",0
endMsg		byte		"���ν�ҳɹ�������",0ah,0dh,0

.code

stealMoney proc, 
	hp: dword,

	invoke crt_printf,offset coinSet
	invoke crt_scanf,offset scanNum,offset coinCount

	invoke ReadProcessMemory, hp, 6A9F38h, offset delta1, 4, NULL
	add delta1, 82Ch		;ƫ����1

	invoke ReadProcessMemory, hp, delta1, offset delta2, 4, NULL
	add delta2, 28h			;ƫ����2

    invoke WriteProcessMemory, hp, delta2, offset coinCount, 4, NULL
	invoke crt_printf, offset endMsg

	ret
stealMoney endp

end