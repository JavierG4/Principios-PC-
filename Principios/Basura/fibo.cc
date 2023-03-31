#include <iostream>

int main(int argc, char** argv) {
    std::cout << "Programa de fibo" << std::endl;
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
        
    }
     while (numero_serie != 0);
        std::cout << "termine el programa" << std::endl;  
}