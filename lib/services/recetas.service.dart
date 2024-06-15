import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recetas_cocina/Models/receta.model.dart';

class FirebaseService {
  final CollectionReference recetaCollection =
      FirebaseFirestore.instance.collection('recetas');

  Future<void> agregarReceta(Receta receta) async {
    await recetaCollection.add(receta.toMap());
  }

  Future<void> actualizarReceta(Receta receta) async {
    await recetaCollection.doc(receta.id).update(receta.toMap());
  }

  Future<void> eliminarReceta(String id) async {
    await recetaCollection.doc(id).delete();
  }

/*   Stream<List<Receta>> getRecetas() {
    return recetaCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Receta.fromMap(doc.data())).toList());
  } */
}
