
//https://app.quicktype.io/ , convierto a peticion del postman y copia en mi visual


import 'package:mensajeria/dominio/mesagge.dart';

class GetYesNoModel {
    final String answer;
    final bool forced;
    final String image;

    GetYesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    // Cambiar a fromJson Map
    factory GetYesNoModel.fromJsonMap(Map<String, dynamic> json) => GetYesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"], 
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    // Método para convertir el modelo a un mensaje en español
    Message toMessageEntity(YooEl yooEl) {
        return Message(
          text: answer == 'yes' ? 'Sí' : 'No',  // Traducción simple del "yes" o "no"
          imageUrl: image,
          yooEl: yooEl,  // Se pasa el valor de YooEl
        );
    }
}


