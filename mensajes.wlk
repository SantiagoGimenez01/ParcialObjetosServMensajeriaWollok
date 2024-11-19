class Mensaje{
  const emisor
  const property datosFijosDeTransferencia = 5
  const property factorDeRed = 1.3
  const contenido
  
  method peso() = datosFijosDeTransferencia + contenido.peso() * factorDeRed
}