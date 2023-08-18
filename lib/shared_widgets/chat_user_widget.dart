
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/contacts/presentation/view_model/home_view_model.dart';

class ChatUserWidget extends ConsumerWidget {
  final String imageUrl ;
  final String name ;
  final ConnectionStatus status ;
  final Widget lastMessage;
  final Widget trailing;


  ChatUserWidget({required this.trailing, required this.lastMessage, required this.imageUrl,required this.name,required this.status,});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: (){
     },

      onLongPress: (){
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1,color: Theme.of(context).focusColor),
          )
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
         /* shape: Border(
            bottom: BorderSide(width: 1,color: Theme.of(context).focusColor),
          ),*/

          // bug when using border inside ListTile !!!!
          leading:CircleAvatar(
            radius: status == ConnectionStatus.connected ? 27:25,
            backgroundColor: status == ConnectionStatus.connected ? Colors.green:Colors.transparent,
            child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: ClipOval(child: Image.asset(imageUrl))),
          ),
          title:Text(name,style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16.0),),
          subtitle:lastMessage,
          trailing: trailing,
        ),
      ),
    );
  }
}
