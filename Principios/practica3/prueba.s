# Esqueleto PR3

maximoElementos=400 # numero de enteros maximo reservado para la matriz 1600 bytes
size=4 # bytes que ocupa un entero
    .data
mat:   .word   100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119
       .word   120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139
       .word   140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159
       .word   160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179
       .word   180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199
       .word   200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219
       .word   220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239
       .word   240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259
       .word   260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279
       .word   280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299
       .word   300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319
       .word   320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339
       .word   340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359
       .word   360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379
       .word   380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399
       .word   400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419
       .word   420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439
       .word   440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459
       .word   460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479
       .word   480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499
       

nfil:   .word   20 # nuemro de filas de la matriz
ncol:   .word   10 # numero de columnas de la matriz

titulo:     .asciiz "\nPráctica PR3 de Principios de Computadores. Manejo de Matrices.\n"
msg_matriz: .asciiz "\nLa matriz es "
msg_x:      .asciiz "x"
separador:  .asciiz "  " # separador entre numeros
newline:    .asciiz "\n"
menu:       .ascii  "\n(1) Cambiar dimensiones\n(2) Intercambiar dos elemento\n"
            .ascii  "(3) Suma elementos del perimetro\n(4) Calcula max y min de la diagonal\n"
            .asciiz "(0) Salir\n\nElija opcion: "

error_op:   .asciiz "\nError: opcion incorrecta.\n"
msg_nfilas: .asciiz "Introduzca numero de filas: "
msg_ncols:  .asciiz "Introduzca numero de columnas: "
error_nfilas:   .asciiz "\nError: dimension incorrecta. Numero de fila incorrecto.\n"
error_ncols:    .asciiz "\nError: dimension incorrecta. Numero de columna incorrecto.\n"
error_dime:     .asciiz "\nError: dimension incorrecta. Excede el maximo numero de elementos (400).\n"
msg_i:      .asciiz "Introduzca fila del primer elemento a cambiar: "
msg_j:      .asciiz "Introduzca columna del primer elemento a cambiar: "
msg_r:      .asciiz "Introduzca fila del segundo elemento a cambiar: "
msg_s:      .asciiz "Introduzca columna del segundo elemento a cambiar: "
msg_suma:   .asciiz "\n\nSuma de los elementos del perímetro: "
msg_max:    .asciiz "\nEl máximo de la diagonal principal es "
msg_min:    .asciiz " y el mínimo "
msg_fin:    .asciiz "\nFin del programa.\n"
    .text
# mat -> $s0
# nfil -> $s1
# ncol -> $s2
# size -> $s3
# MaximoElemento -> $s4
#Opcion 1 -> $s5
#Opcion 2 -> $s6
#Opcion 3 -> $s7
#Opcion 4 -> $t8



main:
    la $s0, mat    #Cargo la dirección de inicio en del vector
    li $s1,20   #Meto el valor de las filas
    li $s2,10   # Meto el valor de las columnas
    li $s3,4   # Meto el valor que ocupa cada valor de la mat
    li $s4,20 # meto el valor de max elementos

# Titulo del programa
    li $v0, 4
    la $a0, titulo
    syscall
#std::cout << "\nLa matriz es " << nfil << "x" << ncol << "\n";
Mostar_matriz:
    li $v0, 4
    la $a0, msg_matriz
    syscall 
    li $v0, 1
    move $a0, $s1
    syscall
    li $v0, 4
    la $a0, msg_x
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    li $v0, 4
    la $a0, newline
    syscall
Menu:
# for ( int f = 0; f < nfil; f++) {
    li $t0, 0
    for1:
# for (int c = 0; c < ncol; c++ ) {
        li $t1, 0
        for2:
            mul $t2, $t0, $s2 #[f*ncol+c] 
            mul $t2, $s3, $t2 # [f*ncol+c] * size 
            mul $t4, $t1, $s3
            add $t2, $t4, $t2 # [f*ncol+c] = $t2

            addu $t2, $s0, $t2 # Contiene la dirección
            lw $t2, 0($t2)
# std::cout << mat[f*ncol+c] << "  "; // equivalente a acceso `mat[f][c]`
            li $v0, 1
            move $a0, $t2
            syscall
            li $v0, 4
            la $a0, separador
            syscall
            addi $t1, 1
            blt $t1, $s2, for2
        for2fin:
#std::cout << "\n";
        li $v0, 4
        la $a0, newline
        syscall 
        addi $t0, 1
        blt $t0, $s1, for1
    for1fin:
    
# Inicio del Menu
#std::cout << "(1) Cambiar dimensiones" << std::endl;
#std::cout << "(2) Intercambiar dos elementos" << std::endl;
#std::cout << "(3) Suma elementos del perímetro" << std::endl;
#std::cout << "(4) Calcula máximo y mínimo de la diagonal principal" << std::endl;
#std::cout << "(0) Salir" << std::endl;
    Menu1:
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
    beq $t3, $s6, intercambiar_elem           # Jump a opcion 2
    beq $t3, $s7, sumperi                    # Jump a opcion 3
    #beq $t3, $t8, diagonal_max_min            # Jump a opcion 4
    beqz $t3, fin_programa                    # Jump a opcion 0
     
errorop:
    li $v0, 4
    la $a0, error_op
    syscall
    b Menu1
finerror_op:

errorfila:
    li $v0, 4
    la $a0, error_nfilas
    syscall
    b Menu
finerrorfila:   

errorcolumnas:
    li $v0, 4
    la $a0, error_ncols
    syscall
    b Menu
finerrorcolumnas:

errordim:
    li $v0, 4
    la $a0, error_dime
    syscall
    b Mostar_matriz
finerrordim:

#(1) Cambiar dimensiones
    cambiar_dim:
#std::cout << "Introduzca el número de filas ";
    li $v0, 4
    la $a0, msg_nfilas
    syscall
#std::cin >> filas;
    li $v0, 5
    syscall
    move $s1, $v0
#if (filas < 0)
    blez $s1, errorfila
#std::cout << "Introduzca el número de columnas ";
    li $v0, 4
    la $a0, msg_ncols
    syscall
# std::cin >> columnas;
    li $v0, 5
    syscall
    move $s2, $v0
#if (col < 0)
    blez $s2, errorcolumnas
#if( filas*col > 400)
    li $t1, 400 #max elementos
    mul $t0, $s1, $s2
    bgt $t0, $t1, errordim 
#La matriz es nfilx ncol
    li $v0, 4
    la $a0, msg_matriz
    syscall
    li $v0, 1
    move $a0, $s1 
    syscall
    li $v0, 4
    la $a0, msg_x
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    li $v0, 4
    la $a0, newline
    syscall
# for ( int f = 0; f < nfil; f++) {
    li $t0, 0
    for11:
# for (int c = 0; c < ncol; c++ ) {
        li $t1, 0
        for22:
            mul $t2, $t0, $s2 #[f*ncol+c] 
            mul $t2, $s3, $t2 # [f*ncol+c] * size 
            mul $t4, $t1, $s3
            add $t2, $t4, $t2 # [f*ncol+c] = $t2

            addu $t2, $s0, $t2 # Contiene la dirección
            lw $t2, 0($t2)
# std::cout << mat[f*ncol+c] << "  "; // equivalente a acceso `mat[f][c]`
            li $v0, 1
            move $a0, $t2
            syscall
            li $v0, 4
            la $a0, separador
            syscall
            addi $t1, 1
            blt $t1, $s2, for22
        for22fin:
#std::cout << "\n";
        li $v0, 4
        la $a0, newline
        syscall 
        addi $t0, 1
        blt $t0, $s1, for11
    for11fin:
    b Menu1
    fincambiar_dim:

#(2) Intercambiar dos elementos
    intercambiar_elem:
#std::cout << "Introduzca la fila del primer elemeneto a cambiar ";
    li $v0, 4
    la $a0, msg_i
    syscall
#std::cin >> fil1 ;
    li $v0, 5
    syscall
    move $t0, $v0
#std::cout << "\n";
    li $v0, 4
    la $a0, newline
    syscall
#if (filas < 0)
    #blez $t2, errorfila
#std::cout << "Introduzca la columna del primer elemeneto a cambiar ";
    li $v0, 4
    la $a0, msg_j
    syscall
#std::cin >> col1 ;
    li $v0, 5
    syscall
    move $t1, $v0
#std::cout << "\n";
    li $v0, 4
    la $a0, newline
    syscall
#if (col < 0)
    #blez $t1, errorcolumnas
#std::cout << "Introduzca la fila del segundo elemeneto a cambiar ";
    li $v0, 4
    la $a0, msg_r
    syscall
#std::cin >> fil2 ;
    li $v0, 5
    syscall
    move $t2, $v0
#std::cout << "\n";
    li $v0, 4
    la $a0, newline
    syscall 
#if (filas < 0)
    #blez $t2, errorfila
#std::cout << "Introduzca la columna del segundo elemeneto a cambiar ";
    li $v0, 4
    la $a0, msg_s
    syscall
#std::cin >> col2;
    li $v0, 5
    syscall
    move $t3, $v0
#std::cout << "\n";
    li $v0, 4
    la $a0, newline
    syscall 
#if (col < 0)
    #blez $t3, errorcolumnas
#int aux1 = mat[fil1*columnas+col1]; *size
#int aux2 = mat[fil2*columnas+col2];
    li $t4, 0
    li $t5, 0
    mul $t4, $s3, $t0
    mul $t4, $t4, $s2
    mul $t6, $t1, $s3
    add $t4, $t4, $t6
    addu $t4, $t4, $s0
    lw $k0, 0($t4)

    mul $t5, $s3, $t2
    mul $t5, $s2, $t5
    mul $t7, $t3, $s3
    add $t5, $t5, $t7
    addu $t5, $t5, $s0
    lw $k1, 0($t5)

   sw $k0,0($t5)
   sw $k1,0($t4)

    b Mostar_matriz
    finintercambiar_elem:
    #(3) Suma elementos del perímetro
    sumperi:
        li $t0, 0
        li $t1, 0
        addi $t3, $s1, -1
        addi $t4, $s2, -1
    forfilas:
        li $t2, 0
    forcolumnas:
        mul $t5, $t1, $s2
        mul $t5, $t5, $s3  # $s3 -> size
        mul $t6, $s3, $t2
        add $t5, $t5, $t6
# COnver a la direc
        addu $t7, $t5, $s0
        lw $s5, 0($t7)
# Ahora veo si el num esta en el perim de la matriz y lo añado a $t0
        beq $t1, $zero, addperim
        beq $t2, $zero, addperim
        beq $t1, $t3, addperim
        beq $t2, $t4, addperim
        b noaddperim
    addperim:
        add $t0, $s5, $t0
    noaddperim:
        addi $t2, 1
        blt $t2, $s2, forcolumnas
    finforcolumnas:
        addi $t1,1
        blt $t1, $s1, forfilas
    finforfilas:
    li $v0, 4
    la $a0, msg_suma
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    b Mostar_matriz
    finsum_peri:




    fin_programa:
#std::cout << "\nFin del programa\n";
	li $v0, 4
	la $a0, msg_fin
	syscall
    
	li $v0,10
    syscall