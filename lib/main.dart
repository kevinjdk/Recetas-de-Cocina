import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recetas_cocina/screens/home.screen.dart';
import 'package:recetas_cocina/screens/login.screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase con las opciones correctas
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recetas de Cocina',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          HomeScreen(), // Asegúrate de que la pantalla de inicio sea LoginScreen
    );
  }
}
