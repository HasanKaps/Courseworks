.data 
		message:  .ascii "Hello, My name is Hasan"
		
.text 

		
		main:
		move  $t0, $zero
		loop:
		bge $t0,  $, end
		move $a0, $t0
		li $v0, 1
		syscall 
		j loop 
		end:
		la $a0, message 
		li $v0, 4 
		syscall 
		addi $t0, $t0, 1
		
		
		li $v0, 10
		syscall 