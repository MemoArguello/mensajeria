import 'package:flutter/material.dart';
import 'package:mensajeria/config/helpers/get_answer.dart';
import 'package:mensajeria/dominio/mesagge.dart';
import 'package:image_picker/image_picker.dart'; // Importar el paquete

// Clase para que el provider notifique cuando recibimos cambios
class ChatProvider extends ChangeNotifier {
  String contactName = "ChatGPT";
  String contactIconUrl =
      'https://static.vecteezy.com/system/resources/previews/021/608/790/non_2x/chatgpt-logo-chat-gpt-icon-on-black-background-free-vector.jpg';
  
  // Controlador del ImagePicker
  final ImagePicker _picker = ImagePicker();

  // Método para seleccionar una imagen desde la galería
  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Convertir a URL o usar archivo local
      contactIconUrl = pickedFile.path; // Esto es una ruta local
      notifyListeners(); // Notificar a los widgets que escuchen el provider
    }
  }

  void updateContact(String newName, String newIconUrl) {
    contactName = newName;
    contactIconUrl = newIconUrl;
    notifyListeners();
  }

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

    // Crear el mensaje del usuario
    final newMessage = Message(
      text: text, 
      yooEl: YooEl.me, 
      timestamp: DateTime.now(), 
      isRead: true
    );
    messageList.add(newMessage);

    // Llamar a herReply solamente si es una pregunta
    if (text.endsWith('?')) {
      await herReply();
    } else {
      // Si no es una pregunta, generar un mensaje automatizado personalizado
      final autoResponse = Message(
        text: "No me hiciste ninguna pregunta", 
        yooEl: YooEl.hers,
        timestamp: DateTime.now(),
        isRead: true,
      );
      // Agregar el mensaje automatizado a la lista
      messageList.add(autoResponse);
    }

    // Notificar cambios a los listeners
    notifyListeners();

    // Mover el scroll al final
    moveScrollToBottom();
  }

  // Método para generar la respuesta automática
  Future<void> herReply() async {
    final herMessage = await getAnswer.getAnswer();

    // Crear el mensaje de respuesta
    final herMessageWithSender = Message(
      text: herMessage.text,
      imageUrl: herMessage.imageUrl,
      yooEl: YooEl.hers,
      timestamp: DateTime.now(),
      isRead: true,
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
      curve: Curves.easeOut,
    );
  }
}
