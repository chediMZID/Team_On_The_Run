
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/shared_widgets/conversation.dart';
import 'package:totr/shared_widgets/message.dart';
import 'package:totr/shared_widgets/message_bubble.dart';


class ChatUserBody extends ConsumerWidget {
  /*final List<Message> messages = [
    Message(sender: 'John', text: "Hello! How are you brother ? I haven't seen you for a longtime" , time: DateTime.now(), isUser: false),
    Message(sender: 'You', text: 'Hi there!', time: DateTime.now().add(Duration(minutes: 5)), isUser: true),
  ];*/
   ChatUserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ChatNotifier chatNotifier = ref.watch(chatProvider);
    return Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context,r,child){
                ChatNotifier chn =ref.watch(chatProvider);
                final messages =r.watch(chn.currentConversation).messages;
                return ListView.builder(
                  itemCount: r.watch(chn.currentConversation).messages.length,
                  itemBuilder: (context, index) {

                    final message = messages[index];
                    return MessageBubble(
                      sender: message.sender,
                      text: message.text,
                      time: message.time,
                      isUser: message.isUser,
                    );
                  },
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  //color: Color(0x2E14243E),
                  color: Theme.of(context).shadowColor,
                  offset: Offset(0, 0),
                  blurRadius: 55,
                  spreadRadius: 0,
                ),
              ],
              color: Theme.of(context).scaffoldBackgroundColor
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(
                        'assets/icons/addfile.svg'
                    )
                ),
                Expanded(
                  child: TextField(
                    controller: chatNotifier.chatController,
                    cursorColor: Theme.of(context).primaryColor,
                    autocorrect: false,
                    enableSuggestions: false,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: (){
                      var msg = Message(sender: 'you', text: chatNotifier.chatController.text, time: DateTime.now(), isUser:true);
                      ref.read(chatNotifier.currentConversation.notifier).state.addMessage(msg);

                    },
                    icon: SvgPicture.asset(
                        'assets/icons/send.svg'
                    )
                ),
                IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(
                        'assets/icons/record.svg'
                    )
                ),
              ],
            ),
          ),
        ],
    );
  }
}
