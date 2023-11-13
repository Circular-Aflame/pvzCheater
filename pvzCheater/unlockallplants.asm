include util.inc

.data
    delta1		dword		?
    delta2		dword		?
	on			dword		1

.code
unlockallplants proc, 
	hp: dword

	invoke ReadProcessMemory, hp, 6A9EC0h, offset delta1, 4, NULL
	add delta1, 82Ch		;Æ«ÒÆÁ¿1

	invoke ReadProcessMemory, hp, delta1, offset delta2, 4, NULL
	add delta2, 2Ch			;Æ«ÒÆÁ¿2

	invoke WriteProcessMemory, hp, delta2, offset on, 4, NULL
	ret

unlockallplants endp

end