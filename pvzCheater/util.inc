.386 
.model flat, stdcall
.STACK 4096
option casemap :none
include /masm32/include/windows.inc
include /masm32/include/masm32.inc
include /masm32/include/gdi32.inc
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
include     /masm32/include/msvcrt.inc
includelib  /masm32/lib/msvcrt.lib


;函数声明
freeSun			proto,	hp:dword		;不消耗阳光
stealMoney		proto,	hp:dword		;设置金币
stealSun		proto,	hp:dword		;设置阳光
alwaysOn		proto,	hp:dword		;无冷却
randomBullet	proto,	hp:dword		;随机子弹
ranChoice		proto,	hp:dword		;随机获得种植（可见图像）
ranChoiceS		proto,	hp:dword		;随机种植（可见图像）
ranChoiceSS		proto,	hp:dword		;随机种植，不知道种了啥
ranChoiceSSS	proto,	hp:dword		;随机放置，不知道是啥
plantOverlap	proto,	hp:dword		;重叠种植
explosiveDamage	proto,	hp:dword		;爆炸性伤害
unlockallplants proto,	hp:dword		;解锁全部关卡植物	