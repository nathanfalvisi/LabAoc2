.data
.text
.globl main

main:  
  li $a0, 2
  li $a1, 3
	
  jal start
    
  move $v0, $a0
  li $v0, 1
  syscall 
  j end
    
start:
	li $t1, 1
	li $t0, 0
	
loop:
	mult $t1, $a0
	mflo $t1
	addi $t0, $t0, 1
	
	blt $t0, $a1, loop
	move $a0, $t1
	jr $ra
	
end:
	li $v0, 10
  syscall