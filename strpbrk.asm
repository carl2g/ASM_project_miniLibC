section .text
    global strpbrk:function

strpbrk:
	jmp _loop1

_set_nul:
	xor rax, rax
	ret

_ret:
	mov rax, rdi
	cmp byte [rax], 0
	je _set_nul
	ret

_loop1:
	mov r9, 0
	mov r8b, byte[rdi]
	cmp byte[rdi], 0
	je _ret
	call _loop2
	cmp r8b, byte[rsi + r9]
	je _ret
	inc rdi
	jmp _loop1

_ret_loop:
	ret

_loop2:
	cmp byte[rsi + r9], 0
	je _ret_loop
	cmp byte[rsi + r9], r8b
	je _ret
	inc r9
	jmp _loop2
