import 'package:flutter/material.dart';
import 'package:mensajeria/config/helpers/get_answer.dart';
import 'package:mensajeria/dominio/mesagge.dart';

// Clase para que el provider notifique cuando recibimos cambios
class ChatProvider extends ChangeNotifier{

  // Instancia de la clase GetAnswer
  final GetAnswer getAnswer = GetAnswer();
  
  // Scroll controller
  final ScrollController chatScrollController = ScrollController();

  // Lista de mensajes
  List<Message> messageList = [];

  // Método para enviar mensajes remitidos por el usuario
  Future<void> sendMessage(String text) async {
    // Validación para evitar mensajes vacíos
    if (text.isEmpty) return;

    final newMessage = Message(text: text, yooEl: YooEl.me);
    messageList.add(newMessage);

    // Llamar a herReply solamente si es una pregunta
    if (text.endsWith('?')) {
      await herReply();
    }

    // Notificar cambios a los listeners
    notifyListeners();
    
    // Mover el scroll al final
    moveScrollToBottom();
  }

  // Método para generar la respuesta automática
  Future<void> herReply() async {
    final herMessage = await getAnswer.getAnswer();
    
    // Agregar el remitente 'hers' al mensaje
    final herMessageWithSender = Message(
      text: herMessage.text,
      imageUrl: herMessage.imageUrl,
      yooEl: YooEl.hers
    );

    // Agregar el mensaje a la lista
    messageList.add(herMessageWithSender);

    // Notificar cambios
    notifyListeners();

    // Mover el scroll al final
    moveScrollToBottom();
  }

  // Función para mover el scroll al final
  void moveScrollToBottom() async {
    // Esperar un pequeño delay para asegurarse de que el scroll funcione bien
    await Future.delayed(const Duration(milliseconds: 100));

    // Animar el scroll hacia la parte inferior
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }
}