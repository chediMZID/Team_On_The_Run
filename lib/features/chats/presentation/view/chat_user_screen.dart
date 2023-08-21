
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/chats/presentation/view/chat_user_header.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/shared_widgets/userx.dart';

import 'chat_user_body.dart';



class ChatUserScreen extends ConsumerWidget {
  late UserX user;
   ChatUserScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ChatNotifier chatNotifier = ref.watch(chatProvider);
    user = ref.watch(chatNotifier.currentMessagingPartner);
    print(user.name);
    return Scaffold(
      appBar: ChatUserHeader(),
      body: ChatUserBody(),
    );
  }
}
