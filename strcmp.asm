section .text
	global strcmp:function

strcmp:
	xor rdx, rdx
	jmp _increm

_increm:
	mov al, byte [rdi + rdx]
	cmp al, 0
	je _exit
	cmp al, byte [rsi + rdx]
	jne _exit
	inc rdx
	jmp _increm

_exit:
	sub al, [rsi + rdx]
	movsx rax, al
	ret