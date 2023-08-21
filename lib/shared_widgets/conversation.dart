
import 'package:totr/shared_widgets/message.dart';

class Conversation {

  List<Message> messages;

  Conversation({required this.messages});

  void addMessage (Message msg){
    messages.add(msg);
  }

}