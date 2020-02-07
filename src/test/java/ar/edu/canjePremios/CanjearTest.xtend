package ar.edu.canjePremios

import ar.edu.canjePremios.excepciones.NoTienePuntosSuficientesException
import ar.edu.canjePremios.mock.PremioNoDisponible
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertThrows

@DisplayName("Dado un cliente que tiene disponible ciertos puntos")
class CanjearTest {
	
	Cliente cliente

	@BeforeEach
	def void setup() {
		cliente = new Cliente(100)
	}

	@Test
	@DisplayName("puede canjear exitosamente un premio disponible al que puede acceder y se restan los puntos acumulados")
	def void canjearUnPremioExitosamente() {
		val premioCanjeable = new Premio(50, "remera", 0)
		cliente.canjearPremio(premioCanjeable)
		assertEquals(cliente.puntosAcumulados, 50)
	}

	@Test
	@DisplayName("no puede canjear un premio disponible que requiere más puntos (el cliente queda con los mismos puntos)")
	def void intentarCanjearUnPremioSinLosPuntosSuficientes() {
		val premioQueRequiereMasPuntos = new Premio(150, "pantalon", 0)
		assertThrows(NoTienePuntosSuficientesException, [ cliente.canjearPremio(premioQueRequiereMasPuntos) ])
		assertEquals(cliente.puntosAcumulados, 100) 
	}

	@Test
	@DisplayName("si intenta cambiar un premio que no está disponible se agrega a la wishlist del cliente")
	def void intentarCanjearUnPremioNoDisponibleYQueSeAgregueALaWishList() {
		assertEquals(cliente.listaDeseos.size, 0)
		val premioNoDisponible = new PremioNoDisponible(50, "buzo", 10)
		cliente.canjearPremio(premioNoDisponible)
		assertEquals(cliente.listaDeseos.size, 1)
	}
	
}