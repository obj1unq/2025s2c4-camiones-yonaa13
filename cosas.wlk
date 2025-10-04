object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	method bultos() = 1
}

object arenaAGranel {
	var property cantidad = 0
	var property estaEnbalado = false 
	
	method peso() = cantidad
	
	method nivelPeligrosidad() = 1
	
	method bultos() = if(!estaEnbalado) 1 else 2

}

object bumblebee {
	var transformado = false
	var property estaEnbalado = false 

	method peso() = 800
	
	method nivelPeligrosidad() {
		if (!transformado) {
			return 30
		} else {
			return 15
		}
	}
	
	method bultos() = if(!estaEnbalado) 2 else 3

}

object paqueteDeLadrillos {
	var property cantidad = 0 
	var property estaEnbalado = false 
	
	method peso() = cantidad * 2
	
	method nivelPeligrosidad() = 2
	
	method bultos() = if(cantidad <= 100) 1 else if(cantidad > 100 && cantidad <=300) 2 else 3 

}

object bateríaAntiaérea {
	var  property  bateriaEnMisiles = false
	var property estaEnbalado = false 
	
	method peso() = if (!bateriaEnMisiles) 200 else 300
	
	method nivelPeligrosidad() = if (!bateriaEnMisiles) 0 else 100

	method bultos() = if (!bateriaEnMisiles) 1 else 2
}

object residuoRadiactivo {
	var property cantidad = 0
	

	method peso() = cantidad
	
	method nivelPeligrosidad() = 200

	method bultos() = 1
}

object embalaje {
	var property pesoEmbalaje = 0
	var property cosa = null 
	method peso() = cosa.peso() 
	
	method embalaje() = cosa.nivelPeligrosidad() / 2

	method bultos() = cosa.bultos() + 1
  
}
object contenedorPortuario {
	var contenedor = #{}
	method cargar(unaCosa) {
		if (!contenedor.contains(unaCosa)) {
			contenedor.add(unaCosa)
		}
	}
	method peso() = contenedor.sum({ cosa =>  cosa.peso() }) + 100

	
	method nivelPeligrosidad() {
		if (contenedor.isEmpty()) {
			return 0
		} else {
			return contenedor.map({ cosa => cosa.nivelPeligrosidad() }).max()
		}
	}
	

	method bultos() = if (contenedor.isEmpty()) 1 else contenedor.sum({ cosa => cosa.bultos() }) + 1
}