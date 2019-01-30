section .text
	global strncmp:function

strncmp:
	xor rax, rax
	mov r9, 0
	cmp rdx, 0
	je _ret
	dec rdx
	jmp _increm

_increm:
	cmp rdx, r9
	je _exit
	mov al, [rdi + r9]
	cmp al, 0
	je _exit
	cmp al, [rsi + r9]
	jne _exit
	inc r9
	jmp _increm

_ret:
	ret

_exit:
	mov al, [rdi + r9]
	sub al, [rsi + r9]
	movsx rax, al
	ret