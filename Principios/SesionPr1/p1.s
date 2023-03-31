# Autor:
# Correo electrónico:
# Fecha: 

##include<iostream>
##include<cmath>

#int main(void) {
#    std::cout << "\n\nAproximación a sen(x) (-1 <= x <= 1) con un error máximo, usando Taylor\n";
#    do {
#    	double x;
#        do {
#        std::cout << "\n\nIntroduzca el valor de x (-1 <= x <= 1): ";
#        std::cin >> x;
#        } while ( (x < -1) || (x > 1));
#        double error;
#        do {
#            std::cout << "\nIntroduzca el error maximo permitido en la aproximación (0 < error < 1) (error <= 0 sale del programa): ";
#            std::cin >> error;
#        } while (error >= 1);
##        if (error <= 0) break;
#        int n = 0; // iteraciones
#        double numerador = x; // primer numerador del termino para n=0
#        int denominador = 1; // primer denominador del termino para n=0
#        int signo = 1;
#        double sen_x = x; // primer termino
#        double xx = x*x; // el numerador siempre se multiplica por x^2 
#        double error_calculado;
#        do {
#            double old_senx = sen_x;
#            n++; // incremento el termino
#            signo = -signo; // el signo se alterna
#            numerador *= xx; 
#            denominador = (2*n+1) * 2*n * denominador;
#            double termino = signo * numerador / denominador; // ultimo termino
#            sen_x += termino;
#            error_calculado = fabs((sen_x - old_senx) / sen_x);
#        } while (error_calculado >= error);
#        std::cout << "\n\n\nsen(x) calculado: " << sen_x;
#        std::cout << "\nerror calculado: " << error_calculado;
#        std::cout << "\nnumero de iteraciones calculadas: " << n;
#    } while (true);
#    std::cout << "\nFin del programa\n";
#    return 0;
#}

    .data
titulo: .asciiz "\n\nAproximación a sen(x) (-1 <= x <= 1) con un error máximo, usando Taylor\n"
petx:   .asciiz "\n\nIntroduzca el valor de x (-1 <= x <= 1): "
pete:   .asciiz "\nIntroduzca el error maximo permitido en la aproximación (0 < error < 1) (error <= 0 sale del programa): "
cadsen: .asciiz "\n\n\nsen(x) calculado: "
caderr: .asciiz "\nerror calculado: "
cadite: .asciiz "\nnumero de iteraciones calculadas: "
cadfin: .asciiz "\nFin del programa\n"
    
    .text

#x -> $f20
#numerador-> $f4
#denominador -> $s1
#xx -> $f6
##error_calculado ->$f8
#n -> $t2
#signo -> $t5
#old_senx -> $f10
##error -> $f28

main:
##    std::cout << "\n\nAproximación a sen(x) (-1 <= x <= 1) con un error máximo, usando Taylor\n";
	li $v0, 4
	la $a0, titulo
	syscall
	do0:
#std::cout << "\n\nIntroduzca el valor de x (-1 <= x <= 1): ";
		li $v0, 4
		la $a0, petx
		syscall
#std::cin >> x;
		li $v0, 7
		syscall
		mov.d $f20, $f0
#while ( (x < -1) || (x > 1));
	while:
		li $t4, 1
		li $t5, -1
		mtc1 $t5,$f16
		mtc1 $t4,$f18
		cvt.d.w $f18, $f18
		cvt.d.w $f16, $f16
#( (x < -1) 
		c.lt.d $f20,$f16
		bc1t do0_fin
#(x > 1));
		c.le.d $f20, $f18
		bc1t do1
	do0_fin:
	b do0
	do1:
#std::cout << "\nIntroduzca el error maximo permitido en la aproximación (0 < error < 1) (error <= 0 sale del programa): ";
		li $v0, 4
		la $a0, pete
		syscall
#std::cin >> error;
		li $v0, 7
		syscall
		mov.d $f28, $f0
#while (error >= 1);
	while1:
#(error >= 1);
		c.le.s $f28, $f18
		bc1t do1_fin
	do1_fin:
	if: 
##if (error <= 0) break;
		li $t6, 0
		mtc1 $t6, $f26
		cvt.d.w $f26, $f26
		c.eq.d $f28, $f26
		bc1t fin
	if_fin:
#int n = 0; // iteraciones
	li $t2, 0
#double numerador = x; // primer numerador del termino para n=0
	mov.d $f4, $f20
#int denominador = 1; // primer denominador del termino para n=0
	li $s1, 1
#int signo = 1;
	li $t5, 1
#double sen_x = x;
	mov.d $f16, $f20
#double xx = x*x;
	mul.d $f6,$f20,$f20
	do2:
#double old_senx = sen_x;
		mov.d $f10,$f16
#n++; // incremento el termino
		add $t2, $t2, 1
#signo = -signo;
#Pasando signo a double
		mtc1 $t5, $f18	
		cvt.s.d $f18, $f18
		neg.d $f18, $f18
#numerador *= xx; 
		mul.d $f4, $f4, $f6
# denominador = (2*n+1) * 2*n * denominador;
		mul $s1, $s1, $t2
		li $t6, 2
		mul $s1, $s1, $t6
		mul $t4, $t6, $t2
		add $t4, $t4, 1
		mul $s1, $s1, $t4
#Pasando den a double
		mtc1 $s1,$f8
		cvt.s.d $f8,$f8
		mul.d $f14, $f4, $f18
		div.d $f14, $f14, $f8
		add.d $f16, $f16, $f14
# error_calculado = fabs((sen_x - old_senx) / sen_x);
		sub.d $f22, $f16, $f10
		div.d $f22, $f22, $f16
		abs.d $f22, $f22
#  } while (error_calculado >= error);		
		while2:
		c.lt.d $f28, $f22
		bc1t do2
	do2_fin:
# std::cout << "\n\n\nsen(x) calculado: " << sen_x;
	li $v0, 4
	la $a0, cadsen
	syscall
# std::cout << "\nerror calculado: " << error_calculado;
	li $v0, 4
	la $a0, caderr
	syscall
# std::cout << "\nnumero de iteraciones calculadas: " << n;
	li $v0, 4
	la $a0, cadite
	syscall
# while (true);
	while_fin:
b fin
fin:
#std::cout << "\nFin del programa\n";
	li $v0, 4
	la $a0, cadfin
	syscall
    
	li $v0,10
    syscall
