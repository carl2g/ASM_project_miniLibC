section .text
    global strcspn:function

strcspn:
	xor rax, rax
	jmp _loop

_ret:
	ret

_inc:
	add r8, 1
	inc r9
	jmp _loop2

_inc_res:
	inc rax
	inc rdi
	jmp _loop

_loop2:
	cmp byte [r9], 0
	je _ret
	mov r10b, byte[r9]
	cmp byte [rdi], r10b
	je _inc
	inc r9
	jmp _loop2

_loop:
	cmp byte[rdi], 0
	je _ret
	xor r8, r8
	mov r9, rsi
	call _loop2
	cmp r8, 0
	jne _ret
	jmp _inc_res
	inc rdi
	jmp _loop

