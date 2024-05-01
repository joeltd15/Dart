import 'dart:io';
void main() {
  num num1;
  num num2;

  while (true) {
    print("Menú de operaciones:");
    print("1. Suma");
    print("2. Resta");
    print("3. Multiplicación");
    print("4. División");
    print("5. Salir");

    stdout.write("Seleccione una opción: ");
    var opcion = stdin.readLineSync();

    if (opcion == "1") {
      print("Ingrese el primer número:");
      num1 = num.parse(stdin.readLineSync()!);
      print("Ingrese el segundo número:");
      num2 = num.parse(stdin.readLineSync()!);
      print("La suma es: ${num1 + num2}");
    }
    
    else if (opcion == "2") {
      print("Ingrese el primer número:");
      num1 = num.parse(stdin.readLineSync()!);
      print("Ingrese el segundo número:");
      num2 = num.parse(stdin.readLineSync()!);
      print("La resta es: ${num1 - num2}");
    } 
    
    else if (opcion == "3") {
      print("Ingrese el primer número:");
      num1 = num.parse(stdin.readLineSync()!);
      print("Ingrese el segundo número:");
      num2 = num.parse(stdin.readLineSync()!);
      print("La multiplicación es: ${num1 * num2}");
    } 
    
    else if (opcion == "4") {
      print("Ingrese el primer número:");
      num1 = num.parse(stdin.readLineSync()!);
      print("Ingrese el segundo número:");
      num2 = num.parse(stdin.readLineSync()!);

      if (num2 == 0) {
        print("Error: No se puede dividir por cero.");
      } else {
        print("La división es: ${num1 / num2}");
      }
    } 
    else if (opcion == "5") {
      print("¡Hasta luego!");
      exit(0);
    } else {
      print("Opción inválida. Intente de nuevo.");
    }
  }
}