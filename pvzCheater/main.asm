include         util.inc
 
.data
hp      dword   0       ;进程句柄
pid     dword   0   
pname   byte    "植物大战僵尸中文版",0
lineM   byte    0ah,0dh,66 DUP("^"),0ah,0dh,0
greetM  byte    "--------欢迎来到PVZ Cheater-----",0ah,0dh,0
errorM  byte    "---/*_*\抱歉！似乎不存在活着的僵尸，请确保打开了游戏！",0ah,0dh,0
sucM    byte    "-\*o*/成功找到您的花园，请开始舞蹈吧！",0ah,0dh,0
cmdM    byte    "-\*o*/以下是您的花园服务菜单，请输入指令序号获取服务",0ah,0dh,0
listM   byte    "0 - 到此为止吧。",0ah,0dh
        byte    "1 - 不想花阳光qwq",0ah,0dh
        byte    "2 - 来钱！",0ah,0dh
        byte    "3 - 发光！",0ah,0dh
        byte    "4 - 勤于播种，不分昼夜！",0ah,0dh
        byte    "5 - 让植物做一点随机子弹练习",0ah,0dh
        byte    "6 - 你可以认为种子放错袋子了",0ah,0dh
        byte    "7 - 百变种子，只要反映快就可以种出任意一种植物",0ah,0dh
        byte    "8 - 你的种子可能超出了控制",0ah,0dh
        byte    "9 - 你种下的不一定是种子！",0ah,0dh
        byte    "10 - 重叠种植",0ah,0dh
        byte    "11 - 爆炸伤害",0ah,0dh
        byte    "12 - 解锁全部关卡植物",0ah,0dh
        byte    0
reqM    byte    "先来点： ",0
scanM   byte    "%d",0
cmdin   dword   ?
;以下逐个定义指令代码
cOver               dword       0       ;结束指令
cFreeSun            dword       1       ;免费植物指令
cStealMoney         dword       2       ;设置金币指令
cStealSun           dword       3       ;设置阳光指令
cAlwaysOn           dword       4       ;取消冷却指令
cRandomBullet       dword       5       ;随机子弹指令
cRanChoice          dword       6       ;选出随机可视植物指令
cRanChoiceS         dword       7       ;随机可选可视植物指令
cRanChoiceSS        dword       8       ;随机不可见植物指令
cRanChoiceSSS       dword       9       ;随机不可见植物指令
cPlantOverlap       dword       10      ;重叠种植指令
cExplosiveDamage    dword       11      ;爆炸伤害指令
cUnlockAllPlants    dword       12      ;解锁全部关卡植物指令

.code
main PROC
    invoke crt_printf,offset greetM         ;打印欢迎信息
    invoke crt_printf,offset lineM
    ;利用名称获取游戏窗口
    invoke FindWindowA, NULL, ADDR pname
    cmp eax, 0
    je error
    ;获取窗口pid并打开句柄
    invoke GetWindowThreadProcessId, eax, offset pid
    invoke OpenProcess, PROCESS_ALL_ACCESS, NULL, pid
    cmp eax, INVALID_HANDLE_VALUE
    je error
    ;保存句柄打印成功信息
    mov hp,eax
    invoke crt_printf,offset sucM
    invoke crt_printf,offset lineM
    ;显示指令菜单
    invoke crt_printf,offset cmdM
    invoke crt_printf,offset listM
LO: ;开始循环等待指令
    invoke crt_printf,offset reqM
    invoke crt_scanf,offset scanM,offset cmdin

    ;必须用寄存器来cmp
    mov eax,cmdin
    ;逐个识别指令
    cmp eax,cOver
    .if ZERO?
        jmp done
    .endif
    
    cmp eax,cFreeSun
    .if ZERO?
        invoke freeSun,hp
        jmp LO
    .endif
    
    cmp eax,cStealMoney
    .if Zero?
        invoke stealMoney,hp
        jmp LO
    .endif

    cmp eax,cStealSun
    .if Zero?
        invoke stealSun,hp
        jmp LO
    .endif

    cmp eax,cAlwaysOn
    .if Zero?
        invoke alwaysOn,hp
        jmp LO
    .endif

    cmp eax,cRandomBullet
    .if Zero?
        invoke randomBullet,hp
        jmp LO
    .endif

    cmp eax,cRanChoice
    .if Zero?
        invoke ranChoice,hp
        jmp LO
    .endif

    cmp eax,cRanChoiceS
    .if Zero?
        invoke ranChoiceS,hp
        jmp LO
    .endif
    
    cmp eax,cRanChoiceSS
    .if Zero?
        invoke ranChoiceSS,hp
        jmp LO
    .endif

    cmp eax,cRanChoiceSSS
    .if Zero?
        invoke ranChoiceSSS,hp
        jmp LO
    .endif

    cmp eax,cPlantOverlap
    .if Zero?
        invoke plantOverlap,hp
        jmp LO
    .endif

    cmp eax,cExplosiveDamage
    .if Zero?
        invoke explosiveDamage,hp
        jmp LO
    .endif

    cmp eax,cUnlockAllPlants
    .if Zero?
        invoke unlockallplants,hp
        jmp LO
    .endif

    jmp LO
error:  ;错误处理
    invoke crt_printf,offset errorM
    ret

done:   ;正常关闭
    invoke CloseHandle,hp
    ret
main endp
end main