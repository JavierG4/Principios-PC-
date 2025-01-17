#include <iostream>

// En C++ para poder utilizar el indexado de una matriz (bidimensional)
// mediante dos pares de corchetes el número de filas y columnas no pude cambiar,
// debe ser constante y conocido desde el principio.
//
// En esta práctica queremos cambiar el número de filas y columnas de la matriz
// considerada.
// Para poder emular en C++ lo que podemos hacer en ensamblador
// vamos a manejar la matriz como un vector.
// Para acceder al elenemto en la fila de índice `f` y columna de índice `c`
// no podemos hacer `mat[f][c]` sino que debemos hacer `mat[f*ncol+c]`

void CambiarDim(int *mat) {
    int filas;
    int columnas;
    std::cout << "Introduzca el número de filas ";
    std::cin >> filas;
    std::cout << "Introduzca el número de columnas ";
    std::cin >> columnas;
    for(int i = 0; i < filas; i++){
        for(int j = 0; j < columnas; j++){
            std::cout <<  mat[i*columnas+j] << " ";
        }
        std::cout << "\n";
    }
}

void Intercambiar_elementos(int *mat) {
    
}
/*void SumaEle(int *mat) {
    int suma;
    int uno = 1;
    int col = 10;
    int fil = 20;
    for(int i = 0; i < col - 1; i++) {
        suma +=  mat[i];
    }
    for(int i = 1; i < fil; i++){
        suma += mat[i*fil];
    }
    for(int)
}
void MaxyMin(int *mat) {
*/
void Fin(){
    std::cout << "Fin del Programa" << std::endl;
}

void Opciones() {
    std::cout << "(1) Cambiar dimensiones" << std::endl;
    std::cout << "(2) Intercambiar dos elementos" << std::endl;
    std::cout << "(3) Suma elementos del perímetro" << std::endl;
    std::cout << "(4) Calcula máximo y mínimo de la diagonal principal" << std::endl;
    std::cout << "(0) Salir" << std::endl;

}

int main() {

  int mat[] = {
    100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119,
    120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139,
    140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159,
    160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179,
    180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
    200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219,
    220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239,
    240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259,
    260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279,
    280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299,
    300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319,
    320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339,
    340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359,
    360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379,
    380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399,
    400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419,
    420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439,
    440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459,
    460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479,
    480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499,
  };

  const int maximoElementos=400;
  int nfil = 20;
  int ncol = 10;
  int filas;
  int columnas;
  // se imprimie el título
  std::cout << "\nPráctica PR3 de Principios de Computadores. Matrices.\n";

  std::cout << "\nLa matriz es " << nfil << "x" << ncol << "\n";
  for ( int f = 0; f < nfil; f++) {
    for (int c = 0; c < ncol; c++ ) {
      std::cout << mat[f*ncol+c] << "  "; // equivalente a acceso `mat[f][c]`
    }
    std::cout << "\n";
  }
    Menu:
    int opcion;
    Opciones();
    std::cout << "Elija opción : ";
    std::cin >> opcion;
    std::cout << "\n";
    if(opcion == 1) {
        int filas;
        int columnas;
        std::cout << "Introduzca el número de filas ";
        std::cin >> filas;
        std::cout << "Introduzca el número de columnas ";
        std::cin >> columnas;
        for(int i = 0; i < filas; i++){
            for(int j = 0; j < columnas; j++){
                std::cout <<  mat[i*columnas+j] << " ";
            }
            std::cout << "\n";
        }
        goto Menu;
    }
    else if(opcion == 2){
        int fil1;
        int fil2;
        int col1;
        int col2;
        std::cout << "Introduzca la fila del primer elemeneto a cambiar ";
        std::cin >> fil1 ;
        std::cout << "\n";
        std::cout << "Introduzca la columna del primer elemeneto a cambiar ";
        std::cin >> col1;
        std::cout << "\n";
        std::cout << "Introduzca la fila del segundo elemeneto a cambiar ";
        std::cin >> fil2;
        std::cout << "\n";
        std::cout << "Introduzca la columna del segundo elemeneto a cambiar ";
        std::cin >> col2;
        std::cout << "\n";
        int aux1 = mat[fil1*columnas+col1];
        int aux2 = mat[fil2*columnas+col2];
        mat [fil1*columnas+col1] = aux2;
        mat [fil2*columnas+col2] = aux1;
        std::cout << mat [fil1*columnas+col1] << " " << mat [fil2*columnas+col2];
        }
    /*else if(opcion == 3){
        int suma;
        for(int i = 0; i < col - 1; i++) {
            suma +=  mat[i];
        }
        for(int i = 1; i < fil - 1; i++){
            suma += mat[i*filas];
        }
        for(int i = 0; i < col -1; i++){
            suma += mat[i*columnas + i];
        }
        for(int i = 1; i < filas ; i++){
            suma += mat[i*filas + i];
        }
        std::cout << suma << std::endl;
    }
    */
    else if(opcion == 4){
        //MaxyMin(mat);
    }
    else if(opcion == 0){
        Fin();
    }
    else {
        std::cout << "Opción incorrecta" << std::endl;
        goto Menu;
    }
}

