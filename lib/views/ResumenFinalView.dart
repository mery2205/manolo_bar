import 'package:flutter/material.dart';
import '../models/pedido.dart';

class ResumenFinalView extends StatelessWidget {
  const ResumenFinalView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    if (args == null || args is! Pedido) {
      return Scaffold(
        appBar: AppBar(title: Text("Resumen")),
        body: Center(child: Text("No existe nungun pedido")),
      );
    }

    final pedido = args;

    return Scaffold(
      appBar: AppBar(title: Text("Resumen del Pedido")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mesa: ${pedido.nombreMesa}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Productos:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold, 
            ),
          ),

          for (var p in pedido.productos)
            Text("${p.nombreProducto} - ${p.precio}"),

          SizedBox(height: 10),
          Text(
            "Total : ${pedido.totalFinal}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text("Volver"),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
