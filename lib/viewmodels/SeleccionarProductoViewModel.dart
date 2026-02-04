import '../models/producto.dart';

/// ViewModel para gestionar la selección de productos disponibles.
class SeleccionarProductoViewModel {

  /// Contiene la lista de productos disponibles.
  final List<Producto> productos = [
    Producto(nombreProducto: "Café Bombón", precio: 2.50),
    Producto(nombreProducto: "cola", precio: 1.50),
    Producto(nombreProducto: "te", precio: 1.30),
    Producto(nombreProducto: "infusion", precio: 1.30),
    Producto(nombreProducto: "cerveza", precio: 1.50),
    Producto(nombreProducto: "bocadillo", precio: 1.95),
  ];

  /// También contiene la lista de productos seleccionados
  final List<Producto> seleccionados = [];

  /// También proporciona un método para añadir o eliminar productos de la selección.
  void anadirEliminarProducto(Producto p) {
  // Si el producto ya está seleccionado, lo elimina, de lo contrario lo añade.
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
