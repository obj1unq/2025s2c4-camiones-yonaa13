import cosas.*

object camion {
	var property cosas = #{}
	var property capacidad = 1700
	
	method tieneCargado(unaCosa) = cosas.contains(unaCosa)
	
	method cargar(unaCosa) {
		if ((!cosas.contains(unaCosa)) && (unaCosa.peso() <= capacidad)) {
			cosas.add(unaCosa)
			capacidad -= unaCosa.peso()
		}
	}
	
	method descargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			cosas.remove(unaCosa)
			capacidad += unaCosa.peso()
		}
	}
}