import 'package:flutter/material.dart';
import '../views/SeleccionarProductosView.dart';
import '../viewmodels/CrearPedidoViewModel.dart';

/// Vista para crear un nuevo pedido.
class CrearPedidoView extends StatefulWidget {
  const CrearPedidoView({super.key});

  @override
  State<CrearPedidoView> createState() => _CrearPedidoViewState();
}

class _CrearPedidoViewState extends State<CrearPedidoView> {
  // Utiliza un ViewModel para gestionar los datos del pedido.
  final vm = CrearPedidoViewModel();

  /// Construye la interfaz de usuario para crear un nuevo pedido.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear pedido")),
      body: Column(
        children: [
          /// Permite al usuario ingresar el nombre de la mesa.
          TextField(
            decoration: InputDecoration(labelText: "Mesa/Nombre: "),

            /// Actualiza el nombre de la mesa en el ViewModel cuando cambia el texto.
            onChanged: vm.setNombreMesa,
          ),

          SizedBox(height: 20),

          // BOTON PARA AÑADIR PRODUCTOS
          ElevatedButton(
            // Al presionarlo, navega a la vista SeleccionarProductosView y espera los productos seleccionados como resultado.
            onPressed: () async {
              final seleccionados = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SeleccionarProductosView()),
              );

              if (!mounted) return;
              // Si se reciben productos seleccionados, los actualiza en el ViewModel.
              if (seleccionados != null) {
                setState(() => vm.setProductos(seleccionados));
              }
            },
            child: Text("Añadir productos"),
          ),

          SizedBox(height: 20),

          // RESUMEN PROVISIONAL
          /// Muestra el número de productos seleccionados y el total provisional del pedido.
          Text("Productos: ${vm.productosSeleccionados.length}"),
          Text("Total: ${vm.totalProvisional}€"),


          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/resumen",
                arguments: vm.pedidoFinal,
              );
            },
            child: Text("Ver resumen"),
          ),

          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              ),

              ElevatedButton(
                onPressed: vm.puedeGuardar
                    ? () => Navigator.pop(context, vm.pedidoFinal)
                    : null,

                child: Text("Guardar pedido"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
