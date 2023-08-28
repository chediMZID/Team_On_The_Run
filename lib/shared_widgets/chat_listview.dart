/*

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/features/login/domain/entities/user.dart';
import 'package:totr/shared_widgets/chat_user_widget.dart';
import 'package:totr/shared_widgets/conversation.dart';
import 'package:totr/shared_widgets/userx.dart';
import 'package:totr/user_repo.dart';

import '../features/chats/presentation/view/chat_user_screen.dart';
import '../features/contacts/presentation/view_model/home_view_model.dart';
import 'message.dart';
class ChatListView extends ConsumerWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatNotifier chatNotifier = ref.watch(chatProvider);
    final users = ref.watch(usersListProvider);

  */
/*  final List<Message> messages = [
      Message(sender: 'John', text: "Hello! How are you brother ? I haven't seen you for a longtime" , time: DateTime.now(), isUser: false),
      Message(sender: 'You', text: 'Hi there!', time: DateTime.now().add(Duration(minutes: 5)), isUser: true),
    ];*//*


    return users.when(
      data: (users) {
        final query = ref.watch(chatNotifier.searchQueryProvider);
        return ListView.builder(
            padding:EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: users.length,
            itemBuilder: (context, index) {
              UserX user = users[index];
              //UserX user = UserX.fromJson(users[index]);
              //final Message msg = Message(text: 'User number $index \n I m ${user.name}', time: DateTime.now(), isUser: false);
              //Conversation conv = Conversation();
              //conv.messages = [msg];
              //user.conversation = conv;
              String lastMessage = user.lastMessage;

              String dateLastMessage = user.dateHourLastMessage;
              bool seen =user.seen;
              DateTime now =DateTime.now();
              String month = now.month.toString().padLeft(2, '0');
              String day =now.day.toString().padLeft(2, '0');
              String today = '${now.year}-$month-$day';
              //print(today);
              if(dateLastMessage.substring(0,10)==today){
                dateLastMessage = dateLastMessage.substring(11);
                //print(dateLastMessage);
              }
              if (lastMessage.length>15){
                lastMessage = '${lastMessage.substring(0,15)}...';
              }
              if (user.name.toLowerCase().contains(query)) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ChatUserWidget(
                    inList: true,
                    name: user.name,
                    imageUrl: user.urlImage,
                    status: user.status,
                    subtitle: Text(lastMessage,style:seen? Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w300):Theme.of(context).textTheme.titleSmall),
                    trailing: Text(dateLastMessage,style: Theme.of(context).textTheme.bodySmall,),
                    onTap: (){

                      ref.read(chatNotifier.currentConversation.notifier).update((_) => user.conversation);
                      ref.read(chatNotifier.currentMessagingPartner.notifier).state=user;
                      ref.read(chatNotifier.conversationOpen.notifier).state=true;
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>ChatUserScreen()));

                    },
                  ),
                );
              } else {
                return SizedBox();
              }
            }


        );
      },
      loading: () =>
      const Center(child: SizedBox(child: CircularProgressIndicator())),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}*/
