


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/shared_widgets/conversation.dart';
import 'package:totr/shared_widgets/userx.dart';

import '../../../../shared_widgets/message.dart';

final chatProvider = Provider((ref) => ChatNotifier() );


class ChatNotifier extends ChangeNotifier {
  final usersProvider = FutureProvider<List<dynamic>>((ref) async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonString = await rootBundle.loadString('assets/Json/user.json');
    final jsonData = json.decode(jsonString);
    return jsonData['users'];
  });
  final searchQueryProvider = StateProvider<String>((ref) => '');
  final conversationOpen = StateProvider<bool>((ref) => false);
  final currentMessagingPartner = StateProvider<UserX>((ref) => UserX(conversation: Conversation(messages: [])));
  final currentConversation = StateProvider<Conversation>((ref) => Conversation(messages: []));
  final TextEditingController chatController =TextEditingController();

  final messagesProvider = StreamProvider<List<Message>>((ref)  {
    ChatNotifier chatNotifier =ref.watch(chatProvider);
    return ref.watch(chatNotifier.currentConversation).messageStream;
  });
}