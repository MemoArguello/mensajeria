import 'package:flutter/material.dart';


class MessageFieldBox extends StatelessWidget{

  final ValueChanged <String> onValue;



  const MessageFieldBox (
    {super.key, 
    required this.onValue
    });
  
  @override
  Widget build(BuildContext context) {


    //controles para el apartado de texto
    final textController = TextEditingController();
    //mantener abierto el foco,sin cerrar al terminar de escribir
    final FocusNode focusNode = FocusNode ();
    // habilitar borde con el color deseado
    final outlineInputBorder = UnderlineInputBorder(
        borderSide : const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40)
    );
  // se almacena todo el diseño de los inconos en un inputDecoration
    final inputDecoration = InputDecoration(
      // hind text de message
      hintText: 'Ingrese el mensaje deseado',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      //sub icon send
      suffixIcon: IconButton (
        // realizar el onPressed para que reaccione al presionar el boton, sino queda vacio
        icon: const Icon (Icons.send_outlined),
        onPressed: (){
          //optener el valor del texto ingresado
        final textValue = textController.value.text;
        // llamar al onValue
        onValue (textValue);
        textController.clear();
        },
      ),
    );
      // return dentro del TextFormField instanciando a inputdecoration
      return TextFormField(
      // crear funcionalidad para el ontap, al clickear afuera se minimiza
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller : textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
      //valor del submit
      onValue (value);
      //limpiar lo que se escribio
      textController.clear();
      //despues de limpiar que el foco permanezca abierto
      focusNode.requestFocus();

      },
      );
  
  }
 }