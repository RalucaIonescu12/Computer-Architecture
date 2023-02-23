
.data
	
	delim: .asciz " "
	nrvar: .long 0
	
	i: .long 0
	j: .long 0
	k: .long 0
	l: .long 0
	n: .long 0
	m: .long 0
	val: .long 0
	atoiRes: .long 0
	formatScanf: .asciz "%100[^\n]"
	formatPrintf: .asciz "%d "
	newLine: .asciz "\n"
	str: .space 400
	res: .space 4
	matrice: .space 1600
	new: .space 1600
	
.text

.global main
//x 2 3 1 2 3 4 5 6 let x -2 add
//x 2 3 2 2 2 2 2 2 let x 1 sub
//2 3 -1 0 1 2 3 4
//x 2 3 -1 0 1 2 3 4 let rot90d
//3 2 2 -1 3 0 4 1

main:
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
	
	pushl $delim
	pushl $0
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax,res
	
	pushl res
	call atoi
	popl %ebx
	
	movl %eax,n
	
	pushl $delim
	pushl $0
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax,res

	pushl res
	call atoi
	popl %ebx
	
	movl %eax,m	
	
for:
	pushl $delim
	pushl $0
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax,res
	
	pushl res
	call atoi
	popl %ebx
	
	movl %eax,atoiRes
	cmp $0,atoiRes
	jne adaug_mat
	
	movl res,%esi
	movl $1,%ecx
	
	movb (%esi,%ecx,1),%al

	cmp $0, %al 
	je variabila
	
	movl res,%edi
	movl $0,%ecx
	
	movb (%edi,%ecx,1),%al

	cmp $114,%al
	je rotire
	
	cmp $108,%al
	je for
	
	jmp for

//verificare:
	//movl res,%esi
	//movl $1,%ecx
	
	//movb (%esi,%ecx,1),%al

	//cmp $0, %al 
	//je variabila
	
	//cmp $0, %al 
	//jne for

adaug_mat:
	
	movl i,%eax
	movl $0,%edx
	mull m
	addl j,%eax
	
	lea matrice,%edi
	movl atoiRes,%edx
	movl %edx,(%edi,%eax,4)
	incl j
	
	movl j,%ecx
	cmp %ecx,m
	je linie_urm
	
	jmp for
	
linie_urm:
	movl $0,j
	incl i
	jmp for
	
variabila:
	incl nrvar
	cmp $1,nrvar
	je modif_matr
	

//verif:
	//movl $0,%ecx
	//movb (%esi,%ecx,1),%al
	
	//cmp $108,%al
	//je for
	



modif_matr:
	
	pushl n
   	pushl $formatPrintf
   	call printf
   	popl %ebx
   	popl %ebx
	
	pushl m
   	pushl $formatPrintf
   	call printf
   	popl %ebx
   	popl %ebx

	pushl $delim
	pushl $0
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax,res
	
	pushl res
	call atoi
	popl %ebx
	
	movl %eax,val
	
	//ce operatie
	
	pushl $delim
	pushl $0
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax,res
	
	movl res,%esi
	movl $0,%ecx
	movb (%esi,%ecx,1),%al
	
	cmp $97,%al
	je adunare
	
	cmp $115,%al
	je scadere
	
	cmp $109,%al
	je inmultire
	
	cmp $100,%al
	je impartire

adunare:
	lea matrice,%edi
	movl $0,i
	movl $0,j
afor_i:
	movl i,%ecx
	cmp %ecx,n
	je exit
	
     afor_j:
     
   	movl j,%ecx
   	cmp %ecx,m
   	je acont
   	
   	movl i,%eax
   	movl $0,%edx
   	mull m
   	addl j,%eax
   	
   	movl (%edi,%eax,4),%edx
   	addl val,%edx
	movl %edx,(%edi,%eax,4)

	pushl %edx
   	pushl $formatPrintf
   	call printf
   	popl %ebx
   	popl %ebx
   	
   	pushl $0
   	call fflush
   	popl %ebx
	
	incl j
	
	jmp afor_j





acont:
	incl i
	movl $0,j
	jmp afor_i	
	
	
scadere:
	lea matrice,%edi
	movl $0,i
	movl $0,j
sfor_i:
	movl i,%ecx
	cmp %ecx,n
	je exit
	
     sfor_j:
     
   	movl j,%ecx
   	cmp %ecx,m
   	je scont
   	
   	movl i,%eax
   	movl $0,%edx
   	mull m
   	addl j,%eax
   	
   	movl (%edi,%eax,4),%edx
   	subl val,%edx
	movl %edx,(%edi,%eax,4)

	pushl %edx
   	pushl $formatPrintf
   	call printf
   	popl %ebx
   	popl %ebx
   	
   	pushl $0
   	call fflush
   	popl %ebx
	
	incl j
	jmp sfor_j

scont:
	incl i
	movl $0,j
	jmp sfor_i
		
inmultire:
	lea matrice,%edi
	movl $0,i
	movl $0,j
mfor_i:
	movl i,%ecx
	cmp %ecx,n
	je exit
	
     mfor_j:
     
   	movl j,%ecx
   	cmp %ecx,m
   	je mcont
   	
   	movl $0,%edx
   	movl i,%eax
   	mull m
   	addl j,%eax
   	
   	movl %eax,%ecx
   	
   	xorl %edx,%edx
   	movl (%edi,%ecx,4),%eax
   	mull val
	movl %eax,(%edi,%ecx,4)

	pushl %eax
   	pushl $formatPrintf
   	call printf
   	popl %ebx
   	popl %ebx
   	
   	pushl $0
   	call fflush
   	popl %ebx
	
	incl j
	jmp mfor_j

mcont:
	incl i
	movl $0,j
	jmp mfor_i
	
	
impartire:
	lea matrice,%edi
	movl $0,i
	movl $0,j
dfor_i:
	movl i,%ecx
	cmp %ecx,n
	je exit
	
     dfor_j:
     
   	movl j,%ecx
   	cmp %ecx,m
   	je dcont
   	
   	movl i,%eax
   	movl $0,%edx
   	mull m
   	addl j,%eax
   	
   	movl %eax,%ecx
   	
   	xorl %edx,%edx
   	movl (%edi,%ecx,4),%eax
   	cdq
   	idivl val
	movl %eax,(%edi,%ecx,4)
	
	pushl %eax
   	pushl $formatPrintf
   	call printf
   	popl %ebx
   	popl %ebx
   	
   	pushl $0
   	call fflush
   	popl %ebx
	
	incl j
	jmp dfor_j


dcont:
	incl i
	movl $0,j
	jmp dfor_i



	
rotire:
	
	pushl m
   	pushl $formatPrintf
   	call printf
   	popl %ebx
   	popl %ebx
   
   	
	pushl n
   	pushl $formatPrintf
   	call printf
   	popl %ebx
   	popl %ebx
   	
   
	movl $0,i
	movl $0,j	
for_i:
	movl i,%ecx
	cmp %ecx,n
	je afisare_rotire
	
     for_j:
     
   	movl j,%ecx
   	cmp %ecx,m
   	je cont
   	
   	movl $0,%edx
   	movl i,%eax
   	mull m
   	addl j,%eax
   	
   	movl %eax,%ecx
   
   	movl j,%eax
   	movl %eax,k
   	
   	movl n,%eax
   	subl i,%eax
   	subl $1,%eax
   	movl %eax,l
   	
   	movl $0,%edx
   	movl k,%eax
   	mull n
   	addl l,%eax
   	
   	movl %eax,%ebx
   	
	lea matrice,%edi
	lea new,%esi
	
   	movl (%edi,%ecx,4),%eax
   	movl %eax,(%esi,%ebx,4)
   	
	incl j
	jmp for_j

cont:
	incl i
	movl $0,j
	jmp for_i
	

afisare_rotire:
	
	movl $0,i 
	movl $0,j
af_for_i:
	movl i,%ecx
	cmp %ecx,m
	je exit
	
     af_for_j:
     
   	movl j,%ecx
   	cmp %ecx,n
   	je af_cont
   	
   	movl i,%eax
   	movl $0,%edx
   	mull n
   	addl j,%eax
   	
   	lea new,%edi
   	movl (%edi,%eax,4),%edx

	pushl %edx
   	pushl $formatPrintf
   	call printf
   	popl %ebx
   	popl %ebx
   	
   	pushl $0
   	call fflush
   	popl %ebx
	
	incl j
	jmp af_for_j

af_cont:
	incl i
	movl $0,j
	jmp af_for_i
		

exit:
	movl $4,%eax
	movl $1,%ebx
	movl $newLine,%ecx
	movl $2,%edx
	int $0x80
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
