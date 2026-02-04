import 'package:manolo_bar/models/producto.dart';
import '../models/pedido.dart';

/// ViewModel para gestionar la lista de pedidos realizados.
class HomeViewModel {

  /// Contiene la lista de pedidos realizados.
  final List<Pedido> pedidos = [
    Pedido(
      nombreMesa: "Mesa 1",
      productos: [
        Producto(nombreProducto: "Café Bombón", precio: 3.20),
        Producto(nombreProducto: "Té", precio: 1.50),
      ],
    ),
  ];

/// También proporciona un método para añadir un nuevo pedido a la lista.
  void anadirPedidoNuevo(Pedido pedidouNuevo) {
    pedidos.add(pedidouNuevo);
  }
}
