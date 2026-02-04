import 'producto.dart';

/// Modelo que representa un pedido realizado en una mesa.
class Pedido {

/// Contiene el nombre de la mesa y la lista de productos.
  final String nombreMesa;
  final List<Producto> productos;

  const Pedido({required this.nombreMesa, required this.productos});

/// También proporciona un método para calcular el total final del pedido.
  double get totalFinal {
    double suma = 0;
    for (var p in productos) {
      suma += p.precio;
    }
    return suma;
  }
}
