import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mensajeria/dominio/mesagge.dart';
import 'package:mensajeria/presentacion/provider/chat_provider.dart';
import 'package:mensajeria/presentacion/widgets/my_message_buble.dart';
import 'package:mensajeria/presentacion/widgets/otros_message_buble.dart';
import 'package:mensajeria/presentacion/widgets/shared/message_field_box.dart';
import 'dart:io';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Acceder al provider
    final chatProvider = context.watch<ChatProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: _buildImageProvider(chatProvider.contactIconUrl),
          ),
        ),
        title: Text(chatProvider.contactName), // Nombre dinámico del contacto
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Llamar a una función que abra un diálogo para cambiar el nombre y el ícono
              _showEditContactDialog(context, chatProvider);
            },
          )
        ],
      ),
      body: _ChatView(),
    );
  }

  // Construye el ImageProvider con la URL o una imagen por defecto
  ImageProvider _buildImageProvider(String url) {
    if (url.isEmpty || (Uri.tryParse(url)?.isAbsolute != true)) {
      return const AssetImage('assets/default_avatar.png'); // Imagen por defecto
    }
    else if (url.startsWith('http') || url.startsWith('https')) {
      return NetworkImage(url);
    } else {
      return FileImage(File(url));
    }
  }

  // Mostrar diálogo para cambiar el nombre e ícono
  void _showEditContactDialog(BuildContext context, ChatProvider chatProvider) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController iconController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Editar Contacto"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nuevo Nombre"),
              ),
              TextField(
                controller: iconController,
                decoration: const InputDecoration(labelText: "URL del Nuevo Ícono"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                // Llamar a updateContact con los nuevos valores
                chatProvider.updateContact(
                  nameController.text.isEmpty ? chatProvider.contactName : nameController.text,
                  iconController.text.isEmpty ? chatProvider.contactIconUrl : iconController.text,
                );

                // Limpiar los controladores
                nameController.clear();
                iconController.clear();

                Navigator.pop(context); // Cerrar el diálogo
              },
              child: const Text("Guardar"),
            ),
          ],
        );
      },
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.yooEl == YooEl.hers)
                      ? OtrosMessaheBuble(message: message)
                      : MyMessageBuble(message: message);
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
