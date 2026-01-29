import 'package:flutter/material.dart';
import '../views/CrearPedidoView.dart';
import '../viewmodels/HomeViewModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final vm = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pedidos del bar")),

      body: ListView.builder(

        itemCount: vm
            .pedidos
            .length, 
        itemBuilder: (context, index) {
          
          final p = vm.pedidos[index]; 
          return ListTile(
           
            title: Text(p.nombreMesa),
            subtitle: Text("Productos: ${p.productos.length}"),
            trailing: Text("${p.totalFinal.toStringAsFixed(2)} euros"),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
        
          final nuevo = await Navigator.push(
            
            context, 
            MaterialPageRoute(
              builder: (_) => CrearPedidoView(),
            ), 
          );

          if (!mounted) {
            
            return; 
          }

          if (nuevo != null) {
           
            setState(
              () => vm.anadirPedidoNuevo(nuevo),
            ); 
          }
        },
      ),
    );
  }
}
