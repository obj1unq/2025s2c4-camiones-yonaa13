import cosas.*
import almacen.*

object camion {
	var property cosas = #{}
	var property capacidad = 22500
	const tara = 1000
	
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
	
	method esCamionConPesoPar() {
		var suma = 0
		cosas.map({ cosa => suma += cosa.peso() })
		return (suma % 2) == 0
	}
	
	method hayUnaCargaConPeso(cantidad) = cosas.any({ cosa => cosa.peso() == cantidad })
	
	method estaExcedidoDePeso() {
		var suma = 0
		cosas.forEach({ cosa => suma += cosa.peso() })
		return (suma + tara) > 2500
	}
	
	method nivelDePeligrosidad(predicado) = cosas.any({ predicado })
	
	method conNivelDePeligrosidad(nivelPeligrosidad) = self.nivelDePeligrosidad(
		{ cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad }
	)
	
	method tieneMayorNivelDePeligrosidad(nivelPeligrosidad) = self.nivelDePeligrosidad(
		{ cosa => cosa.nivelPeligrosidad() > nivelPeligrosidad }
	)
	
	method conMayorNivelDePeligrosidadQue(otraCosa) = self.tieneMayorNivelDePeligrosidad(
		otraCosa.peso()
	)
	
	method puedeCircular(
		nivelPeligrosidad
	) = (!self.estaExcedidoDePeso()) && (!self.tieneMayorNivelDePeligrosidad(nivelPeligrosidad))
	
	method pesaEntre(pesoMinimo, pesoMaximo) = cosas.any(
		{ cosa => (cosa.peso() >= pesoMinimo) && (cosa.peso() <= pesoMaximo) }
	)
	
	method cosaMasPesadaDelCamion() {
		if (cosas.isEmpty()) {
			return null
		} else {
			return cosas.max({ cosa => cosa.peso() })
		}
	}
	
	method pesoDeCadaCosaDelCamion() = cosas.map({ cosa => cosa.peso() })
	
	method cantidadDeBultosDelCamion() = cosas.sum({ cosa => cosa.bultos() })
	
	method camionAccidentado() = cosas.forEach({ cosa => cosa.accidente() })
	
	method llagoAlAlmacen() {
		almacen.guardarCarga(cosas)
		cosas.clear()
	}
}