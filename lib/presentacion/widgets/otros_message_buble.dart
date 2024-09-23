import 'package:flutter/material.dart';
import 'package:mensajeria/dominio/mesagge.dart';

class OtrosMessaheBuble extends StatelessWidget{
  const OtrosMessaheBuble ({
    super.key, 
    required this.message
    });

  // construir propiedades para el mensaje
  final Message message;  
  
  @override
  Widget build(BuildContext context) {
  final colors = Theme.of (context).colorScheme;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     Container(
      decoration:  BoxDecoration(
      color: colors.secondary,
      borderRadius: BorderRadius.circular(20)

      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text( message.text,
        style: const TextStyle(color : Colors.white),
        ),
      ),
     ),
     const SizedBox(height: 5),
     //mandar el imageUrl
     _ImageBubble(imageUrl: message.imageUrl!),
     const SizedBox(height: 10),
  ],  
  );
  }
  }


class _ImageBubble extends StatelessWidget {
  // Recibir la URL de la imagen
  final String imageUrl;

  const _ImageBubble({ 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15), // Opcional, para esquinas redondeadas
      child: Image.network(
        imageUrl,
        width: size.width * 0.7, // Ajusta el ancho a un 70% del ancho de la pantalla
        height: 200, // Fija una altura para las imágenes
        fit: BoxFit.cover, // Ajusta la imagen para que cubra todo el espacio disponible
        errorBuilder: (context, error, stackTrace) {
          // En caso de que haya un error al cargar la imagen
          return const Text('Error al cargar la imagen');
        },
      ),
    );
  }
}
