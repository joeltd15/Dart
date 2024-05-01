void main() {
  var apartamento = Apartamento("Calle 123, Ciudad", 800, 120000, 2);
  var casa = Casa("Av. Principal, Pueblo", 1000, 200000, 3, true);

  print("Apartamento:");
  apartamento.imprimir();

  print("\nCasa:");
  casa.imprimir();
}
class Inmueble {
  String direccion;
  double valorArriendo;
  double _valorVenta;

  Inmueble(this.direccion, this.valorArriendo, this._valorVenta);

  double get valorarriendo => valorArriendo;
  set ValorArriendo(double valor) {
    if (valor >= 0) {
      valorArriendo = valor;
    } else {
      print("El valor de arriendo no puede ser negativo");
    }
  }

  double get valorVenta => _valorVenta;
  set valorVenta(double valor) {
    if (valor >= 0) {
      _valorVenta = valor;
    } else {
      print("El valor de venta no puede ser negativo");
    }
  }

  void imprimir() {
    print("Dirección: $direccion");
    print("Valor de Arriendo: \$${valorArriendo.toStringAsFixed(2)}");
    print("Valor de Venta: \$${_valorVenta.toStringAsFixed(2)}");
  }
}

class Apartamento extends Inmueble {
  int numHabitaciones;

  Apartamento(String direccion, double valorArriendo, double valorVenta, this.numHabitaciones)
      : super(direccion, valorArriendo, valorVenta);

  @override
  void imprimir() {
    super.imprimir();
    print("Número de Habitaciones: $numHabitaciones");
  }
}

class Casa extends Inmueble {
  int numHabitaciones;
  bool tienePatio;

  Casa(String direccion, double valorArriendo, double valorVenta, this.numHabitaciones, this.tienePatio)
      : super(direccion, valorArriendo, valorVenta);

  @override
  void imprimir() {
    super.imprimir();
    print("Número de Habitaciones: $numHabitaciones");
    print("Tiene Patio: ${tienePatio ? 'Sí' : 'No'}");
  }
}