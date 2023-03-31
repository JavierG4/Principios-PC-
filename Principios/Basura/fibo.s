#include <iostream>

int main(int argc, char** argv) {
   /* std::cout << "Programa de fibo" << std::endl;
    int numero_serie;
    do {
        std::cout << "Introduce el número para hacer la serie de fibo y que sea menor que 40(0 Para salir)" << std::endl;
        std::cin >> numero_serie;
        if (numero_serie == 0) {
            break;
        }
        int f = 0;
        int fibo = 1;
        int resultado = 0;
        for( int i = 1; i <= numero_serie; i++) {
            resultado = f + fibo;
            fibo = f;
            f = resultado;  
            std::cout << "fib" << i << "=" << resultado;
    } 
    }while (numero_serie != 0); std::cout << "termine el programa" << std::endl;   
}

*/


    .data
strTitulo   .asciiz "Programa de fibo"
strQuenumero    .asciiz "Introduce el número para hacer la serie de fibo y que sea menor que 40(0 Para salir):"
strFib  .asciiz "fib"
strIgual    .asciiz "="
StrFinal    .asciiz "Termina el programa"
StrSaltolin .asciiz "/n"

    .text
/* Asignación de variables a registros
numero serie -> $s0
fib -> $s2
f -> $s1
resultado -> $s3
i -> $s4
*/

//int main(int argc, char** argv) {
main:

//std::cout << "Programa de fibo" << std::endl;
li  $v0,4
la  $a0, strTitulo
syscall

//int numero_serie;
//  do {
do_while:
    // std::cout << "Introduce el número para hacer la serie de fibo y que sea menor que 40(0 Para salir)" << std::endl;
    li  $v0, 4
    la  $a0, strQuenumero
    syscall
    //std::cin >> numero_serie;
    li  $v0, 5
    syscall
    move	$s0,$v0

    //if (numero_serie == 0) { break)
    beq	$s0,$zero,fin_do_while

    //int f = 0;
    move	$s1,$zero
    // int fib = 1;
    li $s2,1
    // int resultado = 0;
    move $s3,$zero
    // for( int i = 1; i <= numero_serie; i++) {
    li	$s4,1
for:
    bgt	$s2,$s0,for_fin

