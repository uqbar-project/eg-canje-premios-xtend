package ar.edu.canjePremios

import ar.edu.canjePremios.excepciones.NoHayStockException
import ar.edu.canjePremios.excepciones.NoTienePuntosSuficientesException
import org.eclipse.xtend.lib.annotations.Accessors

class Cliente {

	@Accessors var int puntosAcumulados
	@Accessors(PUBLIC_GETTER) val listaDeseos = newArrayList

	new(int puntos) {
		this.puntosAcumulados = puntos
	}

	def restarPuntos(Premio unPremio) {
		this.validarPuntosSuficientes(unPremio)
		puntosAcumulados = puntosAcumulados - unPremio.valor
	}

	def canjearPremio(Premio unPremio) {
		try {
			unPremio.canjear
		} catch (NoHayStockException e) {
			//manejar la excepcion por una regla de negocio
			this.agregarAListaDeDeseos(unPremio)
		}
		this.restarPuntos(unPremio)
	}

	def private void validarPuntosSuficientes(Premio unPremio) {
		if (!tienePuntosSuficientesPara(unPremio))
			throw new NoTienePuntosSuficientesException("No se tiene suficientes puntos para " + unPremio.descripcion)
	}

	def private tienePuntosSuficientesPara(Premio unPremio) {
		puntosAcumulados >= unPremio.valor
	}

	def private void agregarAListaDeDeseos(Premio unPremio) {
		listaDeseos.add(unPremio)
	}

}
