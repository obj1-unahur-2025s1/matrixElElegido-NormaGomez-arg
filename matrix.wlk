object neo {
  var energia =100   
  method esElElegido()= true
  method saltar() {
    energia = energia * 0.5
     }

  method vitalidad ()= energia * 0.1    
  method recuperaSuEnergia() {
    energia = 100
  }
    }
    object morfeo {
    var vitalidad = 8
    var estaDescansando = true

  method esElElegido()= false
  method saltar() {
    estaDescansando = not estaDescansando
    vitalidad = (vitalidad - 1). max (0)
     }

  method vitalidad ()= vitalidad    
    }
object trinity {
 
  method esElElegido()= false
  method saltar() {
         }

  method vitalidad ()= 0
    }    

object nave {
    const pasajeros = #{neo,morfeo,trinity}
    method cuantosPasajerosHay() = pasajeros.size()
    method pasajeroMayorVitalidad() = pasajeros.max({p=>p.vitalidad()})
    method pasajeroMenorVitalidad() = pasajeros.min({p=>p.vitalidad()})
    method estaEquilibrada() {
      return self.pasajeroMayorVitalidad().vitalidad() < self.pasajeroMenorVitalidad().vitalidad() * 2
    }
    method estaElElegido() = pasajeros.any({p=>p.esElElegido()})
    method chocar() {
      pasajeros.forEach({p=>p.saltar()})
      pasajeros.clear()
    }
    method acelerar() {
      pasajeros.filter({p=>not p.esElElegido()}).forEach({p=>p.saltar()})
      pasajeros.remove(neo)
    }
}


