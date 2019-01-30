section .text
    global strstr:function

strstr:
	xor rdx, rdx
	xor r8, r8
	mov rax, rdi
    jmp _loop

_reset:
	mov r8, -1
	ret

_set_rax:
	mov r9b, byte [rsi + r8]
	cmp byte [rax], r9b
	jne _reset
	ret

_error:
	xor rax, rax
	ret

_exit:
	cmp byte [rsi + r8], 0
	jne _error
	sub rax, r8
	ret

_loop:
	cmp byte [rsi + r8], 0
	je _exit
	cmp byte [rax], 0
	je _exit
	call _set_rax
	inc r8
	inc rax
	jmp _loop
