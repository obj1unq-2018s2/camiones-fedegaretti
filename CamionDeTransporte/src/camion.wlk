import cosas.*

object camion {

	var carga = []
	const tara = 1000

	method cargar(cosa) = carga.add(cosa)

	method descargar(cosa) = carga.remove(cosa)

	method pesoTotal() = tara + carga.sum{ cosa => cosa.peso() }

	method excedidoDePeso() = self.pesoTotal() > 2500

	method objetosPeligrosos(n) = carga.filter{ cosa => cosa.peligrosidad() > n }

	method objetosMasPeligrososQue(cosa) = carga.filter{ objeto => objeto.peligrosidad() > cosa.peligrosidad() }

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = !carga.any{ cosa => cosa.peligrosidad() > nivelMaximoPeligrosidad}

}

