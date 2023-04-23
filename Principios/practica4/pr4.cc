#include <iostream>


int main(){
    int dim1 = 40;
    int dim2 = 40;
    float v1 [dim1];
    float v2 [dim2];
    int k = 10;
    int W = 40;
    for (int i = 0; i < dim1; i++){
        v1[i] = i + k;
    }
    for (int j = 0; i < dim1; i++){
        v2[j] = w - i;
    }

/*
    (1) Cambiar dimensión de un vector
    (2) Cambiar un elemento de un vector
    (3) Invertir un vector
    (4) Calcular el producto escalar de dos vectores
    (0) Salir
*/
menu:
    std::cout << "Vector con dimension" << dim1 << std::endl;
    for(int i = 0;i < dim1; i++){
        std::cout << v1[i] << " ";
    }
    std::cout << "\n"
    std::cout << "Vector con dimension" << dim2 << std::endl;
    for(int i = 0;i < dim2; i++){
        std::cout << v1[i] << " ";
    }
    std::cout << "\n"
    std::cout << "(1) Cambiar dimensión de un vector"
    std::cout << "(2) Cambiar un elemento de un vector"
    std::cout << "(3) Invertir un vector"
    std::cout << "(4) Calcular el producto escalar de dos vectores"
    std::cout << "(0) Salir"
    int opcion;
    switch(opcion){
        case "1":
            int opcion1;
            std::cout "\nElija vector para realizar la operacion (1) para v1 (2) para v2: "
            if(opcion == 1){
            std::cout "\nIntroduzca nueva dimension para el vector (1-40): "
            int nuevadim;
            std::cin << nuevadim;
            dim1 =
            }
        break;
        case "2":

        break;
        case "3":
            for(int i = 0; i < dim1; i++){
                int auxv[i]
            }
        break;
        case "4":

        break;
        case "0":

        break;
    }
}