include util.inc

.data
	on				dword		0
	addrBean		dword		69F1C8h		;�㶹�˺���ַ
	addrCoolBean	dword		69F1D4h		;���������˺���ַ
	addrMush		dword		69F1F8h		;Ģ�������˺���ַ
	addrThorn		dword		69F228h		;����˺���ַ
	addrStar		dword		69F21Ch		;�����˺���ַ
	addrCabbage		dword		69F1E0h		;���Ĳ��˺���ַ
	addrCorn		dword		69F240h		;�����˺���ַ
	addrWaterMelon	dword		69F1ECh		;�����˺���ַ	
	damage			dword		9999		;�˺���
	damclass1		dword		20			;ԭ�����˺�
	damclass2		dword		40			;ԭ�����˺�
	damclass3		dword		80			;ԭ�����˺�
	freeM			byte		"��������˺���Ͷ����ֲ�������",0ah,0dh,0
	normM			byte		"ֲ���˺��ع�����",0ah,0dh,0
.code
explosiveDamage proc, hp: dword
	cmp on,0
		.if	ZERO?
			mov on,1
			invoke WriteProcessMemory, hp, addrBean, offset damage, 4, NULL
			invoke WriteProcessMemory, hp, addrCoolBean, offset damage, 4, NULL
			invoke WriteProcessMemory, hp, addrMush, offset damage, 4, NULL
			invoke WriteProcessMemory, hp, addrThorn, offset damage, 4, NULL
			invoke WriteProcessMemory, hp, addrStar, offset damage, 4, NULL
			invoke WriteProcessMemory, hp, addrCabbage, offset damage, 4, NULL
			invoke WriteProcessMemory, hp, addrCorn, offset damage, 4, NULL
			invoke WriteProcessMemory, hp, addrWaterMelon, offset damage, 4, NULL
			invoke crt_printf, offset freeM
		.else
			mov	on,0
			invoke WriteProcessMemory, hp, addrBean, offset damclass1, 4, NULL
			invoke WriteProcessMemory, hp, addrCoolBean, offset damclass1, 4, NULL
			invoke WriteProcessMemory, hp, addrMush, offset damclass1, 4, NULL
			invoke WriteProcessMemory, hp, addrThorn, offset damclass1, 4, NULL
			invoke WriteProcessMemory, hp, addrStar, offset damclass1, 4, NULL
			invoke WriteProcessMemory, hp, addrCabbage, offset damclass2, 4, NULL
			invoke WriteProcessMemory, hp, addrCorn, offset damclass1, 4, NULL
			invoke WriteProcessMemory, hp, addrWaterMelon, offset damclass3, 4, NULL
			invoke crt_printf,offset normM
		.endif
	ret

explosiveDamage endp

end