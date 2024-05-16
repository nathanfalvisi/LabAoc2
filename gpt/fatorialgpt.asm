.data
output_msg: .asciiz "O fatorial de 10 é: "
newline:    .asciiz "\n"

.text
.globl main

main:
    # Imprime a mensagem inicial
    la $a0, output_msg   # Carrega o endereço da mensagem
    li $v0, 4            # Código do sistema para imprimir string
    syscall

    # Chama a função fatorial para calcular o fatorial de 10
    li $a0, 10           # Argumento para a função fatorial
    jal fatorial         # Chama a função fatorial
    move $a0, $v0        # Move o resultado para imprimir

    # Imprime o resultado do fatorial
    li $v0, 1            # Código do sistema para imprimir inteiro
    syscall

    # Imprime uma nova linha
    li $v0, 4            # Código do sistema para imprimir string
    la $a0, newline      # Endereço da nova linha
    syscall

    # Encerra o programa
    li $v0, 10           # Código do sistema para encerrar o programa
    syscall

fatorial:
    # Procedimento para calcular o fatorial
    subu $sp, $sp, 8     # Aloca espaço na pilha
    sw $ra, 4($sp)       # Salva o endereço de retorno
    sw $a0, 0($sp)       # Salva o argumento na pilha

    li $v0, 1            # Inicializa o fatorial como 1
    lw $t0, 0($sp)       # Carrega o argumento da pilha
    li $t1, 1            # Inicializa o contador como 1

loop:
    beq $t1, $t0, done  # Verifica se o contador é igual ao argumento
    addi $t1, $t1, 1    # Incrementa o contador
    mul $v0, $v0, $t1   # Multiplica o fatorial pelo contador
    j loop               # Repete o loop

done:
    lw $ra, 4($sp)       # Restaura o endereço de retorno
    addu $sp, $sp, 8     # Libera espaço na pilha
    jr $ra               # Retorna para o chamador
