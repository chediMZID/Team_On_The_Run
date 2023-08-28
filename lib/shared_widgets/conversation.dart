
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:totr/shared_widgets/message.dart';

class Conversation extends ChangeNotifier {

  final _messagesController = StreamController<List<Message>>() ;
  Stream<List<Message>> get messageStream => _messagesController.stream;

  List<Message> messages = [];

  Conversation({required this.messages}){
    _messagesController.add(messages);
  }
  void addMessage (Message msg){
    messages.add(msg);
    _messagesController.add(messages);
    notifyListeners();
  }

}