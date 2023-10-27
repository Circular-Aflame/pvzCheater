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
reqM    byte    "先来点： ",0
scanM   byte    "%d",0
cmdin   dword   ?
;以下逐个定义指令代码
cOver           dword       0       ;结束指令
cFreeSun        dword       1       ;免费植物指令
cStealMoney     dword       2       ;设置金币指令
cStealSun       dword       3       ;设置阳光指令


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

    jmp LO
error:  ;错误处理
    invoke crt_printf,offset errorM
    ret

done:   ;正常关闭
    invoke CloseHandle,hp
    ret
main endp
end main