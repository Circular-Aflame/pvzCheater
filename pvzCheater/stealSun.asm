include util.inc

.data
sunCollect	dword		?		;阳光数量
delta1		dword		?		;阳光地址偏移量1
delta2		dword		?		;阳光地址偏移量2
sunSet		byte		"你想要挣取（白嫖）的阳光是：",0ah,0dh,0
scanNum		byte		"%d",0
endMsg		byte		"疯狂的戴夫已为你收集到阳光！！！",0ah,0dh,0

.code

stealSun proc, 
	hp: dword

	invoke crt_printf,offset sunSet
	invoke crt_scanf,offset scanNum,offset sunCollect

	invoke ReadProcessMemory, hp, 6A9EC0h, offset delta1, 4, NULL
	add delta1, 768h		;偏移量1

	invoke ReadProcessMemory, hp, delta1, offset delta2, 4, NULL
	add delta2, 5560h		;偏移量2

    invoke WriteProcessMemory, hp, delta2, offset sunCollect, 4, NULL
	invoke crt_printf, offset endMsg

	ret
stealSun endp

end