include util.inc

.data
sunCollect	dword		?		;��������
delta1		dword		?		;�����ַƫ����1
delta2		dword		?		;�����ַƫ����2
sunSet		byte		"����Ҫ��ȡ�����Σ��������ǣ�",0ah,0dh,0
scanNum		byte		"%d",0
endMsg		byte		"���Ĵ�����Ϊ���ռ������⣡����",0ah,0dh,0

.code

stealSun proc, 
	hp: dword

	invoke crt_printf,offset sunSet
	invoke crt_scanf,offset scanNum,offset sunCollect

	invoke ReadProcessMemory, hp, 6A9EC0h, offset delta1, 4, NULL
	add delta1, 768h		;ƫ����1

	invoke ReadProcessMemory, hp, delta1, offset delta2, 4, NULL
	add delta2, 5560h		;ƫ����2

    invoke WriteProcessMemory, hp, delta2, offset sunCollect, 4, NULL
	invoke crt_printf, offset endMsg

	ret
stealSun endp

end