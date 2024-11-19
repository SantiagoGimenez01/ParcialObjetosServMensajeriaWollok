object original{
    method comprimir(pixeles) = pixeles
}

class Variable{
    const porcentaje

    method comprimir(pixeles) = pixeles * porcentaje/100
}

object maxima{
    
    method comprimir(pixeles) = pixeles.min(10000)
}