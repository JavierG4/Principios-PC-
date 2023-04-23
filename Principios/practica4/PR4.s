# Autor: Javier Gonzalez Brito
# Fecha ultima modificacion: 

size = 4     # bytes que ocupa cada elemento
maxdim = 40  # dimension maxima que puede tener un vector
    .data
v1:         .space 160
v2:         .space 160 
n1:         .word 0 # numero eltos vector 1. Inicialmente suponemos vacios
n2:         .word 0 # numero eltos vector 2. Inicialmente suponemos vacios
space:      .asciiz " "
newline:    .asciiz "\n"
title:      .asciiz "\nPractica 4 de Principios de Computadores. Subrutinas.\n"
menu:       .ascii  "\n(1) Cambiar dimension de un vector\n(2) Cambiar un elemento de un vector\n"
            .ascii  "(3) Invertir un vector\n(4) Calcular el producto escalar de dos vectores\n"
            .asciiz "(0) Salir\n\nElija opcion: ";
cabvec:     .asciiz "\nVector con dimension "
error_op:   .asciiz "\nError: opcion incorrecta.\n"
elige_vec:  .asciiz "\nElija vector para realizar la operacion (1) para v1 (2) para v2: "
elige_elto: .asciiz "\nElija el indice del elemento a cambiar: "
newval:     .asciiz "\nIntroduce nuevo valor para el elemento elegido: "
newdim:     .asciiz "\nIntroduzca nueva dimension para el vector (1-40): "
error_dim:  .asciiz "\nError: Dimension incorrecta.\n"
error_ind:  .asciiz "\nError: Indice incorrecto.\n"
error_d_dim:    .asciiz "\nError: Los vectores tienen distinta dimension.\n"
msg_prodesc:    .asciiz "\nEl producto escalar de los vectores es: "
msg_fin:    .asciiz "\nFIN DEL PROGRAMA."


    .text
#s0 -> direccion1
#s1 -> direccion2
#s2 -> dim1
#s3 -> dim2


#l.s -> lw
#s.s -> sw

    
#LLamada a las funciones
#Funciones disponibles :
#Print_vec
#Change_elto
#Swap
#Mirror
#Mult_add
#Prod_esc
    print_vec: # Funcion que te imprime en pantalla el vector y coge 3 parametros de entrada
    # Primer Parametro de entrada:  la dirección base del vector a imprimir
    # Segundo Parametro de entrada: el número de elementos que tiene el vector
    # Tercer Parametro de entrada: será la dirección de memoria de una cadena que sirva como separador al imprimir los elementos del vecto
        add $sp $sp -24
        sw $ra, 20($sp)
        sw $s3, 16($sp)
        sw $s4, 12($sp)
        sw $s5, 8($sp)
        sw $s6, 4($sp)
        sw $s7, 0($sp)
        move $s4, $a0
        move $s6, $a1
        move $s3, $a2        
        li $s7, 0
        for21:
            mul $s5, $s7, 4
            addu $s5, $s4, $s5
            l.s $f12, 0($s5)

            li $v0, 2
            syscall

            li $v0, 4
            move $a0, $s3
            syscall
            
            addi $s7, 1
            blt $s7, $s6, for21
        for21fin:
        lw $s7, 0($sp)
        lw $s6, 4($sp)
        lw $s5, 8($sp)
        lw $s4, 12($sp)
        lw $s3, 16($sp)
        lw $ra, 20($sp)
        add $sp $sp 24
        jr $ra
    print_vec_fin:

    Change_elto: #Modificar un elemento concreto de un vector y coge 3 parametros
    # Primer Parametro de entrada: el primer parámetro es la dirección base del vecto
    # Segundo Parametro de entrada:el índice del elemento que queremos modificar
    # Tercer Parametro de entrada: un flotante de simple precisión
        move $t0, $a0
        move $t1, $a1
        move $t2, $a2

    FinChange_elto:

    Swap: #intercambiar dos elementos de un vector y recibe tres parametros de entrada
    # Primer Parametro de entrada: el primer parámetro es la dirección base del vecto
    # Segundo Parametro de entrada: el índice del primer elemento que queremos intercambiar
    # Tercer Parametro de entrada: el índice del segundo elemento que queremos intercambiar
        move $t0, $a0
        move $t1, $a1
        move $t2, $a2

    FinSwap:

    Mirror: #invertir los elementos de un vector
    # Primer argmento: la dirección de memoria del vector
    # Segundo argumento: el número de elementos del vector
        move $t0, $a0
        move $t1, $a1

    FinMirror:

    Mult_add:#Realizar la operación de multiplicar los dos primeros argumentos
             # y sumarle el tercer argumento, devolviendo este valor como resultado de la subrutina
    #Primer argumento: numero a multiplicar con el segundo
    #Segundo argumento: numero a multiplicar con el primero
    #Tercer argumento: numero a sumar con la multiplicacion de los dos primeros
        move $t0, $a0
        move $t1, $a1
        move $t2, $a2

    FinMult_add:

    Prod_esc: 
    #Primer argumento: es la dirección de memoria del primer vector
    #Segundo argumento: la dirección de memoria del segundo vector
    #Tercer argumento: es el número de elementos de cada vector, supone el programa que tien la misma direccion el rpograma principal es el que hace la comprobacion 
        move $t0, $a0
        move $t1, $a1
        move $t2, $a2
    FinProd_esc:



main:
    la $s0, v1
    la $s1, v2
    li $s2, 0
    li $s3, 0
    li $t1, 0 # Multiplicar el size
    li.s $f4, 10.0
    li.s $f8, 1.0
    li $t8, 4
    for1:
        mul $t0, $t8, $t1
        addu $t2, $s0, $t0
        s.s $f4, 0($t2)
        add.s $f4, $f4, $f8
        addi $t1, $t1, 1
        addi $s2, $s2, 1
        blt $t1, 40, for1
    forfin:
    li.s $f4, 40.0
    li $t1, 0
    li.s $f8, -1.0
    for2:
        mul $t0, $t8, $t1
        addu $t9, $s1, $t0
        s.s $f4, 0($t9)
        add.s $f4, $f4, $f8
        addi $t1, $t1, 1
        addi $s3, $s3, 1
        blt $t1, 40, for2
    for2fin:
    li $v0, 4
    la $a0, title
    syscall
Menu:
# Imprimo en pantalla el vector v1
    li $v0, 4
    la $a0, cabvec
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    li $v0, 4
    la $a0, newline
    syscall

#Llamo a la funcion print
    move $a0, $s0
    move $a1 ,$s2
    la $a2, space
    jal print_vec
#Imprimo una nueva linea
    li $v0, 4
    la $a0, newline
    syscall
# Imprimo en pantalla el vector v2
    li $v0, 4
    la $a0, cabvec
    syscall
    li $v0, 1
    move $a0, $s3
    syscall
    li $v0, 4
    la $a0, newline
    syscall
#Llamo a la funcion print
    move $a0, $s1
    move $a1 ,$s3
    la $a2, space
    jal print_vec
#Imprimo una nueva linea
    li $v0, 4
    la $a0, newline
    syscall

    li $s5,1 # Cargo las opciones
    li $s6,2
    li $s7,3
    li $t8,4
    li $v0, 4
    la $a0, menu
    syscall
    li $v0, 5
    syscall
    move $t3, $v0

    beq $t3, $s5, cambiar_dim                 # Jump a opcion 1
    beq $t3, $s6, cambiar_elem           # Jump a opcion 2
    #beq $t3, $s7, invertir_vec                   # Jump a opcion 3
    #beq $t3, $t8, diagonal_max_min            # Jump a opcion 4
    beqz $t3, fin_programa                    # Jump a opcion 0
    b erroropincorrecta

cambiar_dim:
    li $v0, 4
    la $a0, elige_vec
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
#if (eleccion <= 0)
    blez $t0, erroropincorrecta
#if (eleccion > 2)
    li $t8, 2
    bgt $t0, $t8, erroropincorrecta

    li $v0, 4
    la $a0, newdim
    syscall
    li $v0, 5
    syscall
    move $t1, $v0
#if (dim <= 0)
    blez $t1, errordim
#if ( dim > 40)
    bgt $t1, 40, errordim
    li $t7, 1
# (if eleccion != 2) Es decir opcion 1
    if1: beq $t0, $t8, if2
        move $s2, $t1
        b Menu
    if1fin:
    if2:
        move $s3, $t1
    if2fin:
b Menu
cambiar_dimfin:

cambiar_elem:
    li $v0, 4
    la $a0, elige_vec
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
#if (eleccion <= 0)
    blez $t0, erroropincorrecta
#if (eleccion > 2)
    li $t8, 2
    bgt $t0, $t8, erroropincorrecta

    li $v0,4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, elige_elto
    syscall
    
cambiar_elemfin:



# errores
errordim:
    li $v0, 4
    la $a0, error_dim
    syscall
    b Menu
errorind:
    li $v0, 4
    la $a0, error_ind
    syscall
    b Menu
erroropincorrecta:
    li $v0, 4
    la $a0, error_op
    syscall
    b Menu
errorddim:
    li $v0, 4
    la $a0, error_d_dim
    syscall
    b Menu

#fin del programa
fin_programa:
    li $v0, 4
    la $a0, msg_fin
    syscall
    li $v0, 10
    syscall