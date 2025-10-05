import camion.*
import cosas.*

object almacen {
  var property cosasEnAlmacen = #{}
  
  method cargarEnAlmacen(unaCosa) = if (!cosasEnAlmacen.contains(unaCosa)) cosasEnAlmacen.add(unaCosa)
  
  method guardarCarga(cosas) {
    const cosasAGuardar = [cosasEnAlmacen, cosas].flatten().asSet()
    cosasEnAlmacen = cosasAGuardar
  }
}