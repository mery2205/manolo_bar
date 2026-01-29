import 'producto.dart';

class Pedido {
  final String nombreMesa;
  final List<Producto> productos;

  const Pedido({required this.nombreMesa, required this.productos});

  double get totalFinal {
    double suma = 0;
    for (var p in productos) {
      suma += p.precio;
    }
    return suma;
  }
}
