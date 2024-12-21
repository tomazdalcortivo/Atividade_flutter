import 'package:flutter/material.dart';
import 'package:rotas/mainpage.dart';
import 'package:rotas/salvarstringpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const MainPage(),
        '/salvarstring': (_) => const SalvarStringPage(),
      },
    );
  }
}
