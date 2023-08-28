

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/shared_widgets/userx.dart';


class MessageBubble extends ConsumerWidget {
  final String text;
  final DateTime time;
  final bool isUser;

  MessageBubble({required this.text, required this.time, required this.isUser});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ChatNotifier chatNotifier = ref.watch(chatProvider);
    UserX user = ref.watch(chatNotifier.currentMessagingPartner);
    return Container(
      margin: EdgeInsets.symmetric(horizontal:10.0,vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isUser? MainAxisAlignment.end: MainAxisAlignment.start,
        children: [
          !isUser ?
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(user.urlImage),
            ),
          ) : SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              //SizedBox(height: 2.0),
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *0.7
                ),
                  //width: MediaQuery.of(context).size.width *0.7,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(isUser ?0.0:8.0),
                    bottomLeft: Radius.circular(isUser ?8.0:0.0),
                    topRight: Radius.circular(8.0),
                  ),
                  color:isUser ? Theme.of(context).canvasColor:Theme.of(context).primaryColor ,
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  text,
                  style:Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: isUser ? Theme.of(context).primaryColor
                          :Theme.of(context).scaffoldBackgroundColor),)

              ),
              SizedBox(height: 2.0),
              Text(
                '${time.hour}:${time.minute}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
