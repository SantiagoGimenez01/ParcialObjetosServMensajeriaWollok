import chats.*
import mensajes.*
import contenidos.*

class Usuario{
    const memoriaDisponible
    var property memoriaUsada = 0
    const property nombre
    const property chats = []
    const property notificaciones = []

    method puedeAlmacenar(mensaje) = memoriaDisponible >= memoriaUsada + mensaje.peso()
    method enviar(mensaje, chat){
        if(chat.puedeEnviarMensaje(self, mensaje)){
            chat.almacenar(mensaje)
            chat.mandarNotificacion()
        }
        else
            throw new DomainException(message="El chat no puede almacenar el mensaje que se quiere enviar")
    }
    method almacenar(mensaje){
        memoriaUsada += mensaje.peso()
    }
    method busquedaDe(texto) = chats.filter({chat => chat.contiene(texto)})
    method agregarChat(chat) = chats.add(chat)
    method agregarA(alguien, chat){
        chat.agregarA(alguien)
        alguien.agregarChat(chat)
    }
    method mensajesMasPesados() = chats.map({chat => chat.elMasPesado()})
    
    
    method notificacion(chat) = notificaciones.add(chat)

    method leer(chat){
        notificaciones.removeAllSuchThat({notificacion => notificacion == chat})
    }

}