
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/chats/presentation/view/chat_user_screen.dart';

import '../../../contacts/presentation/view_model/contact_view_model.dart';

class ChatUserWidget extends ConsumerWidget {
  final bool inList;
  final String imageUrl ;
  final String name ;
  final ConnectionStatus status ;
  final Widget subtitle;
  final Widget trailing;
  final VoidCallback? onTap;


  ChatUserWidget({required this.inList, this.onTap, required this.trailing, required this.subtitle, required this.imageUrl,required this.name,required this.status,});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: inList ?BorderSide(width: 1,color: Theme.of(context).focusColor)
                :BorderSide.none,
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
        subtitle:subtitle,
        trailing: trailing,
        onTap: onTap,


      ),
    );
  }
}
