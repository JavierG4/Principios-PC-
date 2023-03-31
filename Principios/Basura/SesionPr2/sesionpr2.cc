//Nombre: Izan Pérez González
//Correo: alu0101543345@ull.edu.es

# // En un bucle solicitar dos flotantes en doble precisión.
# // En cada iteración se calculará la distancia entre ambos
# // (distancia siempre es positiva).
# // Cuando se introduzcan dos números iguales debe detenerse el bucle.
# // Al finalizar se mostrará la pareja que ha tenido mayor distancia
# // y la distancia entre ellos.

  #include <iostream>
  #include <cmath>

  int main() {
    std::cout << "\nDistancia flotantes\n";
    double maxDistancia = -1.0;
    double pareja1;
    double pareja2;
    double distancia;
    do {
      double numero1;
      std::cout << "\nPrimer número: ";
      std::cin >> numero1;

      double numero2;
      std::cout << "Segundo número: ";
      std::cin >> numero2;

      distancia = fabs(numero1 - numero2);
      // std::cout << "Distancia " << distancia;
      if (distancia > maxDistancia) {
        maxDistancia = distancia;
        pareja1 = numero1;
        pareja2 = numero2;
      }

    } while (distancia > 0.0);

    std::cout << "\nMayor distancia: " << maxDistancia;
    std::cout << "\nNumero 1: " << pareja1;
    std::cout << "\nNumero 2: " << pareja2;

    std::cout << "\n\nTermina el programa\n";

}
