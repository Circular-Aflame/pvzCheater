include util.inc

.data
on				dword	0
plantallow		byte	0E9h, 20h, 09h, 00h, 00h
plantrefuse		byte	0Fh, 84h, 1Fh, 09h, 00h, 00h			
plantAddr		dword	40FE2Fh				;�Ƿ������ֲ��ַ
freeM			byte	"������һ���������ص���ֲ��������", 0ah, 0dh, 0
normM			byte	"̫�������ָ����˵��䣡����", 0ah, 0dh, 0

.code
plantOverlap proc,
	hp:	dword
		cmp on,0
		.if	ZERO?
			mov on,1
			invoke WriteProcessMemory, hp, plantAddr, offset plantallow, 5, NULL
			invoke crt_printf,offset freeM
		.else
			mov	on,0
			invoke WriteProcessMemory, hp, plantAddr, offset plantrefuse, 6, NULL
			invoke crt_printf,offset normM
		.endif
	ret
plantOverlap endp
end