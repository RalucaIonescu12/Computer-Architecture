.data
	TREIN: .long 0
	trein: .long 0
	n: .long 0
	m: .long 0
	k: .long 0
	j: .long 0
	l: .long 0
	elem: .long 0
	K: .long 0
	N: .long 0
	M: .long 0
	Ns: .long 0
	Ms: .long 0
	Mv: .long 0
	Kv: .long 0
	TREINs: .long 0
	sol: .long 0
	SOL: .long 0
	minusUNU: .asciz "-1"
	newline: .asciz "\n"
	formatPrintf: .asciz "%d "
	formatPrintN: .asciz "%s\n"
	format: .asciz "%s"
	formatScanf: .asciz "%2000[^\n]"
	delim: .asciz " "
	res: .space 4
	str: .space 2000
	p1: .space 2000
	fr: .space 2000
.text



.global main

back:
	pushl %ebp
	
	movl %esp,%ebp
	
	pushl %edi
	movl 8(%ebp),%edi
	//edi=fr
	
	pushl %esi
	movl 12(%ebp),%esi
	//esi=p1
	
	pushl %ebx
	
	movl 16(%ebp),%ebx
	movl %ebx, TREIN
	
	movl 20(%ebp),%ebx
	movl %ebx, N
	
	movl 24(%ebp),%ebx
	movl %ebx, M
	
	movl 28(%ebp),%ebx
	movl %ebx,K
	movl 32(%ebp),%eax    #eax=sol
	cmp $1,%eax
	je final_back
	
//%esp:(%ebx)(%esi)(%edi)%ebp:(%ebp v)(<adr de in>)(fr)(p1)(TreiN)(n)(m)(k)(sol)

// lista reg. de restaurat: %ebx, %esi, %edi, %ebp, %esp	
	
	movl $1,%ecx
	
	movl K,%edx                #edx=k 
for:
	cmp %ecx,N
	je final_back
	
	movl (%esi,%edx,4),%ebx    #ebx=p1[k]
	cmp $0,%ebx
	jne punct_fix
	
	//if(p1[k]==0
	 
	movl (%edi,%ecx,4),%ebx  #ebx=fr[i]
	cmp $3,%ebx
	je frecv_max_i

	//fr[i]<3
	//apelare valid 
	
	pushl %ecx
	
	pushl %ecx
	pushl %esi
	pushl M
	pushl K
	call valid
	popl %edx
	popl %ebx
	popl %esi
	popl %ecx
	
	movl %edx,K
	movl %ebx,M
	
	popl %ecx

	//eax=rez din valid
	
	cmp $1,%eax
	jne nu_este_valid
	
	//este valid:
	
	movl K,%edx              #edx=k
	movl %ecx,(%esi,%edx,4)  #p1[k]=i
	
	movl (%edi,%ecx,4),%ebx  #ebx=fr[i]
	incl %ebx
	movl %ebx,(%edi,%ecx,4)  #fr[i]++	
	
	subl $1,TREIN
	cmp TREIN,%edx
	jne k_nu_e_trein
	
	addl $1,TREIN
	//k==trein
	
	// if(solutie(fr,n,m,p1))
	pushl %edx
	pushl %ecx
	
	pushl TREIN
	pushl %esi
	pushl M
	pushl N
	pushl %edi
	call solutie
	popl %edi
	popl %ebx
	popl %edx
	popl %esi
	popl %ecx
	
	movl %ebx,N
	movl %edx,M
	movl %ecx,TREIN
	
	popl %ecx
	popl %edx
	
//in %eax e val din solutie
	movl %eax,SOL
	cmp $1,%eax
	jne nu_e_sol
	
	//solutie==1
	movl $1,SOL
	jmp final_back
	
// solutie==0	
nu_e_sol:
	
	movl (%edi,%ecx,4),%ebx
	subl $1, %ebx
	movl %ebx,(%edi,%ecx,4)
	
	//movl $0,%edx
	movl $0,(%esi,%edx,4)   #p1[k]=0
	incl %ecx
	jmp for

k_nu_e_trein:
	addl $1,TREIN
	incl K
	movl K,%edx
	
	pushl %ecx
	movl TREIN,%ebx
	pushl %ebx
	pushl %edx
	
	
//back(k+1)	
	
	pushl SOL
	pushl K
	pushl M
	pushl N
	pushl TREIN
	pushl %esi
	pushl %edi
	call back
	popl %edi
	popl %esi
	popl %edx	#trein
	popl %ebx	#n
	popl %ecx	#m
	popl %edx	#edx=k
	popl %edx	#sol
	
	movl %eax,SOL
	movl %ebx,N
	movl %ecx,M
	
	popl %edx
	popl %ebx
	popl %ecx
	
	movl SOL,%eax
	cmp $1,%eax
	
	je final_back
	
	movl %ebx,TREIN
	
	subl $1,%edx
	movl %edx,K
	
	movl (%edi,%ecx,4),%ebx
	subl $1,%ebx
	movl %ebx,(%edi,%ecx,4)  #fr[i]--
	movl $0,(%esi,%edx,4)   #p1[k]=0
	
	incl %ecx
	jmp for
	
punct_fix:
	subl $1,TREIN
	cmp TREIN,%edx
	jne k_nu_e_trein_pf
	addl $1,TREIN
	
	//trein==k
	
	//solutie
	
	pushl %edx
	pushl %ecx
	
	pushl TREIN
	pushl %esi
	pushl M
	pushl N
	pushl %edi
	call solutie
	popl %edi
	popl %ebx
	popl %edx
	popl %esi
	popl %ecx
	
	movl %ebx,N
	movl %edx,M
	movl %ecx,TREIN
	
	popl %ecx
	popl %edx
	
//in %eax e val din solutie

	cmp $0,%eax
	je nu_e_sol_pf
	
	//solutie=1
	movl $1,SOL
	jmp final_back
	
	//solutie==0
nu_e_sol_pf:
	
	jmp final_back
	

k_nu_e_trein_pf:
	addl $1,TREIN
	incl K
	movl K,%edx
	
	pushl %ecx
	movl TREIN,%ebx
	pushl %ebx
	pushl %edx
	
	
//back(k+1)	
	
	pushl SOL
	pushl K
	pushl M
	pushl N
	pushl TREIN
	pushl %esi
	pushl %edi
	call back
	popl %edi
	popl %esi
	popl %edx	#trein
	popl %ebx	#n
	popl %ecx	#m
	popl %edx	#edx=k
	popl %edx	#sol
	
	movl %eax,SOL
	movl %ebx,N
	movl %ecx,M
	
	popl %edx
	popl %ebx
	popl %ecx
	
	movl SOL,%eax
	cmp $1,%eax
	je final_back
	
	movl %ebx,TREIN
	
	subl $1,%edx
	movl %edx,K
	
	incl %ecx
	jmp for

frecv_max_i:
	incl %ecx
	jmp for
	
nu_este_valid:
	incl %ecx
	jmp for


final_back:

	popl %ebx
	popl %esi
	popl %edi
	popl %ebp
	ret



valid:
	pushl %ebp
	
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ebx	#Kv=k
	movl %ebx,Kv
	
//%esp:(%ebx)(%esi)%ebp:(%ebp v)(<adr de in>)(K)(M)(%esi)(%ecx)
	
	movl 12(%ebp),%ebx
	movl %ebx,Mv
	pushl %esi
	movl 16(%ebp),%esi   #esi=p1
	movl 20(%ebp),%ecx
	 
	movl $1,%eax        #eax=1
	
	
	cmp $1,Kv
	je prima_poz
	
	//k!=1
	movl Kv,%ebx
	subl Mv,%ebx         #ebx=k-m
	cmp $0,%ebx
	jg mai_mare_ca_0
	
	// k-m<=0

	movl Kv,%ebx
	subl $1,%ebx #j=k-1
	
for_unu:
	
	cmp $1,%ebx
	jl final_valid
	
	movl (%esi,%ebx,4),%edx
	cmp %edx,%ecx
	je zero
	
	subl $1,%ebx
	jmp for_unu
	

mai_mare_ca_0:
	#j=ebx=kv-mv

for_doi:

	cmp Kv,%ebx
	je final_valid
	
	movl (%esi,%ebx,4),%edx
	cmp %edx,%ecx
	je zero
	
	incl %ebx
	jmp for_doi

zero:
	movl $0,%eax
	jmp final_valid	
		
prima_poz:

	movl $1,%eax
	
final_valid:
	
	popl %ebx
	popl %esi
	popl %ebp

	ret
	
	

solutie:
	
	pushl %ebp
	movl %esp,%ebp
	
//%esp:(%ebx)(%esi)(%edi)%ebp:(%ebp v)(<adr de in>)(%edi)(N)(M)(%esi)(TREIN)
	
	pushl %edi
	movl 8(%ebp),%edi
	
	pushl %ebx
	
	movl 12(%ebp),%ebx
	movl %ebx,Ns
	
	movl 16(%ebp),%ebx
	movl %ebx,Ms
	
	pushl %esi
	movl 20(%ebp),%esi
	
	movl 24(%ebp),%ebx
	movl %ebx,TREINs   
	
	movl $1,%ecx 		#j=1
	movl $1,%eax 		#eax=1
for_frecv:

	cmp Ns,%ecx
	je eticheta
	
	movl (%edi,%ecx,4),%ebx  #ebx=fr[j]
	cmp $3,%ebx
	jne zero_sol
	
	incl %ecx
	jmp for_frecv
	
//repetari
eticheta:
	movl $1,%ecx     #ecx=l=1
	
for_l:
	cmp TREINs,%ecx
	je final_sol
	movl $1,%edx	#edx=j=1
	for_j:
		cmp Ms,%edx
		jg continuare_for_l
		
		movl %ecx,l
		movl %edx,j

		movl %ecx,%edx
		addl j,%edx  		#edx=j+l
		
		cmp TREINs,%edx
		jge caz2
		
		//l+j<=3*n
		pushl %eax
		
		movl (%esi,%edx,4),%ecx  #ecx=p1[l+j]
		movl l,%eax
		movl (%esi,%eax,4),%ebx
		
		popl %eax
		
		cmp %ebx,%ecx
		je zero_sol
		
		
		movl j,%edx
		movl l,%ecx
		
	caz2:
		
		//l-j>0
		movl %edx,j
		movl %ecx,l

		movl %ecx,%edx
		subl j,%edx  		#edx=l-j
		
		cmp $0,%edx
		jle continuare_for_j	
		
		//l-j>0
		
		pushl %eax
		
		movl (%esi,%edx,4),%ecx
		movl l,%eax
		movl (%esi,%eax,4),%ebx
		
		popl %eax
		
		cmp %ebx,%ecx
		je zero_sol
		
		jmp continuare_for_j
		
continuare_for_j:

	movl j,%edx
	movl l,%ecx
	incl %edx
	jmp for_j
			
continuare_for_l:
	incl %ecx
	jmp for_l
	
zero_sol:
	movl $0,%eax
	jmp final_sol
	
final_sol:
	popl %esi
	popl %ebx
	popl %edi
	popl %ebp
	ret
	
	
//0xf7f0f27d
//0xf7f0f2a0  __sigismember
//0xf7f0f2d0  __sigaddset

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
	
	//movl %eax,res
et:	
	pushl %eax
	call atoi
	popl %ebx
	
	movl %eax,n
	
	pushl $delim
	pushl $0
	call strtok 
	popl %ebx
	popl %ebx

	//movl %eax,res
	
	pushl %eax
	call atoi
	popl %ebx
	
	movl %eax,m
	
	movl m,%eax
	movl n, %ebx
	
	cmp %ebx,%eax
	jge nu_exista
	cmp $1,%ebx
	jl nu_exista
	cmp $1,%eax
	jl nu_exista
	cmp $30,%eax
	jg nu_exista
	cmp $30,%ebx
	jg nu_exista

et2:
	//3*n
	xorl %edx,%edx
	movl n,%eax
	movl $3,%ebx
	mull %ebx
	
	movl %eax,trein
	incl trein
	
//incepe pt permutarea p1

	movl $1,%ecx
	

for_vector:
	cmp %ecx,trein
	je final_vector
	
	pushl %ecx
	
	pushl $delim
	pushl $0
	call strtok 
	popl %ebx
	popl %ebx
	
	//movl %eax,res
	
	//cmp $0, %eax
	/je final_vector

	pushl %eax
	call atoi
	popl %ebx
	
	popl %ecx
	lea p1,%edi
	lea fr,%esi
	
	cmp $0,%eax
	je elem_nul
	 
	movl %eax, (%edi,%ecx,4)  
	
	movl (%esi,%eax,4),%ebx  
	//ebx= fr[p1[i]]
	
	incl %ebx
	
	movl %ebx,(%esi,%eax,4)
	
	cmp $4,%ebx
	je nu_exista
	incl %ecx

	jmp for_vector

elem_nul:
	movl %eax, (%edi,%ecx,4)   
	incl %ecx

	jmp for_vector
		
//3 1 1 0 0 0 0 1 0 0 3	
final_vector:	
et3:



	movl $1,k
	movl $1,%eax
	
	movl n,%ecx
	movl m,%edx
	movl trein,%ebx
	incl n
	pushl %ebx
	pushl %ecx
	pushl %edx
	
	
	pushl sol
	pushl k
	pushl m
	pushl n
	pushl trein
	pushl $p1
	pushl $fr
	call back
	popl %ebx
	popl %ebx
	popl %ebx
	popl %ebx
	popl %ebx
	popl %ebx
	popl %ebx

	popl %edx
	popl %ecx
	popl %ebx
	
	movl %edx,m
	movl %ecx,n
	movl %ebx,trein
	
	// if(solutie(fr,n,m,P1)==0 || afisat==0)

        //        cout<<"nu s a gasit sol  "<<-1;

	movl SOL,%eax
	cmp $0,%eax
	je nu_exista
	
	//exista sol
	//eax=1

afisare:
	lea p1,%esi
	movl $1,%ecx
	
for_afisare:
	cmp trein,%ecx
	je exit
	movl (%esi,%ecx,4),%ebx
	
	pushl %ecx
	
	pushl %ebx
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	incl %ecx
	jmp for_afisare
	

nu_exista:
	pushl $minusUNU
	pushl $formatPrintN
	call printf
	popl %ebx
	popl %ebx
	jmp exit_2

exit:
	pushl $newline
	pushl $format
	call printf
	popl %ebx
	popl %ebx
exit_2:
	pushl $0
	call fflush
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

