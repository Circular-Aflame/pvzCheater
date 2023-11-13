include util.inc

.data
coinCount	dword		?		;金币数量
delta1		dword		?		;金币地址偏移量1
delta2		dword		?		;金币地址偏移量2
coinSet		byte		"你想要挣取（白嫖）的金币是：",0ah,0dh,0
scanNum		byte		"%d",0
endMsg		byte		"白嫖金币成功！！！",0ah,0dh,0

.code

stealMoney proc, 
	hp: dword,

	invoke crt_printf,offset coinSet
	invoke crt_scanf,offset scanNum,offset coinCount

	invoke ReadProcessMemory, hp, 6A9F38h, offset delta1, 4, NULL
	add delta1, 82Ch		;偏移量1

	invoke ReadProcessMemory, hp, delta1, offset delta2, 4, NULL
	add delta2, 28h			;偏移量2

    invoke WriteProcessMemory, hp, delta2, offset coinCount, 4, NULL
	invoke crt_printf, offset endMsg

	ret
stealMoney endp

end