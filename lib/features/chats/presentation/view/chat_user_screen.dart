
import 'package:flutter/material.dart';
import 'package:totr/features/chats/presentation/view/chat_user_header.dart';



class ChatUserScreen extends StatelessWidget {
  const ChatUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatUserHeader(),
    );
  }
}
