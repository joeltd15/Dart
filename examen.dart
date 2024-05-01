import 'dart:io';

void main() {
  List<Cuenta> cuentas = [];

  while (true) {
    print("Menú");
    print("1.Registrar cuenta.");
    print("2.Consignar dinero.");
    print("3.Transferir dinero.");
    print("4.Retirar dinero.");
    print("5.Salir");

    print("Ingresa una opción: ");
    var opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        registrar(cuentas);
        break;
      case 2:
        consignar(cuentas);
        break;
      case 3:
        transferir(cuentas);
        break;
      case 4:
        retirar(cuentas);
        break;
      case 5:
        exit(0);
      default:
        print('Opcion incorrecta. elige una opción valida');
    }
  }
}

void registrar(List<Cuenta> cuentas) {
  print("Ingrese el numero de cuenta: ");
  var numeroCuenta = stdin.readLineSync()!;
  if (cuentas.any((cuenta) => cuenta.numeroCuenta == numeroCuenta)) {
    print('Esta cuenta ya está registrada.');
    return;
  }

  cuentas.add(Cuenta(numeroCuenta, 0));
  print("Cuenta Registrada");
}

void consignar(List<Cuenta> cuentas) {
  print("Ingrese el numero de cuenta: ");
  var numeroCuenta = stdin.readLineSync();
  var cuenta = cuentas.firstWhere(
      (cuenta) => cuenta.numeroCuenta == numeroCuenta,
      orElse: () => Cuenta("", 0));

  if (cuenta.numeroCuenta.isEmpty) {
    print("La cuenta no existe");
    return;
  }

  print("Ingrese el valor a consignar: ");
  var monto = double.parse(stdin.readLineSync()!);

  cuenta.saldo += monto;
  print("consignacion exitosa, nuevo saldo: ${cuenta.saldo}");
}

void transferir(List<Cuenta> cuentas) {
  print("Ingrese el numero de cuenta origen: ");
  var origen = stdin.readLineSync()!;
  var cuentaOrigen = cuentas.firstWhere(
      (cuenta) => cuenta.numeroCuenta == origen,
      orElse: () => Cuenta("", 0));

  if (cuentaOrigen.numeroCuenta.isEmpty) {
    print("La cuenta de origen no existe");
    return;
  }
  print("Ingrese el numero de cuenta de destino: ");
  var destino = stdin.readLineSync()!;
  var cuentaDestino = cuentas.firstWhere(
      (cuenta) => cuenta.numeroCuenta == destino,
      orElse: () => Cuenta("", 0));

  if (cuentaDestino.numeroCuenta.isEmpty) {
    print("La cuenta de destino no existe");
    return;
  }

  print('Ingrese el monto a transferir:');
  var monto = double.parse(stdin.readLineSync()!);

  if (monto <= 0 || monto > cuentaOrigen.saldo) {
    print('Monto incorrecto para transferir.');
    return;
  }

  cuentaOrigen.saldo -= monto;
  cuentaDestino.saldo += monto;
  print('Transferencia exitosa.');
}

void retirar(List<Cuenta> cuentas) {
  print("Ingrese el numero de cuenta: ");
  var numeroCuenta = stdin.readLineSync()!;
  var cuenta = cuentas.firstWhere(
      (cuenta) => cuenta.numeroCuenta == numeroCuenta,
      orElse: () => Cuenta("", 0));

  if (cuenta.numeroCuenta.isEmpty) {
    print("La cuenta no existe");
    return;
  }

  print("Ingrese el monto a retirar");
  var monto = double.parse(stdin.readLineSync()!);

  if (monto <= 0 || monto > cuenta.saldo) {
    print("Monto incorrecto para retirar");
    return;
  }
  cuenta.saldo -= monto;
  print("Retiro exitoso, nuevo saldo ${cuenta.saldo}");
}

class Cuenta {
  String numeroCuenta;
  double saldo;

  Cuenta(this.numeroCuenta, this.saldo);
}