import camion.*
import cosas.*

object ruta9 {
  var property nivelDePeligrosidadPermitido = 20
  var property peso = 0
  
  method soportaCargaDe(camion) = camion.puedeCircular(nivelDePeligrosidadPermitido)
}

object caminosVecinales {
  var property nivelDePeligrosidadPermitido = 0

  var property peso = 0
  
  method soportaCargaDe(camion) = !camion.estaExcedidoDePeso(peso)
}