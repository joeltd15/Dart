
void main() {
//final Aprendiz aprendizi = new Aprendiz(documento: "1825888835", nombres: "joel", promedio:3.2);

  final aprendiz aprendiz1 = aprendiz("1825888835", "joel", 2.5);

  print(
      "Nombre: ${aprendiz1.nombres}, Documento: ${aprendiz1.documento}, promedio: ${aprendiz1.promedio}");
      print(aprendiz1.getAprueba());
}

class aprendiz {

  String documento;
  String nombres;
  double promedio;

//Aprendiz((requerido String this.documento, requerido String this.nombres, requerido double this.promedio));
  aprendiz(String documento, String nombres, double promedio)
      : this.documento = documento,
        this.nombres = nombres,
        this.promedio = promedio;

  String getAprueba() {
    if (this.promedio > 3.499) {
      return "Aprueba";
    } else {
      return "No aprueba";
    }
  }
}