package ar.edu.canjePremios

import ar.edu.canjePremios.excepciones.NoTienePuntosSuficientesException
import ar.edu.canjePremios.mock.PremioNoDisponible
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class CanjearTest {
	
	Cliente clienteQueTiene_100_Puntos

	@Before
	def void setup() {
		clienteQueTiene_100_Puntos = new Cliente(100)
	}

	@Test
	def void canjearUnPremioExitosamente() {
		val premioQueVale_50_Puntos = new Premio(50, "remera", 0)
		clienteQueTiene_100_Puntos.canjearPremio(premioQueVale_50_Puntos)
		Assert.assertEquals(clienteQueTiene_100_Puntos.puntosAcum, 50)
	}

	@Test(expected = typeof(NoTienePuntosSuficientesException))
	def void intentarCanjearUnPremioSinLosPuntosSuficientes() {
		val premioQueVale_150_Puntos = new Premio(150, "pantalon", 0)
		clienteQueTiene_100_Puntos.canjearPremio(premioQueVale_150_Puntos)
	}

	@Test
	def void intentarCanjearUnPremioNoDisponibleYQueSeAgregueALaWishList() {
		val premioNoDisponible = new PremioNoDisponible(50, "buzo", 10)
		clienteQueTiene_100_Puntos.canjearPremio(premioNoDisponible)
		Assert.assertEquals(clienteQueTiene_100_Puntos.listaDeseos.size, 1)
	}
	
}