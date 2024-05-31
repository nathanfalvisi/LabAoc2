.data
.text
.globl main

main:  
	li $a0, 3
	
  	jal start
    
 	move $v0, $a0
  	li $v0, 1
  	syscall 
  	j fim
    
start:
	sll $a0, $a0, 2
	jr $ra
	
end:
	li $v0, 10
  syscall