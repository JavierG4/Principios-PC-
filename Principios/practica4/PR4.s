# Autor: 
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


    print_vec_fin:

    Change_elto: #Modificar un elemento concreto de un vector y coge 3 parametros
    # Primer Parametro de entrada: el primer parámetro es la dirección base del vecto
    # Segundo Parametro de entrada:el índice del elemento que queremos modificar
    # Tercer Parametro de entrada: un flotante de simple precisión


    FinChange_elto:

    Swap: #intercambiar dos elementos de un vector y recibe tres parametros de entrada
    # Primer Parametro de entrada: el primer parámetro es la dirección base del vecto
    # Segundo Parametro de entrada: el índice del primer elemento que queremos intercambiar
    # Tercer Parametro de entrada: el índice del segundo elemento que queremos intercambiar


    FinSwap:

    Mirror: #invertir los elementos de un vector
    # Primer argmento: la dirección de memoria del vector
    # Segundo argumento: el número de elementos del vector


    FinMirror:

    Mult_add:#Realizar la operación de multiplicar los dos primeros argumentos
             # y sumarle el tercer argumento, devolviendo este valor como resultado de la subrutina
    #Primer argumento: numero a multiplicar con el segundo
    #Segundo argumento: numero a multiplicar con el primero
    #Tercer argumento: numero a sumar con la multiplicacion de los dos primeros


    FinMult_add:

    Prod_esc: 
    #Primer argumento: es la dirección de memoria del primer vector
    #Segundo argumento: la dirección de memoria del segundo vector
    #Tercer argumento: es el número de elementos de cada vector, supone el programa que tien la misma direccion el rpograma principal es el que hace la comprobacion 

    FinProd_esc:



main:
Menu:
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
    beq $t3, $t8, diagonal_max_min            # Jump a opcion 4
    beqz $t3, fin_programa                    # Jump a opcion 0

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