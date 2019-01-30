section .text
    global rindex:function

rindex:
	xor rax, rax
	jmp _loop

_ret:
	ret

_equal:
	mov rax, rdi
	cmp byte [rdi], 0
	je _ret
	inc rdi
	jmp _loop

_loop:
	cmp byte [rdi], sil
	je _equal
	cmp byte [rdi], 0
	je _ret
	inc rdi
	jmp _loop