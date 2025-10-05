object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	
	method bultos() = 1
	
	method accidente() = null
}

object arenaAGranel {
	var property cantidad = 0
	
	method peso() = cantidad
	
	method nivelPeligrosidad() = 1
	
	method bultos() = 1
	
	method accidente() {
		cantidad += 20
	}
}

object bumblebee {
	var property transformado = false
	
	method peso() = 800
	
	method nivelPeligrosidad() {
		if (!transformado) {
			return 30
		} else {
			return 15
		}
	}
	
	method bultos() = 2
	
	method accidente() {
		transformado = !transformado
	}
}

object paqueteDeLadrillos {
	var property cantidad = 0
	
	method peso() = cantidad * 2
	
	method nivelPeligrosidad() = 2
	
	method bultos() = if (cantidad <= 100) {
		1
	} else {
		if ((cantidad > 100) && (cantidad <= 300)) 2 else 3
	}
	
	method accidente() = if (cantidad > 12) {
		cantidad -= 12
	} else {
		cantidad = 0
	}
}

object bateríaAntiaérea {
	var property bateriaEnMisiles = false
	
	method peso() = if (!bateriaEnMisiles) 200 else 300
	
	method nivelPeligrosidad() = if (!bateriaEnMisiles) 0 else 100
	
	method bultos() = if (!bateriaEnMisiles) 1 else 2
	
	method accidente() {
		bateriaEnMisiles = false
	}
}

object residuoRadiactivo {
	var property cantidad = 0
	
	method peso() = cantidad
	
	method nivelPeligrosidad() = 200
	
	method bultos() = 1
	
	method accidente() {
		cantidad += 15
	}
}

object embalaje {
	var property cosa = null
	
	method peso() = cosa.peso()
	
	method embalaje() = cosa.nivelPeligrosidad() / 2
	
	method bultos() = cosa.bultos() + 1
	
	method accidente() = null
}

object contenedorPortuario {
	const contenedor = #{}
	
	method cargar(unaCosa) {
		if (!contenedor.contains(unaCosa)) contenedor.add(unaCosa)
	}
	
	method peso() = contenedor.sum({ cosa => cosa.peso() }) + 100
	
	method nivelPeligrosidad() {
		if (contenedor.isEmpty()) {
			return 0
		} else {
			return contenedor.map({ cosa => cosa.nivelPeligrosidad() }).max()
		}
	}
	
	method bultos() = if (contenedor.isEmpty()) 1 else contenedor.sum({ cosa => cosa.bultos() }) + 1
	
	method accidente() = contenedor.forEach({ cosa => cosa.accidente() })
}