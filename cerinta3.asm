//x 1 let 2 x add y 3 let x y add mul	

.data
	a: .long 0
	y: .long 0
	atoiRes: .long 0
	delim: .asciz " "
	poz: .long 0
	x: .long 0
	formatScanf: .asciz "%100[^\n]"
	formatNumere: .asciz "%d\n"
	formatPrintf: .asciz "%c\n"
valori: .long 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	str: .space 101
	res: .space 4
	
.text

.global main

main:

	lea valori,%esi
	
	pushl $str
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx	
	
	pushl $delim
	pushl $str
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax,res
	
	pushl res
	call atoi
	popl %ebx
	
	movl %eax,atoiRes
	
	cmp $0,atoiRes
	je verificare
	
	pushl atoiRes

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
	je verificare
	
	pushl atoiRes
	
	jmp et_for	
	
verificare:

	movl res,%edi
	movl $1,%ecx
	
	movb (%edi,%ecx,1),%al

	cmp $0, %al 
	je variabila
	
	cmp $0, %al 
	jne operatie
	
	
	
variabila:
	//movl res,%edi
	movl $0,%ecx
	movb (%edi,%ecx,1),%al
	mov %al,poz
	subl $97,poz
	movl poz,%ecx
	movl (%esi,%ecx,4),%edx
	cmp $0,%edx
	jne exista_deja
	
	pushl res
	jmp et_for
	
exista_deja:
	pushl %edx
	jmp et_for
	
operatie:
	
	movl $0,%ecx
	movb (%edi,%ecx,1),%al
	
	cmp $97,%al
	je adunare
	
	cmp $108,%al
	je let
	
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
let:	
	popl %eax
	popl %ebx
	
	movl %eax,y
	
	movl %ebx,%edi
	movl $0,%ecx
	movb (%edi,%ecx,1),%al
	mov %al,poz
	subl $97,poz
	
	movl poz,%ecx
	movl y,%eax
	movl %eax, (%esi,%ecx,4)
	
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
