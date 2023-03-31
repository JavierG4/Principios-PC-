.data
strTitulo:	.asciiz	"\nDistancia doubles\n"
strPrimer:	.asciiz	"\nPrimer número: "
strSegundo:	.asciiz	"Segundo número: "
strMayor:	.asciiz	"\nMayor distancia: "
strNumero1:	.asciiz	"\nNumero 1: "
strNumero2:	.asciiz	"\nNumero 2: "
strTermina:	.asciiz	"\n\nTermina el programa\n"

		.text

# registros
#f4 numero1
#f6 numero2
#f8 0
#f20 maxDistancia
#f22 pareja1
#f24 pareja2
#f26 distancia

main:
    li $v0, 4
    la $a0, strTitulo
    syscall

    li.d $f20, -1.0
    do1:
#Primer número
    li $v0, 4
    la $a0, strPrimer
    syscall
    li $v0, 7
    syscall
    mov.d $f4, $f0
#Segundo numero
    li $v0, 4
    la $a0, strSegundo
    syscall
    li $v0, 7
    syscall
    mov.d $f6, $f0
#Calculo distancia
    sub.d $f26, $f4, $f6
    abs.d $f26, $f26
    if: c.le.d $f26, $f20
        bc1f finif

        mov.d $f20, $f26
        mov.d $f22, $f4
        mov.d $f24, $f6
    finif:
    li.d $f8, 0.0
    while: c.le.d $f26, $f8
    bc1f do1
    do1_fin:
    li $v0, 4
    la $a0, strMayor
    syscall
    li $v0, 3
    mov.d $f12, $f20
    syscall

    li $v0, 4
    la $a0, strNumero1
    syscall
    li $v0, 3
    mov.d $f12, $f22
    syscall

    li $v0, 4
    la $a0, strNumero2
    syscall
    li $v0, 3
    mov.d $f12, $f24
    syscall

    li $v0, 4
    la $a0, strTermina
    syscall
    li $v0, 10
    syscall

