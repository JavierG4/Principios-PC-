#// Programa para evaluar polinomio tercer grado

##include <iostream>
#int main(void) {
#  float a,b,c,d;
#  std::cout << "\nEvaluacion polinomio f(x) = a x^3  + b x^2 + c x + d  en un intervalo [r,s]\n";
#  std::cout << "\nIntroduzca los valores de a,b,c y d (separados por retorno de carro):\n";
#  std::cin >> a;
#  std::cin >> b;
#  std::cin >> c;
#  std::cin >> d;
#  int r,s;
#  do {
#    std::cout << "Introduzca [r,s] (r y s enteros, r <= s)  (separados por retorno de carro):\n";
#    std::cin >> r;
#    std::cin >> s;
#  } while (r > s);
#  for (int x = r ; x <= s ; x++) {
#    float f = a*x*x*x + b*x*x + c*x + d;
##    if (f >= 2.1) {
#      std::cout << "\nf(" << x << ") = " << f;
##  }
## }
##std::cout << "\n\nTermina el programa\n";
###}

#    

    .data
SrtTitulo    .ascii "nEvaluacion polinomio f(x) = a x^3  + b x^2 + c x + d  en un intervalo [r,s]\n"
StrIntroduce .ascii "nIntroduzca los valores de a,b,c y d (separados por retorno de carro):\n"
StrIntrovalo .ascii "Introduzca [r,s] (r y s enteros, r <= s)  (separados por retorno de carro):\n"
Strfinal     .ascii  "n\nTermina el programa\n"


    .text
# Asignación de valores
#a (float) -> $f20
#b (float) -> $f21
#c (float) -> $f22
#d (float) ->$f23
#r (entero) -> $s0
#s (entero) -> $s1
#x (entero) ->$t1
#f (float) ->$f4
# *x*x = $f5
# *x = $f6
    
  
#int main(void) 
main: 
#std::cout << "\nEvaluacion polinomio f(x) = a x^3  + b x^2 + c x + d  en un intervalo [r,s]\n";
    li  $v0,4
    la  $a0, StrTitulo
    syscall 
#std::cout << "\nIntroduzca los valores de a,b,c y d (separados por retorno de carro):\n";
    li  $v0, 4
    la  $a0, StrIntroduce
    syscall
#std::cin >> a;
    li $v0, 
    syscall
    move $f20, $v0
#std::cin >> b;
    li $v0, 5
    syscall
    move $f21, $v0
#std::cin >> c;
    li $v0, 5
    syscall
    move $f22, $v0
#std::cin >> d;    
    li $v0, 5    
    syscall    
    move $f23, $v0
#do {
    do_while:
#std::cout << "Introduzca [r,s] (r y s enteros, r <= s)  (separados por retorno de carro):\n";
    li $v0, 4
    la $a0. StrIntrovalo
    syscall
#std::cin >> r;
    li  $v0, 5
    syscall
    move $s0, $v0#std::cin >> s;
    li  $v0, 5
    syscall
    move $s1, $v0
#while (r > s);
    ble $s0, $s1, do_while
#for (int x = r ; x <= s ; x++) {
    move $t1, $s0
for:
    bgt $s2, $s1, fin_do_while
#float f = a*x*x*x(t3) + b*x*x(t2) + c*x(t1) + d;
    mul $t2, $t1, $t1
    mul $t3, $t1, $t2
    mtcl $t3,$f4
    cvt.s.w $f4, $f4
    mtcl $t2,f5
    cvt.s.w $f5, $f5
    mtcl $t1, $f6
    cvt.s.w $f6,$f6
    mul.s $f7, $f20, $f4
    mul.s $f8, $f21, $f5
    mul.s $f9, $f22, $f6
    add.s $f10, $f7, $f8
    add.s $f10, $f10, $f9
    add.s $f16, $f10, $f23
##if (f >= 2.1) {
if:
    li.s f17, 2.1
    c.le.s $f16, $f17
    blct exit
    
#std::cout << "\nf(" << x << ") = " << f;
    
    exit:
    addi $t1, $t1, 1
    b for
fin_do_while:

    li $v0, 4
    la $a0, Strfinal
    syscall
    
    li $v0, 10
    syscall