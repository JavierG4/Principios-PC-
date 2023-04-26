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
    # Coloco los registros en la pila y actualizo el stack pointer
        add $sp $sp -24
        sw $ra, 20($sp)
        sw $s3, 16($sp)
        sw $s4, 12($sp)
        sw $s5, 8($sp)
        sw $s6, 4($sp)
        sw $s7, 0($sp)
    # Muevo los parametros de entrada a salvados para que no pierdan al hacer syscall
        move $s4, $a0
        move $s6, $a1
        move $s3, $a2  
    # Int i = 0      
        li $s7, 0
    # Inicializo el for en que imprimo el vector
        for21:
    #Obtengo el desplazamiento
            mul $s5, $s7, 4
            addu $s5, $s4, $s5
    #Obtengo el dato del vector
            l.s $f4, 0($s5)

    # Imprimo el valor por pantalla
            li $v0, 2
            mov.s $f12, $f4
            syscall
    # std::cout << " ";
            li $v0, 4
            move $a0, $s3
            syscall
    # i++
            addi $s7, 1
    #if (i < dim) {
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

    change_elto: #Modificar un elemento concreto de un vector y coge 3 parametros
    # Primer Parametro de entrada: el primer parámetro es la dirección base del vecto
    # Segundo Parametro de entrada:el índice del elemento que queremos modificar
    # Tercer Parametro de entrada: un flotante de simple precisión
        add $sp $sp -20
        sw $ra, 16($sp)
        sw $s6, 12($sp)
        sw $s5, 8($sp)
        sw $s4, 4($sp)
        s.s $f20, 0($sp)
#Cambio de valor dentro del vector
        move $s5, $a0
        move $s4, $a1
        mov.s $f20, $f12
        mul $s6, $s4, 4
        addu $s6, $s6, $s5
        s.s $f20, 0($s6)

        l.s $f20, 0($sp)
        lw $s4, 4($sp)
        lw $s5, 8($sp)
        lw $s6, 12($sp)
        lw $ra, 16($sp)
        add $sp $sp 20 #liberar memoria
        jr $ra
    change_elto_fin:

    swap: #intercambiar dos elementos de un vector y recibe tres parametros de entrada
    # Primer Parametro de entrada: el primer parámetro es la dirección base del vecto
    # Segundo Parametro de entrada: el índice del primer elemento que queremos intercambiar
    # Tercer Parametro de entrada: el índice del segundo elemento que queremos intercambiar
    #Muevo los parametros a 3 temporales para hacer el intercambio
        move $t0, $a0
        move $t1, $a1
        move $t2, $a2
    # Obetengo los desplazamientos de memoria
        mul $t3, $t1, 4
        mul $t4, $t2, 4
    # Añado el desplazamiento a la dirección de los vectores
        addu $t3, $t3, $t0
        addu $t4, $t4, $t0
    #Cargo los valores con esas direcciones en dos registros
        l.s $f5, 0($t3)
        l.s $f4, 0($t4)
        s.s $f5,0($t4)
        s.s $f4,0($t3)

        jr $ra
    swap_fin:

    mirror: #invertir los elementos de un vector
    # Primer argmento: la dirección de memoria del vector
    # Segundo argumento: el número de elementos del vector
        add $sp $sp -4
        sw $ra, 0($sp)
# Si es menor o igual que uno salto al final y vuelvo 
        ble $a1, 1, final
        trivial: 
    #E
            add $sp $sp -12
            sw $ra, 8($sp)
            sw $a0, 4($sp)
            sw $a1, 0($sp)
            move $t3, $a1

            move $a0, $a0
            move $a1, $zero
            add $a2, $t3, -1

            jal swap
        #Extraigo los valores elmentos de la pila y actualizo el stack pointer
            lw $a1, 0($sp)
            lw $a0, 4($sp)
            lw $ra, 8($sp)
            add $sp $sp 12 #liberar memoria
        # Le resto dos al argumento1 que es del número de elementos
            addi $a1, -2
        #Avanzo 4 en la dirección de momemoria para poder así poner el indice en 0 para la siguiente
            addi $a0, $a0, 4
        #Salto ala función mirror de nuevo
            jal mirror
        fintrivial:
        #Extraigo el elmento ra y actualizo el stack pointer
        lw $ra, 0($sp)
        add $sp $sp 4
        final:
        jr $ra
    mirror_fin:

    mult_add:#Realizar la operación de multiplicar los dos primeros argumentos
             # y sumarle el tercer argumento, devolviendo este valor como resultado de la subrutina
    #Primer argumento: numero a multiplicar con el segundo
    #Segundo argumento: numero a multiplicar con el primero
    #Tercer argumento: numero a sumar con la multiplicacion de los dos primeros
        mov.s $f4, $f12
        mov.s $f5, $f13
        mov.s $f7, $f14
#Incio del algoritmo de multiplicar los dos primeros y sumar el iultimo
        mul.s $f4, $f4, $f5
        add.s $f4, $f7, $f4
        mov.s $f0, $f4
        jr $ra
    mult_add_fin:

    prod_esc: 
    #Primer argumento: es la dirección de memoria del primer vector
    #Segundo argumento: la dirección de memoria del segundo vector
    #Tercer argumento: es el número de elementos de cada vector, supone el programa que tien la misma direccion el rpograma principal es el que hace la comprobacion 
        li $t3, 0
        li.s $f4, 0.0
        for33:
        # Coloco en la pila los valores que voy a usar y actualizo el stack pointer
           add $sp $sp -20
            sw $ra, 16($sp)
            sw $t3, 12($sp)
            sw $a2, 8($sp)
            sw $a1, 4($sp)
            sw $a0, 0($sp)
        # Cargo los valores del vector1 y 2 y junto a la suma total lamo a la función mult_add
            l.s $f12, 0($a0)
            l.s $f13, 0($a1)
            mov.s $f14, $f4
            jal mult_add
        # Muevo el total al registro f4 de nuevo
            mov.s $f4, $f0
        #Extraigo los elementos de la pila y actualizo el stack pointer
            lw $a0, 0($sp)
            lw $a1, 4($sp)
            lw $a2, 8($sp)
            lw $t3, 12 ($sp)
            lw $ra, 16($sp)
            add $sp $sp 20
        # Avanzo 4 en la direccion de memoria del vector 1 y 2
            addi $a0, $a0, 4
            addi $a1, $a1, 4
        #i++
            addi $t3, $t3, 1
        # if(i < dim){
            blt $t3, $a2, for33
        for33fin:
        mov.s $f0, $f4
        jr $ra
    prod_esc_fin:



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
    beq $t3, $s7, invertir_vec                   # Jump a opcion 3
    beq $t3, $t8, prodesc       # Jump a opcion 4
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
    
    li $v0, 5
    syscall
    move $t1, $v0
    #sub $t1, $t1, 1
    if13: beq $t0, $t8, if23
#if (dim <= 0)
        blez $t1, errorind
#if ( dim > 40)
        bgt $t1, $s2, errorind
        li $v0,4
        la $a0, newval
        syscall
        li $v0, 6
        syscall
        mov.s $f12, $f0
        move $a0, $s0
        move $a1 ,$t1
        jal change_elto
        b Menu
    if13fin:
    if23:
#if (dim <= 0)
        blez $t1, errorind
#if ( dim > 40)
        bgt $t1, $s3, errorind
        li $v0 ,4
        la $a0, newval
        syscall
        li $v0, 6
        syscall
        mov.s $f12, $f0
        move $a0, $s1
        move $a1 ,$t1
        jal change_elto
        b Menu
    if23fin:
cambiar_elemfin:

prodesc:
#(if dim1 != dim2)
    bne $s2, $s3, errorddim
    move $a0, $s0 # Vector 1
    move $a1, $s1 #Vector 2
    move $a2, $s2 # Dim 1
    jal prod_esc
    mov.s $f12, $f0
# std::cout << "El producto escalar es " << total;
    li $v0, 4
    la $a0, msg_prodesc
    syscall
    li $v0, 2
    syscall
    b Menu
prodescfin:

invertir_vec:
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
    if56: beq


    iffin56:
    move $a0, $s0
    move $a0 $s2
    jal mirror
    b Menu
invertir_vecfin:
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