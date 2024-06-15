import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recetas_cocina/screens/customerDrawer.screen.dart'; // Importa tu CustomDrawer aquí

class GestionarRecetasScreen extends StatefulWidget {
  @override
  _GestionarRecetasScreenState createState() => _GestionarRecetasScreenState();
}

class _GestionarRecetasScreenState extends State<GestionarRecetasScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestionar Recetas'),
      ),
      drawer: CustomDrawer(), // Agrega el CustomDrawer aquí
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar Recetas',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('recetas').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final recetas = snapshot.data!.docs.where((receta) {
                  return receta['titulo']
                      .toString()
                      .toLowerCase()
                      .contains(_searchQuery);
                }).toList();
                return ListView.builder(
                  itemCount: recetas.length,
                  itemBuilder: (context, index) {
                    final receta = recetas[index];
                    return ListTile(
                      title: Text(receta['titulo']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showEditDialog(context, receta);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteReceta(receta.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final TextEditingController tituloController = TextEditingController();
    final TextEditingController ingredientesController =
        TextEditingController();
    final TextEditingController preparacionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Crear Nueva Receta'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: tituloController,
                  decoration: InputDecoration(labelText: 'Título'),
                ),
                TextField(
                  controller: ingredientesController,
                  decoration: InputDecoration(labelText: 'Ingredientes'),
                ),
                TextField(
                  controller: preparacionController,
                  decoration: InputDecoration(labelText: 'Preparación'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _createReceta(
                  tituloController.text,
                  ingredientesController.text,
                  preparacionController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text('Crear'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, QueryDocumentSnapshot receta) {
    final TextEditingController tituloController =
        TextEditingController(text: receta['titulo']);
    final TextEditingController ingredientesController =
        TextEditingController(text: receta['ingredientes']);
    final TextEditingController preparacionController =
        TextEditingController(text: receta['preparacion']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Receta'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: tituloController,
                  decoration: InputDecoration(labelText: 'Título'),
                ),
                TextField(
                  controller: ingredientesController,
                  decoration: InputDecoration(labelText: 'Ingredientes'),
                ),
                TextField(
                  controller: preparacionController,
                  decoration: InputDecoration(labelText: 'Preparación'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _updateReceta(
                  receta.id,
                  tituloController.text,
                  ingredientesController.text,
                  preparacionController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text('Actualizar'),
            ),
          ],
        );
      },
    );
  }

  void _createReceta(String titulo, String ingredientes, String preparacion) {
    FirebaseFirestore.instance.collection('recetas').add({
      'titulo': titulo,
      'ingredientes': ingredientes,
      'preparacion': preparacion,
    });
  }

  void _updateReceta(
      String id, String titulo, String ingredientes, String preparacion) {
    FirebaseFirestore.instance.collection('recetas').doc(id).update({
      'titulo': titulo,
      'ingredientes': ingredientes,
      'preparacion': preparacion,
    });
  }

  void _deleteReceta(String id) {
    FirebaseFirestore.instance.collection('recetas').doc(id).delete();
  }
}
