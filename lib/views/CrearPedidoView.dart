import 'package:flutter/material.dart';
import '../views/SeleccionarProductosView.dart';
import '../viewmodels/CrearPedidoViewModel.dart';

class CrearPedidoView extends StatefulWidget {
  const CrearPedidoView({super.key});

  @override
  State<CrearPedidoView> createState() => _CrearPedidoViewState();
}

class _CrearPedidoViewState extends State<CrearPedidoView> {
  final vm = CrearPedidoViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear pedido")),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Mesa/Nombre: "),
            onChanged: vm
                .setNombreMesa, 
          ),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final seleccionados = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SeleccionarProductosView()),
              );

              if (!mounted) return;

              if (seleccionados != null) {
                setState(() => vm.setProductos(seleccionados));
              }
            },
            child: Text("Añadir productos"),
          ),

          SizedBox(height: 20),

          // RESUMEN PROVISIONAL
          Text("Productos: ${vm.productosSeleccionados.length}"),
          Text("Total: ${vm.totalProvisional}€"),

          ElevatedButton(
            onPressed: () {
            Navigator.pushNamed(context, "/resumen", arguments: vm.pedidoFinal);
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
