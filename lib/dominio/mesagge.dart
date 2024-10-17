class Message {
  final String text;
  final String? imageUrl; 
  final YooEl yooEl;
  final DateTime timestamp; 
  final bool isRead;

  // Constructor
  Message({
    required this.text,
    this.imageUrl,
    required this.yooEl,
    DateTime? timestamp, 
    required this.isRead,
  }) : timestamp = timestamp ?? DateTime.now(); 
}

// Enum para los remitentes de mensajes
enum YooEl { me, hers }
