# Autor:Javier Gonzalez Brito
# Correo electrónico:alu0101548197@ull.edu.es
# Fecha: 10/03/23

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

# Variables utilizadas 
# $f2 == Valor de la x
# $f4 y $f6 == Rango permitido
# $f8 == error
# $t1 == n
# $f14 == Numerador
# $t2 == Denominador
# $t3 == Signo == $f22
# $f16 == sen_x
# $f26 == Término

    .text
main:
    li $v0,4
    la $a0,titulo # Muestra el título del programa 
    syscall
    # Inicializo el rango 
    li.d $f4,-1.0 
    li.d $f6,1.0
    do1:
        do2:
            li $v0,4
            la $a0,petx # Muestra el mensaje para pedir x 
            syscall
            li $v0,7 # Pide el valor de x
            syscall
            mov.d $f2,$f0
            while: c.lt.d $f2,$f4 # Si la x es menor que -1 sigue el bucle 
                bc1t do2
                c.le.d $f2,$f6 # Si la x es mayor que 1 sigue el bucle 
                bc1f do2
            whileFin:
        doFin2:
        do3:
            li $v0,4
            la $a0,pete # Muestra el mensaje de error por consola 
            syscall
            li $v0,7 
            syscall
            mov.d $f8,$f0 # Pide el valor del error
            while2:
                c.le.d $f8,$f6
                bc1f do3
            while2Fin:
            if: c.le.d $f8,$f30 # Si el error es menor o igual a cero el programa para 
                bc1t exit
            ifFin:
        do3Fin:
        # Declaración de las variables 
        li $t1,0 # Iteracciones
        mov.d $f14,$f2 # Numerador == x
        li $t2,1 # Denominador == 1
        li $t3,1 # Signo == 1
        mov.d $f16,$f2 # Sen_x == x
        mul.d $f18,$f2,$f2 # double xx = x*x
        do4:
            mov.d $f20,$f16 # old_senx == sen_x 
            add $t1,$t1,1 # n++
            mtc1 $t3,$f22
            cvt.d.w $f22,$f22 # Conversión del signo a double
            neg.d $f22,$f22 # El signo se alterna 
            mul.d $f14,$f14,$f18 # numerador *= xx
            # Denominador 
            mul $t4,$t1,2 # 2 * n
            add $t5,$t4,1 # 2 * n + 1
            mul $t6,$t5,$t4 # (2*n+1) * 2*n
            mul $t6,$t6,$t2 # (2*n+1) * 2*n * denominador
            move $t2,$t6 # denominador = (2*n+1) * 2*n * denominador 
            mtc1 $t2,$f24
            cvt.d.w $f24,$f24 # Conversión del denominador a double

            # Término
            mul.d $f26,$f22,$f14 # signo * numerador 
            div.d $f26,$f26,$f24 # signo * numerador / denominador 
            add.d $f16,$f16,$f26 # sen_x += término

            # error_calculado
            sub.d $f28,$f16,$f20 # sen_x - old_senx
            div.d $f28,$f28,$f16 # error_calculado == (sen_x - old_senx) / sen_x
            abs.d $f28,$f28 # fabs(error_calculado)
            while3:
                c.le.d $f28,$f8
                bc1f do4
            while3Fin:
        do4Fin:
        # Soluciones por pantalla 

        li $v0,4
        la $a0,cadsen 
        syscall
        li $v0,3
        mov.d $f12,$f16 # Muestra por consola el valor del seno calculado
        syscall
        li $v0,4
        la $a0,caderr
        syscall
        li $v0,3
        mov.d $f12,$f28 # Muestra por consola el error calculado
        syscall
        li $v0,4
        la $a0,cadite
        syscall
        li $v0,1
        move $a0,$t1 # Muestra por consola el número de iteracciones hechas 
        syscall
        li $v0,4
        la $a0,cadfin # Termina el programa 
        syscall
    while4:
        b do1
    while4Fin:
        exit:
        li $v0,4
        la $a0,cadfin # Fin del programa 
        syscall
        li $v0,10
        syscall
    do1Fin:
# EXIT