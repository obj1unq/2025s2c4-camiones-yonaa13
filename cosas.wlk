object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
}

object arenaAGranel {
	method peso(cantidad) = cantidad
	
	method nivelPeligrosidad() = 1
}

object bumblebee {
	var transformado = false
	
	method peso() = 800
	
	method nivelPeligrosidad() {
		if (!transformado) {
			return 30
		} else {
			return 15
		}
	}
}

object paqueteDeLadrillos {
	var cantidad = 0
	
	method peso() = cantidad * 2
	
	method nivelPeligrosidad() = 2
}

object BateríaAntiaérea {
	var bateriaEnMisiles = false
	
	method peso() = if (!bateriaEnMisiles) 200 else 300
	
	method nivelPeligrosidad() = if (!bateriaEnMisiles) 0 else 100
}

object residuoRadiactivo {
	var peso = null
	
	method peso() = peso
	
	method nivelPeligrosidad() = 200
}

object contenedorPortuario {
	var contenedor = #{}
	
	method peso() = contenedor.sum({ cosa => cosa.peso() }) + 100
	
	method nivelPeligrosidad() {
		if (contenedor.isEmpty()) {
			return 0
		} else {
			return contenedor.toList().map({ cosa => cosa.nivelPeligrosidad() }).max()
		}
	}
	
	method embalaje(cosa) = cosa.peso() / 2
}