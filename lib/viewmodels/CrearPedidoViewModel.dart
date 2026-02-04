import '../models/producto.dart';
import '../models/pedido.dart';


/// ViewModel para gestionar la creación de un nuevo pedido.
class CrearPedidoViewModel {

/// Contiene el nombre de la mesa y los productos seleccionados.
  String nombreMesa = "";
  List<Producto> productosSeleccionados = [];

  void setNombreMesa(String value) {
    nombreMesa = value;
  }

  void setProductos(List<Producto> productos) {
    productosSeleccionados = productos;
  }

/// Calcula el total provisional del pedido basado en los productos seleccionados.
  double get totalProvisional {
    double suma = 0;
    for (var p in productosSeleccionados) {
      suma += p.precio;
    }
    return suma;

  }

/// Genera el pedido final con el nombre de la mesa y los productos seleccionados.
  Pedido get pedidoFinal {
    return Pedido(nombreMesa: nombreMesa, productos: productosSeleccionados);
  }

/// Verifica si el pedido puede ser guardado (nombre de mesa no vacío y productos seleccionados).
  bool get puedeGuardar {
    return nombreMesa.trim().isNotEmpty && productosSeleccionados.isNotEmpty;
  }
}
