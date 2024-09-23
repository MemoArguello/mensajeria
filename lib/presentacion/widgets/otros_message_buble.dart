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


class _ImageBubble extends StatelessWidget{
  
   // mandar la imagen url
   final String imageUrl;

  const _ImageBubble({ 
    required this.imageUrl
    });

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

   
    return ClipRRect(
      
      
    );
    
   }
  }