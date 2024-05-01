void main() {
  // Define la letra que quieres usar
  String letra = "j";

  // Loop para imprimir el cuadrado
  for (int i = 0; i < 7; i++) {
    String fila = "";
    for (int j = 0; j < 7; j++) {
      fila += letra + " ";
    }
    print(fila);
  }
}