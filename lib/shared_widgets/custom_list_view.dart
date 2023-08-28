
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/features/contacts/presentation/view_model/contact_view_model.dart';
import 'package:totr/features/channels/presentation/widgets/channel_widget.dart';
import 'package:totr/shared_widgets/userx.dart';

import '../features/channels/presentation/view_model/channels_view_model.dart';
import '../features/chats/presentation/view/chat_user_screen.dart';
import 'channel.dart';
import '../features/chats/presentation/widgets/chat_user_widget.dart';
import 'radio_checkbox.dart';
import '../features/contacts/presentation/widgets/user_widget.dart';

enum WidgetType{
  chatWidget,
  contactWidgetHorz,
  contactWidgetVert,
  channelWidget,
}
class CustomList extends ConsumerWidget {

  final List<dynamic> list;
  final WidgetType type;
  const CustomList({required this.type, required this.list, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    final ChatNotifier chatNotifier = ref.watch(chatProvider);
    final chatQuery = ref.watch(chatNotifier.searchQueryProvider);
    final homeQuery =ref.watch(homeNotifier.searchQueryProvider);
    final channelQuery = ref.watch(chatNotifier.searchQueryProvider);

    return Padding(
      padding:  EdgeInsets.only(left: Paddings.medium,right: Paddings.medium),
      child: ListView.builder(
          padding:EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: type == WidgetType.contactWidgetVert ? Axis.horizontal:Axis.vertical,
          itemCount: list.length,
          itemBuilder: (context,index){
            if (type==WidgetType.chatWidget) {
              UserX user = list[index];
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
              if (user.name.toLowerCase().contains(chatQuery)) {
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
              }
            }
            else if (type==WidgetType.contactWidgetHorz){
              UserX user = list[index];
              if( user.name.toLowerCase().contains(homeQuery)){
                var checklist = ref.watch(homeNotifier.isCheckedList);
                return Row(
                  children: [
                    ref.watch(homeNotifier.favoriteActiveProvider) ?
                    Padding(
                      padding: EdgeInsets.only(right: Paddings.large),
                      child: RadioCheckbox(
                        value: ref.watch(homeNotifier.isCheckedList).contains(user.id) ,
                        onChanged: (value){
                          //print(checklist);
                          if (value == false) {

                            ref.read(homeNotifier.isCheckedList.notifier).state =
                                ref.read(homeNotifier.isCheckedList.notifier).state.where((i) => i != user.id).toList();
                            print('no');
                          } else {
                            ref.read(homeNotifier.isCheckedList.notifier).state =
                            [...ref.read(homeNotifier.isCheckedList.notifier).state, user.id];
                            print(checklist);
                          }
                        },
                      ),
                    ):const SizedBox(),
                    Expanded(
                      child: UserWidget(
                        name: user.name,
                        imageUrl: user.urlImage,
                        status: user.status,
                        workState: user.workState,
                        axis: false,
                      ),
                    ),
                  ],
                );
              }else{
                return SizedBox();
              }
            }
            else if(type==WidgetType.contactWidgetVert){
              final favUser = list[index];
              return Padding(
                padding:  EdgeInsets.only(top: Paddings.large),
                child: UserWidget(
                  name: favUser.name,
                  imageUrl: favUser.urlImage,
                  status: favUser.status,
                  workState: favUser.workState,
                  axis: true,
                ),
              );
            }
            else if (type==WidgetType.channelWidget){

              Channel channel =list[index];
              channel.index = index;
              if (channel.name.toLowerCase().contains(channelQuery)){
                return ChannelWidget(channel: channel,);

              }
            }
            else {
                return const SizedBox();
              }
            }
          ),
    );
  }
}
