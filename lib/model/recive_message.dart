class ChatMessage {
  String name;
  String message;

  ChatMessage({required this.name, required this.message});

  // Optional: Factory constructor for JSON deserialization
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      name: json['name'],
      message: json['message'],
    );
  }

  // Optional: Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
    };
  }
}
