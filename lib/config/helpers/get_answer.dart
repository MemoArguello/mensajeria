

import 'package:dio/dio.dart';
import 'package:mensajeria/dominio/mesagge.dart';
import 'package:mensajeria/infraestructura/get_yes_no_model.dart';

class GetAnswer {

  // nueva propiedad a instanciar
  final _dio = Dio ();

 // metodo que va a regresar mensajes de respuesta
 // comando para instalar dio dart pub add dio
Future <Message> getAnswer() async {
  // Declarar el URL que quiero llamar como respuesta
  final response = await _dio.get('https://yesno.wtf/api');
  
  // Llamar al mapper de json
  final getYesNoModel = GetYesNoModel.fromJsonMap(response.data);

  // Proporcionar el valor de YooEl, aquí puedes usar lógica para decidir si es 'me' o 'hers'
  final yooEl = YooEl.me;  // O cambiar a YooEl.hers según tu lógica

  return getYesNoModel.toMessageEntity(yooEl); 
}


}