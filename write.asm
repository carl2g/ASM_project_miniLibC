section .text
    global write:function

write:
	mov rax, 1
	syscall
	mov rax, rdx
	ret
