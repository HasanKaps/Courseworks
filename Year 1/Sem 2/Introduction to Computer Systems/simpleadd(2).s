# simple program to add two numbers
	.text
main:	lw $s1,first
	lw $s2,second # load a word from the data segment
	add $s3,$s1,$s2 # add the registers
	sw $s3,result # store the result
        li $v0,10  # argument for syscall (10 = exit)
        syscall
        .data
first:	.word 5
second:	.word 8
result:	.space 4
