.data
    msgx: .asciiz "Valor de x: "
    msge: .asciiz "Valor de expoencia: "
    msgr: .asciiz "Resultado: "

.text
.globl main

main:
    li $v0, 4
    la $a0, msgx
    syscall

    li $v0, 5
    syscall
    move $s0, $v0


    li $v0, 4
    la $a0, msge
    syscall


    li $v0, 5
    syscall
    move $s1, $v0


    sllv $t0, $s0, $s1


    li $v0, 4
    la $a0, msgr
    syscall


    move $a0, $t0
    li $v0, 1
    syscall

    # Fim
    li $v0, 10             
    syscall