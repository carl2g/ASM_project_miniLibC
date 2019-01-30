section .text
	global strchr:function

strchr:
	xor rax, rax
	jmp _loop

_ret:
	ret

_equal:
	mov rax, rdi
	jmp _ret

_loop:
	cmp byte[rdi], sil
	je _equal
	cmp byte[rdi], 0
	je _ret
	inc rdi
	jmp _loop