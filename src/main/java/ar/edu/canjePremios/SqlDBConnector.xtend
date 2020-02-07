package ar.edu.canjePremios

import java.sql.SQLException

class SqlDBConnector {
	
	// Este se conectaría con la base para determinar si está disponible
	def void query(Premio unPremio){
		obtenerConexion()
		if (!unPremio.estaDisponible) {
			// TODO: Esperar que haya un stored procedure en la base que tire una excepción
			throw new SQLException
		}
	}
	
	def obtenerConexion(){
		// TODO: Código SQL
	}
}