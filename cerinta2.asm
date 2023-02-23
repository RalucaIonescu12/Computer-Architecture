.data
	a: .long 0
	atoiRes: .long 0
	First: .long 0
	
	e: .long 0
	delim: .asciz " "
	formatNumere: .asciz "%d\n"
	formatScanf: .asciz "%100[^\n]"
	res: .space 4
	str: .space 100
	
/// 2 10 mul 5 div 7 6 sub add
	
.text

.global main

main:
	pushl $str
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx	
	
	//xor %eax, %eax
	
	//pushl $str
	//call gets
	//popl %ebx
	
	pushl $delim
	pushl $str
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax,res
	
	pushl res
	call atoi
	popl %ebx
	
	pushl %eax
	
	
et_for:
	
	pushl $delim
	pushl $0
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax,res
	
	cmp $0, res
	je exit
	
	pushl res
	call atoi
	popl %ebx
	
	movl %eax,atoiRes
	
	cmp $0,atoiRes
	je operatie
	
	
	pushl %eax
	
	jmp et_for	
	
	
operatie:
	
	movl res,%edi
	movl $0,%ecx
	movb (%edi,%ecx,1),%al
	
	cmp $97,%al
	je adunare
	
	cmp $115,%al
	je scadere
	
	cmp $109,%al
	je inmultire
	
	cmp $100,%al
	je impartire
	
adunare:
	popl %eax
	popl %ebx
	addl %ebx,%eax
	pushl %eax
	jmp et_for
scadere:
	popl %eax
	popl %ebx
	subl %eax,%ebx
	pushl %ebx
	jmp et_for
inmultire:
	xorl %edx,%edx
	popl %eax
	popl %ebx
	mull %ebx
	pushl %eax
	jmp et_for
impartire:
	xorl %edx,%edx
	popl %eax
	popl %ebx
	movl %eax,a
	movl %ebx,%eax
	movl a,%ebx
	divl %ebx
	pushl %eax
	jmp et_for
	

exit:
	popl %eax
	
	pushl %eax
	pushl $formatNumere
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
