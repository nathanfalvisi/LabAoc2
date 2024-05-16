.data
msg: .asciiz "Fatorial de 10 = "

.text
.globl main

main:
    li $t0, 1
    li $s1, 1

    j fatorial

fatorial:
    beq $t0, 11, fim
    mult $s1, $t0
    mflo $s1

    addi $t0, $t0, 1
    j fatorial

fim:	
    la $a0, msg
    li $v0, 4
    syscall
	
    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 10
    syscall