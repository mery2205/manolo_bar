import 'package:flutter/material.dart';
import '../models/pedido.dart';

/// Vista que muestra el resumen final de un pedido.
class ResumenFinalView extends StatelessWidget {
  /// Constructor de la vista ResumenFinalView.
  const ResumenFinalView({super.key});

  /// Construye la interfaz de usuario para mostrar el resumen del pedido.
  @override
  Widget build(BuildContext context) {
    /// Obtiene los argumentos pasados a la ruta actual.
    final args = ModalRoute.of(context)!.settings.arguments;

    /// Verifica si los argumentos son nulos o no son del tipo Pedido.
    if (args == null || args is! Pedido) {
      return Scaffold(
        appBar: AppBar(title: Text("Resumen")),
        body: Center(child: Text("No existe nungun pedido")),
      );
    }

    /// Extrae el pedido de los argumentos.
    final pedido = args;

    return Scaffold(
      appBar: AppBar(title: Text("Resumen del Pedido")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Muestra el nombre de la mesa del pedido.
          Text(
            "Mesa: ${pedido.nombreMesa}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          Text(
            "Productos:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          /// Recorre cada producto en el pedido y lo muestra en la interfaz.
          for (var p in pedido.productos)
            Text("${p.nombreProducto} - ${p.precio}"),

          SizedBox(height: 10),
          /// Muestra el total final del pedido.
          Text(
            "Total : ${pedido.totalFinal}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),

      /// BOTON PARA VOLVER
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Volver"),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
