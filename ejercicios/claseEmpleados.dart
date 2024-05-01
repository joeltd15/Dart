void main() {
  Empleado nuevoEmpleado = Empleado(
    nombre: 'Joel',
    apellido: 'Tuiran',
    rol: 'barbero',
    telefono:50032930,
    edad: 18,
    estado: true,
  );
  nuevoEmpleado.registrar();
}

class Empleado {
  String nombre;
  String apellido;
  String rol;
  int telefono;
  int edad;
  bool estado;

  Empleado({
    required this.nombre,
    required this.apellido,
    required this.rol,
    required this.telefono,
    required this.edad,
    required this.estado,
  });

  void registrar() {
    print("Registro de empleado nuevo");
    print('Nombre: $nombre Apellido:$apellido');
    print('Rol: $rol  Telefono: $telefono');
    print('Edad: $edad años Estado: $estado');
    print("Registro completado");
  }
}