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
reqM    byte    "�����㣺 ",0
scanM   byte    "%d",0
cmdin   dword   ?
;�����������ָ�����
cOver           dword       0       ;����ָ��
cFreeSun        dword       1       ;���ֲ��ָ��
cStealMoney     dword       2       ;���ý��ָ��
cStealSun       dword       3       ;��������ָ��


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

    jmp LO
error:  ;������
    invoke crt_printf,offset errorM
    ret

done:   ;�����ر�
    invoke CloseHandle,hp
    ret
main endp
end main