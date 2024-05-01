 import 'dart:io';
 void main(){
 List<String> listahombre = [];
  List<String> listamujeres = [];
  int AcumuladorHombres = 0;
  int AcumuladorMujeres = 0;

  print("Digite la cantidad que va a tener la lista:");
  int valorlista = int.parse(stdin.readLineSync()!);

  for (var i = 0; i < valorlista; i++) {
    print("Digite su género (Hombre=H) (Mujer=M)");
    String genero = stdin.readLineSync()!.toUpperCase();

    if (genero == "H") {
      print("Digite su nombre: ");
      String nombreh = stdin.readLineSync().toString();
      listahombre.add(nombreh);
    } else if (genero == "M") {
      print("Digite su nombre:");
      String nombrem = stdin.readLineSync().toString();
      listamujeres.add(nombrem);
    }
  }
  print(listamujeres);
  print(listahombre);
  }