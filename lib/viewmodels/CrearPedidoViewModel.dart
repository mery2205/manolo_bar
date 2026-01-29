import '../models/producto.dart';
import '../models/pedido.dart';

class CrearPedidoViewModel {
  String nombreMesa = "";
  List<Producto> productosSeleccionados = [];

  void setNombreMesa(String value) {
    nombreMesa = value;
  }

  void setProductos(List<Producto> productos) {
    productosSeleccionados = productos;
  }

  double get totalProvisional {
    double suma = 0;
    for (var p in productosSeleccionados) {
      suma += p.precio;
    }
    return suma;
  }

  Pedido get pedidoFinal {
    return Pedido(nombreMesa: nombreMesa, productos: productosSeleccionados);
  }

  bool get puedeGuardar {
    return nombreMesa.trim().isNotEmpty && productosSeleccionados.isNotEmpty;
  }
}
