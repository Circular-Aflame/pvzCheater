include util.inc

.data
	on				dword		0
	addrBean		dword		69F1C8h		;豌豆伤害地址
	addrCoolBean	dword		69F1D4h		;寒冰射手伤害地址
	addrMush		dword		69F1F8h		;蘑菇孢子伤害地址
	addrThorn		dword		69F228h		;尖刺伤害地址
	addrStar		dword		69F21Ch		;星星伤害地址
	addrCabbage		dword		69F1E0h		;卷心菜伤害地址
	addrCorn		dword		69F240h		;玉米伤害地址
	addrWaterMelon	dword		69F1ECh		;西瓜伤害地址	
	damage			dword		9999		;伤害量
	damclass1		dword		20			;原来的伤害
	damclass2		dword		40			;原来的伤害
	damclass3		dword		80			;原来的伤害
	freeM			byte		"开启随机伤害（投射类植物）！！！",0ah,0dh,0
	normM			byte		"植物伤害回归正常",0ah,0dh,0
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