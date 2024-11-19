import modosDeCompresion.*

class Texto{
    const property contiene

    method peso() = contiene.size()
}

class Audio{
    const duracion
    const pesoPorSegundo = 1.2

    method peso() = duracion * pesoPorSegundo
}

class Imagen{
    const ancho
    const alto
    const compresion = original
    const pesoPorPixel = 2

    method cantidadDePixeles() = ancho * alto
    method peso() = compresion.comprimir(self.cantidadDePixeles()) * pesoPorPixel
}

class Gif inherits Imagen{
    const cuadros

    override method peso() = super() * cuadros
}

class Contacto{
    const property contiene

    method peso() = 3
}