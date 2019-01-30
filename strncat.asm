section .text
	global strncat:function

strncat:
	mov rax, rdi
	xor r8, r8
	jmp _loop

_loop:
	cmp byte[rax], 0
	je _concat
	inc rax
	jmp _loop

_end:
	mov rax, rdi
	ret

_concat:
	cmp byte[rsi], 0
	je _end
	cmp rdx, r8
	je _end
	inc r8
	mov r9b, byte[rsi]
	mov byte[rax], r9b
	inc rax
	inc rsi
	jmp _concat
