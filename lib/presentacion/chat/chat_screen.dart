import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mensajeria/dominio/mesagge.dart';
import 'package:mensajeria/presentacion/provider/chat_provider.dart';
import 'package:mensajeria/presentacion/widgets/my_message_buble.dart';
import 'package:mensajeria/presentacion/widgets/otros_message_buble.dart';
import 'package:mensajeria/presentacion/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget{
  const ChatScreen ({super.key});
  @override
  Widget build (BuildContext context){
    return  Scaffold(
    appBar: AppBar(
    leading: const Padding(

    padding: EdgeInsets.all(5.0),
  
    child: CircleAvatar(
   
    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYrXJbwhwO94iECP0qUzvI3aTU55n4PLRSqQ&s'),
    )
    ),
    title: const Text ("Contacto 1 ♥"),
    centerTitle: false,
    ),
   
   
    body: _Chatview(),

    );
  }
}

class _Chatview extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   //referencia al provider
  // PENDINTES A LOS CAMBIOS QUE OCURREN EN LA CLASE 
   
   final chatProvider = context.watch<ChatProvider>();
  



    return SafeArea(
      child: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
        children: [
         Expanded(
          // dentro del listview se encuentra el scroll
          child: ListView.builder(
          // enlazar con el scrollcontroller
          controller: chatProvider.chatScrollController,
          // saber cuantos mensajes hay
          itemCount: chatProvider.messageList.length,
          itemBuilder: (context, index){
          
          final message = chatProvider.messageList[index];

          //identificar de quien es el mensaje para mandar la condicion de abrir la clase
          return (message.yooEl == YooEl.hers)
          ? OtrosMessaheBuble(message: message)
          //llamar al nuevo mensaje
          : MyMessageBuble( message : message);

          })
         ),
        // ya no puede ser constante por que me pide proporcionar el onvalue
          MessageFieldBox(
            //llamar al sendMessage que se encuentra en el provider
            onValue: (value) => chatProvider.sendMessage(value),

          ),
        ],
        ),
      ),
    );
  }
}