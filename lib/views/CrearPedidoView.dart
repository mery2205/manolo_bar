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
      appBar: AppBar(
        title: Text("Crear pedido"),
        actions: [
          // Tooltip en botón de ayuda
          IconButton(
            icon: Icon(Icons.help_outline),
            tooltip: 'Asigna un nombre a la mesa y selecciona productos',
            onPressed: null,
          ),
        ],
      ),
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
          Tooltip(
            message: 'Elige los productos para este pedido',
            child: ElevatedButton(
              // Al presionarlo, navega a la vista SeleccionarProductosView y espera los productos seleccionados como resultado.
              onPressed: () async {
                if (vm.nombreMesa.trim().isEmpty) {
                  // ← MUESTRA SNACKBAR SOLO SI ESTÁ VACÍO
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        '⚠️ Escribe el nombre de la mesa primero',
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return; // ← IMPORTANTE: detiene la ejecución aquí (no navega)
                }
                
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
          ),

          SizedBox(height: 20),

          // RESUMEN PROVISIONAL
          /// Muestra el número de productos seleccionados y el total provisional del pedido.
          Text("Productos: ${vm.productosSeleccionados.length}"),
          Text("Total: ${vm.totalProvisional}€"),

          /// BOTON PARA VER RESUMEN
          ElevatedButton(
            /// Al presionarlo, navega a la vista de resumen del pedido, pasando el pedido final como argumento.
            onPressed: () {
              Navigator.pushNamed(
                context,
                // Ruta al ResumenFinalView
                "/resumen",

                /// Pasa el pedido final como argumento.
                arguments: vm.pedidoFinal,
              );
            },
            child: Text("Ver resumen"),
          ),

          Spacer(),

          // BOTONES CANCELAR Y GUARDAR
          /// Muestra dos botones: uno para cancelar y otro para guardar el pedido.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                /// Al presionarlo, vuelve a la pantalla anterior sin guardar.
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              ),

              Tooltip(
                message:
                    'Escribe el nombre de la mesa y añade productos para poder guardar el pedido',
                child: ElevatedButton(
                  /// Al presionarlo, guarda el pedido y vuelve a la pantalla anterior si el pedido es válido.
                  onPressed: vm.puedeGuardar
                      ? () => Navigator.pop(context, vm.pedidoFinal)
                      : null,

                  child: Text("Guardar pedido"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
