
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totr/core/strings/assests.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/router/router_provider.dart';
import 'package:totr/shared_widgets/conversation.dart';
import 'package:totr/shared_widgets/message.dart';
import 'package:totr/features/chats/presentation/widgets/message_bubble.dart';
import 'package:totr/shared_widgets/userx.dart';


class ChatUserBody extends ConsumerWidget {
  /*final List<Message> messages = [
    Message(sender: 'John', text: "Hello! How are you brother ? I haven't seen you for a longtime" , time: DateTime.now(), isUser: false),
    Message(sender: 'You', text: 'Hi there!', time: DateTime.now().add(Duration(minutes: 5)), isUser: true),
  ];*/
   ChatUserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ChatNotifier chatNotifier = ref.watch(chatProvider);
    //final currentConversation = ref.read(chatNotifier.currentConversation);
    final stream = ref.watch(chatNotifier.messagesProvider.stream);

    //final UserX user = ref.watch(chatNotifier.currentMessagingPartner);
   //final List<Message> messages = ref.watch(chatNotifier.currentConversation).messages;
    return Column(
        children: [
          Expanded(
              child:StreamBuilder<List<Message>>(
                stream: stream,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount:  ref.watch(chatNotifier.currentConversation).messages.length ,
                      itemBuilder: (context,index){
                        final message = ref.watch(chatNotifier.currentConversation).messages[index];
                        return MessageBubble(
                          text: message.text,
                          time: message.time,
                          isUser: message.isUser,
                        );
                      }
                  );
                }
              )
               /*stream.when(
                  data: (messages){
                    return ListView.builder(
                        itemCount:  ref.watch(chatNotifier.currentConversation).messages.length ,
                        itemBuilder: (context,index){
                          final message = ref.watch(chatNotifier.currentConversation).messages[index];
                          return MessageBubble(
                            text: message.text,
                            time: message.time,
                            isUser: message.isUser,
                          );
                        }
                    );
                  },
                  error: (error,stackTrace) => Text(error.toString()),
                  loading: () => const Center(child: CircularProgressIndicator(),)),*/
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
                        Assets.addFile
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
                      var msg = Message( text: chatNotifier.chatController.text, time: DateTime.now(), isUser:true);
                      ref.read(chatNotifier.currentConversation.notifier).update((state) { state.addMessage(msg);return state;});

                    },
                    icon: SvgPicture.asset(
                        Assets.send
                    )
                ),
                IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(
                        Assets.gps
                    )
                ),
              ],
            ),
          ),
        ],
    );
  }
}
