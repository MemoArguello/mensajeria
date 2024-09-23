import 'package:flutter/material.dart';
import 'package:mensajeria/config/helpers/get_answer.dart';
import 'package:mensajeria/dominio/mesagge.dart';
import 'package:image_picker/image_picker.dart'; // Importar el paquete

// Clase para que el provider notifique cuando recibimos cambios
class ChatProvider extends ChangeNotifier{
  String contactName = "Contacto 1 ♥";
  String contactIconUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYrXJbwhwO94iECP0qUzvI3aTU55n4PLRSqQ&s';
  // Controlador del ImagePicker
  final ImagePicker _picker = ImagePicker();
  
  // Método para seleccionar una imagen desde la galería
  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

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