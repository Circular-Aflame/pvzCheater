include         util.inc
 
.data
hp      dword   0       ;���̾��
pid     dword   0   
pname   byte    "ֲ���ս��ʬ���İ�",0
lineM   byte    0ah,0dh,66 DUP("^"),0ah,0dh,0
greetM  byte    "--------��ӭ����PVZ Cheater-----",0ah,0dh,0
errorM  byte    "---/*_*\��Ǹ���ƺ������ڻ��ŵĽ�ʬ����ȷ��������Ϸ��",0ah,0dh,0
sucM    byte    "-\*o*/�ɹ��ҵ����Ļ�԰���뿪ʼ�赸�ɣ�",0ah,0dh,0
cmdM    byte    "-\*o*/���������Ļ�԰����˵���������ָ����Ż�ȡ����",0ah,0dh,0
listM   byte    "0 - ����Ϊֹ�ɡ�",0ah,0dh,
                "1 - ���뻨����qwq",0ah,0dh,
                "2 - ��Ǯ��",0ah,0dh,
                "3 - ���⣡",0ah,0dh,
                "4 - ���ڲ��֣�������ҹ��",0ah,0dh,
                "5 - ��ֲ����һ������ӵ���ϰ",0ah,0dh,
                "6 - �������Ϊ���ӷŴ������",0ah,0dh,
                "7 - �ٱ����ӣ�ֻҪ��ӳ��Ϳ����ֳ�����һ��ֲ��",0ah,0dh,
                0
reqM    byte    "�����㣺 ",0
scanM   byte    "%d",0
cmdin   dword   ?
;�����������ָ�����
cOver           dword       0       ;����ָ��
cFreeSun        dword       1       ;���ֲ��ָ��
cStealMoney     dword       2       ;���ý��ָ��
cStealSun       dword       3       ;��������ָ��
cAlwaysOn       dword       4       ;ȡ����ȴָ��
cRandomBullet   dword       5       ;����ӵ�ָ��
cRanChoice      dword       6       ;ѡ���������ֲ��ָ��
cRanChoiceS     dword       7       ;�����ѡ����ֲ��ָ��


.code
main PROC
    invoke crt_printf,offset greetM         ;��ӡ��ӭ��Ϣ
    invoke crt_printf,offset lineM
    ;�������ƻ�ȡ��Ϸ����
    invoke FindWindowA, NULL, ADDR pname
    cmp eax, 0
    je error
    ;��ȡ����pid���򿪾��
    invoke GetWindowThreadProcessId, eax, offset pid
    invoke OpenProcess, PROCESS_ALL_ACCESS, NULL, pid
    cmp eax, INVALID_HANDLE_VALUE
    je error
    ;��������ӡ�ɹ���Ϣ
    mov hp,eax
    invoke crt_printf,offset sucM
    invoke crt_printf,offset lineM
    ;��ʾָ��˵�
    invoke crt_printf,offset cmdM
    invoke crt_printf,offset listM
LO: ;��ʼѭ���ȴ�ָ��
    invoke crt_printf,offset reqM
    invoke crt_scanf,offset scanM,offset cmdin

    ;�����üĴ�����cmp
    mov eax,cmdin
    ;���ʶ��ָ��
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

    jmp LO
error:  ;������
    invoke crt_printf,offset errorM
    ret

done:   ;�����ر�
    invoke CloseHandle,hp
    ret
main endp
end main