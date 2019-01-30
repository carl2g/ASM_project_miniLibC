section .text
	global memmove:function

memmove:
	mov r8, 0
	jmp _push_stack

_ret:
	mov rax, rdi
	ret

_push_stack:
	cmp r8, rdx
	je _loop
	movsx r9, byte [rsi + r8]
	push r9
	inc r8
	jmp _push_stack

_loop:
	cmp r8, 0
	je _ret
	dec r8
 	pop r9
	mov byte [rdi + r8], r9b
	jmp _loop
