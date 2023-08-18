
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/features/login/domain/entities/user.dart';
import 'package:totr/shared_widgets/chat_user_widget.dart';
import 'package:totr/shared_widgets/userx.dart';

import '../features/contacts/presentation/view_model/home_view_model.dart';
class ChatListView extends ConsumerWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatNotifier chatNotifier = ref.watch(chatProvider);
    final users = ref.watch(chatNotifier.usersProvider);

    return users.when(
      data: (users) {
        final query = ref.watch(chatNotifier.searchQueryProvider);
        return ListView.builder(
            padding:EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: users.length,
            itemBuilder: (context, index) {
              UserX user = UserX.fromJson(users[index]);
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
                    name: user.name,
                    imageUrl: user.urlImage,
                    status: user.status,
                    lastMessage: Text(lastMessage,style:seen? Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w300):Theme.of(context).textTheme.titleSmall),
                    trailing: Text(dateLastMessage,style: Theme.of(context).textTheme.bodySmall,),
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
}