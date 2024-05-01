void main() {
  final circulo circulo1 = circulo(5);
  print(circulo1);
  print(circulo1.getcirculo());
}

class circulo {
  double radio;
  double pi = 3.1415;

  circulo(double radio) : this.radio = radio;

  String getcirculo() {
    if (this.radio > 0) {
      double resultado = pi * (radio * radio);
      double perimetro = radio * (pi * 2);
      return ("El area del circulo es: ${resultado}\n"
      "El perimetro del circulo es: ${perimetro}");
    } else {
      return "No se permiten numeros negativos";
    }
  }
}