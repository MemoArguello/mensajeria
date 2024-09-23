
enum YooEl { me, hers}
// enumeracion para poder identificar de quien es el mensaje

class Message {
  final String text;
  final String? imageUrl;
  final YooEl yooEl;
  
  Message({
    
    required  this.text, 
    this.imageUrl, 
    required this.yooEl
    });

}