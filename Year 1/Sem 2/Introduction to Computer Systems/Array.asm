# initialise array
	.text
main:	la $t0,array
		la $t0,sum
	li $s2,1
        li $s4,20
loop:   bgt $s2, $s4, end
        sw $s2,0($t0)
	addi $s2, $s2, 1
	addi $t0, $t0, 4
        j loop
end:
        li $v0,10
        syscall
       .data
nl:      .asciiz "\n"
	.word 255 # give a recognisable bit pattern
array:	.space 80
sum:      	.space 80