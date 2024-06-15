import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recetas_cocina/screens/gestionarRecetas.screen.dart';
import 'package:recetas_cocina/screens/recetas.screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 200.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/1.jpg', height: 80.0),
                  SizedBox(height: 10),
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    user?.email ?? 'usuario@ejemplo.com',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RecetasScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('Recetas'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RecetasScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.cookie),
            title: Text('Gestionar Recetas'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => GestionarRecetasScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contacto'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
