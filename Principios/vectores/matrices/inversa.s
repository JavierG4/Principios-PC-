n = 10
tam_elto = 4
        .data
vect:   .word   7,2,6,8,1,9,10,3,4,5
        .text
main:
    la $s1, vect    #Cargo la dirección de inicio en del vector
    move $t0, $zero
    lw $t3, 1
    sub $t0, $t3, n
    lw $t2, tam_elto

bucle:  mul $t1, $t0, $t2
        addu $t1, $s1, $t1
        lw $t1, 0($t1)
        li $v0, 5
        move $a0,$t1
        syscall
        sub $t0, $t0, $t3
while: blt  $zero, $t0, bucle

