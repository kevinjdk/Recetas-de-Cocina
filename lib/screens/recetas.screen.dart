import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recetas_cocina/screens/customerDrawer.screen.dart';

class RecetasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
      ),
      drawer: CustomDrawer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('recetas').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final recetas = snapshot.data!.docs;
          return ListView.builder(
            itemCount: recetas.length,
            itemBuilder: (context, index) {
              final receta = recetas[index];
              return ListTile(
                title: Text(receta['titulo']),
                subtitle: Text(receta['ingredientes']),
              );
            },
          );
        },
      ),
    );
  }
}
