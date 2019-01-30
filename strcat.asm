section .text
	global strcat:function

strcat:
	mov rax, rdi
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
	mov r9b, byte[rsi]
	mov byte[rax], r9b
	inc rax
	inc rsi
	jmp _concat
