import modosDeCompresion.*

class Texto{
    const texto

    method peso() = texto.size()
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
    const usuario

    method peso() = 3
}