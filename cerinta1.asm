.data
	
	s: .long 0
	i: .long 0
	x: .long 0
	indexSb2: .long 0
	l: .string "let"
	a: .string "add"
	su: .string "sub"
	m: .string "mul"
	d: .string "div"
	
//A78801C00A7890EC04
// x 1 let x -14 div	

	minus : .asciz "-"
	final: .asciz "\n"
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%s\n"
	afisare_finala : .asciz "%d"
	afisare_op: .asciz "%s "
	afisare: .asciz "%d\n"
	afisare_numar: .asciz "%d "
	afisare_variabila: .asciz "%c "
	afisare_minus: .asciz "%s"
	//newline: .asciz "\n"
	sirb8: .space 100
	sirb2: .space 400
.text

.global main

main:
	
	pushl $sirb8
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl $sirb8, %edi			
	movl $sirb2, %esi			
	xorl %ecx, %ecx
et_for:
	movb (%edi, %ecx, 1), %al 
	cmp $0, %al 
	je parcurgere
	
	
	cmp $48, %al
	je cif0
	cmp $49, %al
	je cif1
	cmp $50, %al
	je cif2
	cmp $51, %al
	je cif3
	cmp $52, %al
	je cif4
	cmp $53, %al
	je cif5
	cmp $54, %al
	je cif6
	cmp $55, %al
	je cif7
	cmp $56, %al
	je cif8
	cmp $57, %al
	je cif9
	cmp $65, %al
	je A
	cmp $66, %al
	je B
	cmp $67, %al
	je C
	cmp $68, %al
	je D
	cmp $69, %al
	je E
	cmp $70, %al
	je F
	
	
	
	

cont:
	incl %ecx
	jmp et_for 

cif0:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont
	
cif1:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont

cif2:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont
	
cif3:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cif4:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
	
cif5:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont
	
cif6:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont
	
cif7:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont

cif8:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont

cif9:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont

A:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont

B:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont
	
C:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont
	
D:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	// movl %ecx, indexSb2
	
	popl %ecx
	jmp cont

E:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	
	popl %ecx
	jmp cont

F:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont

parcurgere:
	
  movl $1,%ecx      
for:
        movb (%esi,%ecx,1),%al
        cmp $0, %al   
        je exit
        
        cmp $48,%al
        je identificator

        cmp $49,%al
        je operatie

     

operatie:

	addl $8,%ecx
	
de_afisat_op:

	movl  %ecx,i
	addl $3,i
	movl $4,x
	movl $0,s
	
for_op:

	cmp %ecx,i
	je continuare_op

	movb (%esi,%ecx,1),%al

	cmp $48,%al
	je nu_se_adauga_op

	cmp $49,%al
	je de_adaugat_op
                   
de_adaugat_op:
	
	movl s,%eax
	addl x,%eax
	movl %eax,s
	incl %ecx
	
	xorl %edx,%edx
	movl x,%eax
	movl $2,%ebx
	divl %ebx
	movl %eax,x
	
	jmp for_op

nu_se_adauga_op:
	incl %ecx
	
	xorl %edx,%edx
	movl $2,%ebx
	movl x,%eax
	divl %ebx
	movl %eax,x

	jmp for_op
	
continuare_op:
	cmp $0,s
	je et_let
	cmp $1,s
	je et_add
	cmp $2,s
	je et_sub
	cmp $3,s
	je et_mul
	cmp $4,s
	je et_div
et_let:
	pushl %ecx
	
	pushl $l
	pushl $afisare_op
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	jmp for
	
et_add:
	pushl %ecx
	
	pushl $a
	pushl $afisare_op
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	incl %ecx
	
	jmp for
et_sub:
	pushl %ecx
	
	pushl $su
	pushl $afisare_op
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	
	jmp for
et_mul:
	pushl %ecx
	
	pushl $m
	pushl $afisare_op
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	jmp for
et_div:
	pushl %ecx
	
	pushl $d
	pushl $afisare_op
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	jmp for
	

identificator:

	incl %ecx
	movb (%esi,%ecx,1),%al

	cmp $48,%al
	je numar_intreg
	
	cmp $49,%al
	je variabila
	
variabila:
	
	addl $2,%ecx
	
de_afisat_var:
	
	movl  %ecx,i
	addl $8,i
	movl $128,x
	movl $0,s
	
for_var:
	cmp i,%ecx
	je continuare_var 

	movb (%esi,%ecx,1),%al
        
	cmp $48,%al
	je nu_se_adauga_var

	cmp $49,%al
	je de_adaugat_var
                  
de_adaugat_var:
	movl s,%eax
	addl x,%eax
	movl %eax,s
	
	incl %ecx
	
	xorl %edx,%edx
	movl x,%eax
	movl $2,%ebx
	divl %ebx
	movl %eax,x
	
	jmp for_var

nu_se_adauga_var:
	incl %ecx
	
	xorl %edx,%edx
	movl x,%eax
	movl $2,%ebx
	divl %ebx
	movl %eax,x
	
	jmp for_var

continuare_var:
	pushl %ecx
	
	pushl s
	pushl $afisare_variabila
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx 
	jmp  for
	
numar_intreg:
	incl %ecx
	movb (%esi,%ecx,1),%al

	cmp $48,%al
	je nr_pozitiv

	cmp $49, %al
	je nr_negativ
	
nr_negativ:
	pushl %ecx

	pushl $minus
	pushl $afisare_minus
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	jmp de_afisat_numar
	
                 
nr_pozitiv:

           jmp de_afisat_numar
             
de_afisat_numar:
	incl %ecx
	movl  %ecx,i
	addl $8,i
	movl $128,x
	movl $0,s
	
for_nr:
	cmp i,%ecx
	je continuare_nr 
	movb (%esi,%ecx,1),%al
	
	 cmp $48,%al
	je nu_se_adauga_nr
	
	cmp $49,%al
	je de_adaugat_nr
                   
de_adaugat_nr:
	movl s,%eax
	addl x,%eax
	movl %eax,s

	incl %ecx
	
	xorl %edx,%edx
	movl x,%eax
	movl $2,%ebx
	divl %ebx
	movl %eax,x

	jmp for_nr

nu_se_adauga_nr:

	incl %ecx
	
	xorl %edx,%edx
	movl x,%eax
	movl $2,%ebx
	divl %ebx
	movl %eax,x
	
	jmp for_nr

continuare_nr:
	
	pushl %ecx
	
	pushl s
	pushl $afisare_numar
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	jmp  for
              	
exit:
	

	pushl $0
	call fflush
	popl %ebx
	
	pushl $final
	pushl $afisare_minus
	call printf
	popl %ebx
	popl %ebx
	
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

