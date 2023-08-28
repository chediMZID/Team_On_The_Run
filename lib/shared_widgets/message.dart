

class Message {
  //final String sender;
  final String text;
  final DateTime time;
  final bool isUser;

  Message({ required this.text, required this.time, required this.isUser});

  factory Message.fromJson(Map<String,dynamic> json){
    return Message(
        text: json['text'],
        time:DateTime.now(),
        isUser: json['sent']
    );
  }
}


