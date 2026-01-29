import 'package:flutter/material.dart';
import '../viewmodels/SeleccionarProductoViewModel.dart';

class SeleccionarProductosView extends StatefulWidget {
  const SeleccionarProductosView({super.key});

  @override
  State<SeleccionarProductosView> createState() =>
      _SeleccionarProductosViewState();
}

class _SeleccionarProductosViewState extends State<SeleccionarProductosView> {
  final vm = SeleccionarProductoViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seleccionar productos")),

      body: ListView(
        children: vm.productos.map((p) {
          
          final seleccionado = vm.seleccionados.contains(p);

          return ListTile(
            title: Text(p.nombreProducto),
            subtitle: Text("${p.precio} €"),
            trailing: Checkbox(
              value: seleccionado,
              onChanged: (_) {
                setState(() => vm.anadirEliminarProducto(p));
              },
            ),
          );
        }).toList(),
      ),

      bottomNavigationBar: Row(
        
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text("Cancelar"),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context, vm.seleccionados),

              child: Text("Confirmar"),
            ),
          ),
        ],
      ),
    );
  }
}
