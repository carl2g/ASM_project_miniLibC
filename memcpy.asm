section .text
	global memcpy:function

memcpy:
	mov r8, 0
	jmp _loop

_ret:
	mov rax, rdi
	ret

_loop:
	cmp r8, rdx
	je _ret
	mov r9b, [rsi + r8]
	cmp r9b, 0
	je _ret
	mov [rdi + r8], r9b
	inc r8
	jmp _loop
