import '../models/producto.dart';

class SeleccionarProductoViewModel {
  final List<Producto> productos = [
    Producto(nombreProducto: "Café Bombón", precio: 2.50),
    Producto(nombreProducto: "cola", precio: 1.50),
    Producto(nombreProducto: "te", precio: 1.30),
    Producto(nombreProducto: "infusion", precio: 1.30),
    Producto(nombreProducto: "cerveza", precio: 1.50),
    Producto(nombreProducto: "bocadillo", precio: 1.95),
  ];

  final List<Producto> seleccionados = [];

  void anadirEliminarProducto(Producto p) {
    if (seleccionados.contains(p)) {
      seleccionados.remove(
        p,
      ); 
    } else {
      seleccionados.add(
        p,
      ); 
    }
  }
}
