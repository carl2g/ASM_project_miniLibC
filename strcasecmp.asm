section .text
	global strcasecmp:function

strcasecmp:
	xor rdx, rdx
	mov rax, rdi
	jmp _loop

_do_it:
	OR al, 32
	ret

_down_val:
	cmp al, 65
	jge _do_it
	ret

_up_val:
	cmp al, 90
	jle _down_val
	ret

_loop:
	mov al, [rsi + rdx]
	call _up_val
	mov r9b, al
	mov al, [rdi + rdx]
	call _up_val
	cmp al, 0
	je _exit
	jmp _comp

_comp:
	cmp al, r9b
	jne _exit
	inc rdx
	jmp _loop

_exit:
	sub al, r9b
	movsx rax, al
	ret