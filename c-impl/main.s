	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	peekchar
	.type	peekchar, @function
peekchar:
.LFB24:
	.cfi_startproc
	movq	stdin(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	_IO_getc@PLT
	cmpl	$-1, %eax
	movl	%eax, %ebx
	je	.L1
	movq	stdin(%rip), %rsi
	movl	%eax, %edi
	call	ungetc@PLT
.L1:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	peekchar, .-peekchar
	.p2align 4,,15
	.globl	str_get
	.type	str_get, @function
str_get:
.LFB25:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	stdin(%rip), %rdi
	call	_IO_getc@PLT
	movq	%rbx, %rdi
	movsbl	%al, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	str_push@PLT
	.cfi_endproc
.LFE25:
	.size	str_get, .-str_get
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"IDEN: %s\n"
	.text
	.p2align 4,,15
	.globl	lex_iden
	.type	lex_iden, @function
lex_iden:
.LFB26:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	str_flush@PLT
	leaq	.LC0(%rip), %rdi
	movq	%rax, %rbx
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf@PLT
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE26:
	.size	lex_iden, .-lex_iden
	.section	.rodata.str1.1
.LC1:
	.string	"EQ"
	.text
	.p2align 4,,15
	.globl	lex_eq
	.type	lex_eq, @function
lex_eq:
.LFB27:
	.cfi_startproc
	leaq	.LC1(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE27:
	.size	lex_eq, .-lex_eq
	.section	.rodata.str1.1
.LC2:
	.string	"INT: %s\n"
	.text
	.p2align 4,,15
	.globl	lex_val
	.type	lex_val, @function
lex_val:
.LFB28:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	str_flush@PLT
	leaq	.LC2(%rip), %rdi
	movq	%rax, %rbx
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	printf@PLT
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE28:
	.size	lex_val, .-lex_val
	.section	.rodata.str1.1
.LC3:
	.string	"Hello World"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	.LC1(%rip), %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	str_make@PLT
	movq	%rax, %rbx
	call	peekchar
	cmpl	$-1, %eax
	je	.L35
.L32:
	cmpl	$32, %eax
	je	.L45
	cmpl	$61, %eax
	movq	%rbx, %rdi
	je	.L51
	call	str_get
	call	peekchar
	cmpl	$-1, %eax
	jne	.L32
.L35:
	leaq	.LC3(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L54:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	lex_val
.L45:
	movq	stdin(%rip), %rdi
	call	_IO_getc@PLT
	call	peekchar
	cmpl	$-1, %eax
	jne	.L32
	jmp	.L35
.L51:
	call	lex_iden
	call	peekchar
	cmpl	$-1, %eax
	je	.L35
.L21:
	cmpl	$32, %eax
	je	.L52
.L23:
	cmpl	$61, %eax
	je	.L25
	call	peekchar
	cmpl	$-1, %eax
	je	.L35
	cmpl	$32, %eax
	jne	.L23
.L52:
	movq	stdin(%rip), %rdi
	call	_IO_getc@PLT
	call	peekchar
	cmpl	$-1, %eax
	jne	.L21
	jmp	.L35
.L25:
	movq	stdin(%rip), %rdi
	call	_IO_getc@PLT
	movq	%rbp, %rdi
	call	puts@PLT
	.p2align 4,,10
	.p2align 3
.L49:
	call	peekchar
	cmpl	$-1, %eax
	je	.L42
	cmpl	$32, %eax
	je	.L53
	cmpl	$10, %eax
	je	.L54
	movsbl	%al, %edi
	call	is_digit@PLT
	testl	%eax, %eax
	je	.L49
	movq	%rbx, %rdi
	call	str_get
	jmp	.L49
.L53:
	movq	stdin(%rip), %rdi
	call	_IO_getc@PLT
	jmp	.L49
.L42:
	cmpq	$0, 8(%rbx)
	je	.L35
	movq	%rbx, %rdi
	call	lex_val
	jmp	.L35
	.cfi_endproc
.LFE29:
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
