import 'dart:io';

void main() {
  List<Empleado> empleados = [];

  while (true) {
    print("Escoja la opción que desea realizar:");
    print("1. Agregar empleado");
    print("2. Eliminar empleado");
    print("3. Buscar empleado");
    print("4. Editar empleado");
    print("5. Ver la lista de empleados");
    print("6. Salir");
    print("¿Qué operación desea realizar?: ");
    int opcion = int.parse(stdin.readLineSync()!);

    if (opcion == 1) {
      print("Ingrese el nombre del empleado:");
      String nombre = stdin.readLineSync()!;
      print("Ingrese el apellido del empleado:");
      String apellido = stdin.readLineSync()!;
      print("Ingrese el rol del empleado:");
      String rol = stdin.readLineSync()!;
      print("Ingrese el teléfono del empleado:");
      String telefono = stdin.readLineSync()!;

      Empleado nuevoEmpleado = Empleado(nombre, apellido, rol, telefono);
      empleados.add(nuevoEmpleado);
      print("Empleado agregado correctamente");
    } else if (opcion == 2) {
      print("Ingrese el nombre del empleado que desea eliminar:");
      String nombre = stdin.readLineSync()!;
      bool encontrado = false;
      for (int i = 0; i < empleados.length; i++) {
        if (empleados[i].nombre.toLowerCase() == nombre.toLowerCase()) {
          empleados.removeAt(i);
          encontrado = true;
          print("Empleado eliminado correctamente");
          break;
        }
      }
      if (!encontrado) {
        print("Empleado no encontrado");
      }
    } else if (opcion == 3) {
      print("Ingrese el nombre del empleado que desea buscar:");
      String nombre = stdin.readLineSync()!;
      bool encontrado = false;
      for (int i = 0; i < empleados.length; i++) {
        if (empleados[i].nombre.toLowerCase() == nombre.toLowerCase()) {
          print("Empleado encontrado:");
          print("Nombre: ${empleados[i].nombre}");
          print("Apellido: ${empleados[i].apellido}");
          print("Rol: ${empleados[i].rol}");
          print("Teléfono: ${empleados[i].telefono}");
          encontrado = true;
          break;
        }
      }
      if (!encontrado) {
        print("Empleado no encontrado");
      }
    } else if (opcion == 4) {
      print("Ingrese el nombre del empleado que desea editar:");
      String nombre = stdin.readLineSync()!;
      bool encontrado = false;
      for (int i = 0; i < empleados.length; i++) {
        if (empleados[i].nombre.toLowerCase() == nombre.toLowerCase()) {
          print("Ingrese el nuevo nombre del empleado:");
          empleados[i].nombre = stdin.readLineSync()!;
          print("Ingrese el nuevo apellido del empleado:");
          empleados[i].apellido = stdin.readLineSync()!;
          print("Ingrese el nuevo rol del empleado:");
          empleados[i].rol = stdin.readLineSync()!;
          print("Ingrese el nuevo teléfono del empleado:");
          empleados[i].telefono = stdin.readLineSync()!;
          encontrado = true;
          print("Empleado editado correctamente");
          break;
        }
      }
      if (!encontrado) {
        print("Empleado no encontrado");
      }
    } else if (opcion == 5) {
      if (empleados.isEmpty) {
        print("No hay empleados registrados");
      } else {
        print("Lista de empleados:");
        for (var empleado in empleados) {
          print("Nombre: ${empleado.nombre}");
          print("Apellido: ${empleado.apellido}");
          print("Rol: ${empleado.rol}");
          print("Teléfono: ${empleado.telefono}");
          print("-------------------------");
        }
      }
    } else if (opcion == 6) {
      print("¡Adiós!");
      break;
    }
  }
}

class Empleado {
  String nombre;
  String apellido;
  String rol;
  String telefono;

  Empleado(this.nombre, this.apellido, this.rol, this.telefono);
}