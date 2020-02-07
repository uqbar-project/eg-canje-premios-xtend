package ar.edu.canjePremios

import java.sql.SQLException
import ar.edu.canjePremios.excepciones.NoHayStockException

class GestorDeStock {
	SqlDBConnector sqlDBConnector = new SqlDBConnector

	def setSqlDBConnector(SqlDBConnector conn) {
		sqlDBConnector = conn
	}

	def void actualizarStock(Premio unPremio) {
		// Este armaria la query con los parametros necesarios para 
		// llamar al sqlDBConnector
		try {
			// En realidad este pasaria la query
			sqlDBConnector.query(unPremio)
		} catch (SQLException e) {
			// Con un sp tiré raiserror y me llegó un SQLException
			// Wrap de la excepcion
			throw new NoHayStockException("No hay suficiente stock del producto " + unPremio.descripcion, e)
		}
	}
	
	def estaDisponible() {
		true
	}
	
}
