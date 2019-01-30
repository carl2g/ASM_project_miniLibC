section .text
	global memset:function

memset:
	mov r8, 0
	jmp _loop

_ret:
	mov rax, rdi
	ret

_loop:
	cmp r8, rdx
	je _ret
	mov [rdi + r8], sil
	inc r8
	jmp _loop
