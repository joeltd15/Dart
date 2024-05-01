import 'dart:io';
import 'dart:math';

void main() {
  List<String> documentos = [];
  List<String> nombres = [];
  List<int> inasistencias = [];
  List<Venta> ventas = [];

  while (true) {
    print("\nMenú:");
    print("1. Registrar inasistencias");
    print("2. Listar Todas Inasistencias");
    print("3. Listar los aprendices con inasistencias superiores a 3");
    print("4. Consultar el total de inasistencias por aprendiz");
    print("5. Valor a Pagar");
    print("6. Número de suerte");
    print("7. Salir");

    stdout.write("Seleccione una opción: ");
    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        registrarInasistencias(documentos, nombres, inasistencias);
        break;
      case 2:
        listarTodasInasistencias(documentos, nombres, inasistencias);
        break;
      case 3:
        listarInasistenciasSuperioresA3(documentos, nombres, inasistencias);
        break;
      case 4:
        consultarTotalInasistenciasPorAprendiz(documentos, nombres, inasistencias);
        break;
      case 5:
        calcularValorAPagar(ventas);
        break;
      case 6:
        generarNumeroSuerte();
        break;
      case 7:
        print("Saliendo del programa...");
        return;
      default:
        print("Opción inválida. Por favor seleccione una opción válida.");
        break;
    }
  }
}

void registrarInasistencias(List<String> documentos, List<String> nombres, List<int> inasistencias) {
  stdout.write("Ingrese el documento del aprendiz: ");
  String documento = stdin.readLineSync()!;

  if (documentos.contains(documento)) {
    int indice = documentos.indexOf(documento);
    stdout.write("El aprendiz ya está registrado. Ingrese la cantidad de inasistencias actualizada: ");
    int cantidad = int.parse(stdin.readLineSync()!);

    if (cantidad >= 1 && cantidad <= 100) {
      inasistencias[indice] = cantidad;
      print("Inasistencias actualizadas correctamente.");
    } else {
      print("Cantidad de inasistencias no válida.");
    }
  } else {
    stdout.write("Ingrese el nombre completo del aprendiz: ");
    String nombre = stdin.readLineSync()!;
    stdout.write("Ingrese la cantidad de inasistencias (entre 1 y 100): ");
    int cantidad = int.parse(stdin.readLineSync()!);

    if (cantidad >= 1 && cantidad <= 100) {
      documentos.add(documento);
      nombres.add(nombre);
      inasistencias.add(cantidad);
      print("Inasistencias registradas correctamente.");
    } else {
      print("Cantidad de inasistencias no válida.");
    }
  }
}

void listarTodasInasistencias(List<String> documentos, List<String> nombres, List<int> inasistencias) {
  print("Inasistencias registradas:");
  for (int i = 0; i < documentos.length; i++) {
    print("Documento: ${documentos[i]}, Nombre: ${nombres[i]}, Inasistencias: ${inasistencias[i]}");
  }
}

void listarInasistenciasSuperioresA3(List<String> documentos, List<String> nombres, List<int> inasistencias) {
  print("Aprendices con inasistencias superiores a 3:");
  for (int i = 0; i < documentos.length; i++) {
    if (inasistencias[i] > 3) {
      print("Documento: ${documentos[i]}, Nombre: ${nombres[i]}, Inasistencias: ${inasistencias[i]}");
    }
  }
}

void consultarTotalInasistenciasPorAprendiz(List<String> documentos, List<String> nombres, List<int> inasistencias) {
  stdout.write("Ingrese el documento del aprendiz: ");
  String documento = stdin.readLineSync()!;

  int indice = documentos.indexOf(documento);
  if (indice != -1) {
    print("Documento: ${documentos[indice]}, Nombre: ${nombres[indice]}, Inasistencias: ${inasistencias[indice]}");
  } else {
    print("El documento ingresado no corresponde a ningún aprendiz registrado.");
  }
}

void calcularValorAPagar(List<Venta> ventas) {
  print("Ingrese los datos de la venta:");
  stdout.write("Código: ");
  String codigo = stdin.readLineSync()!;
  stdout.write("Nombre: ");
  String nombre = stdin.readLineSync()!;
  stdout.write("Precio: ");
  double precio = double.parse(stdin.readLineSync()!);
  stdout.write("Cantidad: ");
  int cantidad = int.parse(stdin.readLineSync()!);

  try {
    Venta venta = Venta(codigo, nombre, precio, cantidad);
    double valorTotal = venta.calcularValorAPagar();
    print("Valor a pagar: $valorTotal");
    ventas.add(venta);
  } catch (e) {
    print(e);
  }
}

void generarNumeroSuerte() {
  Random rnd = Random();
  int numero = rnd.nextInt(1000);
  String numeroSuerte = numero.toString().padLeft(3, '0');
  print("Número de la suerte: $numeroSuerte");
}

class Venta {
  String codigo;
  String nombre;
  double precio;
  int cantidad;

  Venta(this.codigo, this.nombre, this.precio, this.cantidad);

  double calcularValorAPagar() {
    if (precio <= 0 || cantidad <= 0) {
      throw ArgumentError("El precio y la cantidad deben ser mayores que cero.");
    }

    double valorBruto = precio * cantidad;
    double descuento = cantidad > 10 ? valorBruto * 0.1 : 0;
    double iva = valorBruto * 0.19;
    double valorTotal = valorBruto + iva - descuento;

    return valorTotal;
  }
}