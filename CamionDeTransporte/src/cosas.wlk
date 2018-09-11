/*
 Knight Rider : pesa 500 kilos y su nivel de peligrosidad es 10
Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en
	auto o 30 si está como robot.
Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene
	puede variar. La peligrosidad es 2
Arena a granel: El peso es variable. La peligrosidad es 1
Batería antiaérea : El peso es 300 kilos si está con los misiles o 200 en otro caso.
	En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.
Contenedor portuario: Un contenedor puede tener otras cosas adentro. El peso es
	100 + la suma de todas las cosas que esté adentro. Es tan peligroso como el objeto
	más peligroso que contiene. Si está vacío es 0.
Residuos radioactivos: El peso es variable y su peligrosidad es 200
Embalaje de seguridad: Es una cobertura que envuelve a cualquier otra cosa. El
	peso es el peso de la cosa que tenga adentro. El nivel de peligrosidad es la mitad
	del nivel de peligrosidad de lo que envuelve. */
object knightRider {
	method peso() = 500
	method peligrosidad() = 10
}
object bumbleBee{
	var property esAuto = false
	method peso() = 800
	method peligrosidad() = if(esAuto) 15 else 30
		
	
}
object ladrillos{
	var property cantLadrillos = 2
	method peso() = cantLadrillos*2
	method peligrosidad() = 2 
}
object arena{
	var property peso
	method peligrosidad()= 1	
}
object bateriaAntiaerea{
	var property estaCargada = true
	method peso() = if (estaCargada) 300 else 200
	method peligrosidad() = if (estaCargada) 100 else 0
}
object contenedorPortuario{
	var property cosas = [bumbleBee, knightRider, bateriaAntiaerea ]
	method peso() = 100 + cosas.sum({cosa => cosa.peso()})
	method peligrosidad() = cosas.max({cosa =>cosa.peligrosidad()}).peligrosidad()
}
object residuosRadioactivos{
	var property peso
	method peligrosidad()=200
}
object embalajeDeSeguridad{
	var property cosa
	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad()/2
}
object deposito {
	var property cosas = [knightRider, bumbleBee, bateriaAntiaerea]
	
	method cargarCamion(camion){
		cosas.forEach({cosa => camion.cargar(cosa)})
	}
}
