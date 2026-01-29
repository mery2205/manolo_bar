import 'package:flutter/material.dart';
import '../views/HomeView.dart';
import 'views/ResumenFinalView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bar App",
      
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (_) => HomeView(),
        '/resumen': (_) => ResumenFinalView()},
      initialRoute: '/',
    );
  }
}
