section .text
    global strlen:function

strlen:
    mov rax, 0                      ; Set the index to 0
    jmp _increm                     ; Jump to the function increm

_exit:
    ret

_increm:
    cmp byte [rdi + rax], 0 		; Do bite is a teminated byte
    je _exit
    inc rax                         ; Increment value in rsi
    jmp _increm                     ; If not increment index