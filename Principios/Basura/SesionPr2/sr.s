
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
    li.d $f8, 0

    li $v0, 4
    la $a0, strTitulo
    syscall
# double maxDistancia = -1.0;
    li.d $f20, -1.0
    do1:
# Pedir el num 1
        li $v0, 4 
        la $a0, strNumero1
        syscall
        li $v0, 7
        syscall
        mov.d $f4, $f2

# Pedir el num 2
        li $v0, 4 
        la $a0, strNumero2
        syscall
        li $v0, 7
        syscall
        mov.d $f6, $f2

#distancia = fabs(numero1 - numero2);
        sub.d $f8, $f4, $f6
        abs.d $f26, $f8
        if: c.lt.d $f26, $f20
            bc1f ifFin:
            mov.d
            mov.d
            mov.d

        ifFin:
    while: c.le.d $f26, $f8
        bc1f do1
        