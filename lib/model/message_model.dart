class MessageModel {
  final String message;
  final String sender;

  MessageModel({
    required this.message,
    required this.sender,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json['message'],
        sender: json['sender'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'sender': sender,
      };
}
