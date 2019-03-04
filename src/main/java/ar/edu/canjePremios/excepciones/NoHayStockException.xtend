package ar.edu.canjePremios.excepciones

class NoHayStockException extends RuntimeException {

	new(String msg, Exception exception) {
		super(msg, exception)
	}

}
