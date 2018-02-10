package ar.edu.canjePremios

import org.eclipse.xtend.lib.annotations.Accessors

class Premio {
	@Accessors int valor
	int nivelPopularidad
	String descripcion
	@Accessors GestorDeStock gestorDeStock = new GestorDeStock
	
	new(int unValor, String unaDesc, int popularidad){
		this.valor = unValor
		this.descripcion = unaDesc
		this.nivelPopularidad = popularidad
	}
	
	def getDescripcion(){
		descripcion
	}
	
	def setConsultorDeStock(GestorDeStock c){
		gestorDeStock = c
	}
	
	def canjear(){
		gestorDeStock.actualizarStock(this)
		aumentarPopularidad
	}
	
	def aumentarPopularidad() {
		nivelPopularidad = nivelPopularidad + 1
	}
	
	def estaDisponible() {
		gestorDeStock.estaDisponible
	}

}