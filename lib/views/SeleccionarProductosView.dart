import 'package:flutter/material.dart';
import '../viewmodels/SeleccionarProductoViewModel.dart';

/// Vista para seleccionar productos y añadirlos al pedido.
class SeleccionarProductosView extends StatefulWidget {
  const SeleccionarProductosView({super.key});

  @override
  State<SeleccionarProductosView> createState() =>
      _SeleccionarProductosViewState();
}

class _SeleccionarProductosViewState extends State<SeleccionarProductosView> {
  /// Utiliza un ViewModel para gestionar la selección de productos.
  final vm = SeleccionarProductoViewModel();

  /// Construye la interfaz de usuario para seleccionar productos.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seleccionar productos")),

      body: ListView(
        /// Genera una lista de productos con checkboxes para seleccionar o deseleccionar.
        children: vm.productos.map((p) {
          /// Verifica si el producto está seleccionado.
          final seleccionado = vm.seleccionados.contains(p);

          /// Construye un ListTile para cada producto.
          return ListTile(
            title: Text(p.nombreProducto),
            subtitle: Text("${p.precio} €"),
            trailing: Checkbox(
              value: seleccionado,

              /// Actualiza la selección del producto cuando cambia el estado del checkbox.
              onChanged: (_) {
                setState(() => vm.anadirEliminarProducto(p));
              },
            ),
          );
        }).toList(),
      ),

      // BOTONES CANCELAR Y CONFIRMAR
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              /// Al presionarlo, vuelve a la pantalla anterior sin guardar cambios.
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
          ),
          Expanded(
            child: Tooltip(
              message: 'Guardar productos y ver resumen',
              child: ElevatedButton(
                /// Al presionarlo, guarda los productos seleccionados y vuelve a la pantalla anterior.
                onPressed: () {

                    if (vm.seleccionados.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Selecciona al menos un producto'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.orange,
                        ),
                      );
                      return; 
                    }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pedido guardado correctamente'),
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.pop(context, vm.seleccionados);
                });
                },

                child: Text("Confirmar"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
