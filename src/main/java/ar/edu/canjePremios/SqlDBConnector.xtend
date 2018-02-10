package ar.edu.canjePremios

import java.sql.SQLException

class SqlDBConnector {
	///Este se conectar�a con la base
	def void query(Premio unPremio){
		//obtiene la conexion
		obtenerConexion()
		
		//Envia el pedido 
		//En realidad la base genera un raiserror
		if (!unPremio.estaDisponible) {
			throw new SQLException
		}
	}
	
	def obtenerConexion(){
		///Codigo SQL
	}
}