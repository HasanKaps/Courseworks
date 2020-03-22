# fibonnacci numbers
	.text
main:	li $s1,0
	li $s2,1
        li $s4, 1
loop:   bgt  $s4,10 end
        addu  $s3, $s2, $s1
        move $s1,$s2
        move $s2,$s3
        move $a0, $s3 # print current value 
        add $s4, $s4, 1
        li $v0,1
        syscall
        la $a0, nl
        la $v0,4
        syscall
        j loop
end:
        li $v0,10
        syscall
       .data
nl:      .asciiz "\n"

	
