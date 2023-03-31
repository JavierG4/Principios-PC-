#include <iostream>
#include <cmath>

int main() {
    int valor1, valor2;
    std::cin >> valor1 >> valor2;
    if (( valor1 > 0) && (valor2 > 0)) {
        for(int i = 1; i <= valor1; i++) {
            if((valor2 % i) == 0 ) {
                std::cout << i << std::endl;
            }
        }
    }
    return 0;
}