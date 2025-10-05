import cosas.*
import almacen.*
import camino.*

object camion {
	var property cosas = #{}
	var property capacidad = 22500
	const tara = 1000
	
	
	method cargar(unaCosa) {
		if ((cosas.contains(unaCosa)) || (unaCosa.peso() > capacidad)) {
			self.error("No se puede cargar algo ya cargado")
		}else{ 
			cosas.add(unaCosa)
			capacidad -= unaCosa.peso()
		}
	}
	
	method descargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			cosas.remove(unaCosa)
			capacidad += unaCosa.peso()
		}else{
			self.error("No se puede descargar algo que no está cargado")
		}	
	}
	
	method esCamionConPesoPar() {
		var suma = 0
		cosas.map({ cosa => suma += cosa.peso() })
		return (suma % 2) == 0
	}
	
	method hayUnaCargaConPeso(cantidad) = cosas.any({ cosa => cosa.peso() == cantidad })
	
	method estaExcedidoDePeso(cantidad) {
		var suma = 0
		cosas.forEach({ cosa => suma += cosa.peso() })
		return (suma + tara) > cantidad
	}
	
	method conNivelDePeligrosidad(nivelPeligrosidad) = cosas.find(
		{ cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad }
	)
	
	method tieneMayorNivelDePeligrosidad(nivelPeligrosidad) = cosas.filter(
		{ cosa => cosa.nivelPeligrosidad() > nivelPeligrosidad }
	).asSet()
	
	method conMayorNivelDePeligrosidadQue(otraCosa) = self.tieneMayorNivelDePeligrosidad(
		otraCosa.peso()
	)
	


	method puedeCircular(nivelPeligrosidad) = (!self.estaExcedidoDePeso(2500)) && (self.tieneMayorNivelDePeligrosidad(nivelPeligrosidad) == #{})
	
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
	
	method llegoADestino(lugar) {
		lugar.guardarCarga(cosas)
		cosas.clear()
	}
	
	method transportar(destino, camino) {
		if (camino.soportaCargaDe(self))
		 {
			self.llegoADestino(destino)
		 }
	}
}