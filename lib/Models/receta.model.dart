class Receta {
  String id;
  String nombre;
  String ingredientes;
  String instrucciones;

  Receta(
      {required this.id,
      required this.nombre,
      required this.ingredientes,
      required this.instrucciones});

  factory Receta.fromMap(Map<String, dynamic> data) {
    return Receta(
      id: data['id'],
      nombre: data['nombre'],
      ingredientes: data['ingredientes'],
      instrucciones: data['instrucciones'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'ingredientes': ingredientes,
      'instrucciones': instrucciones,
    };
  }
}
