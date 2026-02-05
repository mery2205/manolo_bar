import 'package:flutter/material.dart';
import '../views/CrearPedidoView.dart';
import '../viewmodels/HomeViewModel.dart';

/// Vista principal que muestra la lista de pedidos realizados.
/// También permite crear nuevos pedidos.
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  /// Utiliza un ViewModel para gestionar la lista de pedidos.
  final vm = HomeViewModel();

  /// Construye la interfaz de usuario con una lista de pedidos y un botón para añadir nuevos pedidos.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pedidos del bar")),

      // Construye una lista de pedidos utilizando ListView.builder.
      body: ListView.builder(
        itemCount: vm.pedidos.length,
        itemBuilder: (context, index) {
          // Cada elemento de la lista muestra el nombre de la mesa, el número de productos y el precio total final del pedido.
          final p = vm.pedidos[index];
          return ListTile(
            
            title: Text(p.nombreMesa),
            subtitle: Text("Productos: ${p.productos.length}"),
            trailing: Text("${p.totalFinal.toStringAsFixed(2)} euros"),
          );
        },
      ),

      // Botón flotante para añadir un nuevo pedido.
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        // Al presionarlo, navega a la vista CrearPedidoView y espera un nuevo pedido como resultado.
        onPressed: () async {
          final nuevo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CrearPedidoView()),
          );
          if (!mounted) {
            return;
          }
          // Si se recibe un nuevo pedido, lo añade a la lista de pedidos en el ViewModel y actualiza la interfaz.
          if (nuevo != null) {
            setState(() => vm.anadirPedidoNuevo(nuevo));
          }
        },
        tooltip: 'Crear nuevo pedido',  // ← AÑADÍ ESTA LÍNEA
      ),
    );
  }
}
