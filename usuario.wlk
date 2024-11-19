class Usuario{
    const memoriaDisponible
    var property memoriaUsada = 0
    const property nombre

    method puedeAlmacenar(mensaje) = memoriaDisponible >= memoriaUsada + mensaje.peso()
    method enviar(mensaje, chat){
        if(chat.puedeEnviarMensaje(self, mensaje))
            chat.almacenar(mensaje)
        else
            throw new DomainException(message="El chat no puede almacenar el mensaje que se quiere enviar")
    }
    method almacenar(mensaje){
        memoriaUsada += mensaje.peso()
    }
}