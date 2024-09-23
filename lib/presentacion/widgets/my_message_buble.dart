import 'package:flutter/material.dart';
import 'package:mensajeria/dominio/mesagge.dart';
import 'package:mensajeria/config/apptheme.dart';

class MyMessageBuble extends StatelessWidget{

  final Message message;
  // pasar los mensajes como parametros
  const MyMessageBuble ({
    super.key, 
    required this.message
    });
  

  @override
  Widget build(BuildContext context) {
 
    final appTheme = Apptheme(selectedColor: 2); // Asegúrate de usar el color correcto

  return Column(
   
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
     Container(
      decoration:  BoxDecoration(
      color: appTheme.selectedThemeColor, // Usa el color seleccionado,
     
      borderRadius: BorderRadius.circular(20)

      ),
     
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          //mensaje que se encuentra en el chat provider
          message.text, 
          style: const TextStyle(color : Colors.white)
          ,),
      ),
     ),
    
     const SizedBox(height: 10)
  ],  
  );
  }
  }