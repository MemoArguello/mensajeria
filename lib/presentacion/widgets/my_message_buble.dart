import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatear la fecha
import 'package:mensajeria/dominio/mesagge.dart';
import 'package:mensajeria/config/apptheme.dart';

class MyMessageBuble extends StatelessWidget {
  final Message message;

  const MyMessageBuble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Apptheme(selectedColor: 1); // Usa el color correcto

    // Formatear la hora del mensaje (asegúrate de que Message tenga un campo de tipo DateTime para timestamp)
    final String formattedTime = DateFormat('HH:mm').format(message.timestamp);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // Alinea el mensaje hacia la derecha
      children: [
        Container(
          decoration: BoxDecoration(
            color: appTheme.selectedThemeColor, // Usa el color seleccionado
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, // Mensaje del chat
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min, // Alinea el contenido lo más pequeño posible
          children: [
            Text(
              formattedTime, // Muestra la hora formateada
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.done_all, // Ícono de doble check
              size: 18,
              color: message.isRead ? Colors.blue : Colors.grey, // Azul si fue leído, gris si no
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
