import 'package:manolo_bar/models/producto.dart';
import '../models/pedido.dart';

class HomeViewModel {
  final List<Pedido> pedidos = [
    Pedido(
      nombreMesa: "Mesa 1",
      productos: [
        Producto(nombreProducto: "Café Bombón", precio: 3.20),
        Producto(nombreProducto: "Té", precio: 1.50),
      ],
    ),
  ];

  void anadirPedidoNuevo(Pedido pedidouNuevo) {
    pedidos.add(pedidouNuevo);
  }
}
