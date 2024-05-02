.data
mensagem: .asciiz "Selecione opcao - [1 para soma, 2 para subtacao, 3 para multiplicacao e 4 para divisao]\n\0"
.text
.globl main
main:  
	la $a0, mensagem
	li $v0, 4
	syscall
    li $v0, 5
    li $t1, 0
    syscall #syscall
    
loop:
    addi $t1, $t1, 1
    beq $t1, $v0, sum
    addi $t1, $t1, 1
    beq $t1, $v0, subt
    addi $t1, $t1, 1
    beq $t1, $v0, multp
    addi $t1, $t1, 1
    beq $t1, $v0, divd
    j fim
    
sum:
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 5
	syscall
	move $t2, $v0
	add $a0, $t1, $t2
	li $v0, 1
	syscall
	j fim
	
subt:
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 5
	syscall
	move $t2, $v0
	sub $a0, $t1, $t2
	li $v0, 1
	syscall
	j fim

multp:
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 5
	syscall
	move $t2, $v0
	mult  $t1, $t2
	mflo $a0
	li $v0, 1
	syscall
	j fim
	
divd:
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 5
	syscall
	move $t2, $v0
	div $a0, $t1, $t2
	li $v0, 1
	syscall
    j fim          
fim:  
    li $v0, 10             # Encerra o programa
    syscall