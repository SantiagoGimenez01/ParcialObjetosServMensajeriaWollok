import usuario.*
import mensajes.*
import contenidos.*

class Chat{
    const property mensajes = []
    const participantes = []

    method espacioQueOcupa() = mensajes.sum({mensaje => mensaje.peso()})
    method esMiembro(alguien) = participantes.contains(alguien)
    method todosPuedenAlmacenar(mensaje) = participantes.all({participante => participante.puedeAlmacenar(mensaje)})
    method puedeEnviarMensaje(alguien, mensaje) = self.esMiembro(alguien) && self.todosPuedenAlmacenar(mensaje)
    method almacenar(mensaje){
        mensajes.add(mensaje)
        participantes.forEach({participantes => participantes.almacenar(mensaje)})
    }
    method buscarEnElChat(texto){
        var mensajesEncontrados = []
        mensajesEncontrados = mensajes.filter({mensaje => mensaje.contieneTexto(texto)})
        return mensajesEncontrados
    }
}

class ChatPremium inherits Chat{
    const property creador
    const property limite
    const restriccion

    override method puedeEnviarMensaje(alguien, mensaje) = restriccion.permite(self, alguien, mensaje)
    method limiteAlcanzado() = mensajes.size() >= limite
}

class RestriccionAdicional{
    const pesoMax

    method permite(chat, miembro, mensaje) = self.esElCreador(chat, miembro) && self.hayEspacio(chat) && self.noSuperaPesoMaximo(chat, mensaje)
    method esElCreador(chat, miembro) = chat.creador() == miembro
    method hayEspacio(chat) = chat.limite() >= chat.mensajes().size()
    method noSuperaPesoMaximo(chat, mensaje) = mensaje.peso() <= pesoMax
}