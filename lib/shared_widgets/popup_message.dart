import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totr/core/strings/assests.dart';

enum Item { newMessage, deleteMessage }


class PopupMessage extends ConsumerWidget {
  final Widget? icon;
  const PopupMessage({this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return PopupMenuButton<Item>(
      padding: EdgeInsets.zero,

      icon:  icon ?? const SizedBox(),
      onSelected: (item) {
      },
      itemBuilder: (context) => [
        popupMenuItem(context,Item.newMessage, Assets.addMessage,
            'New message'),
        popupMenuItem(context,Item.deleteMessage, Assets.delete,
            'Delete message'),
      ],
      offset: const Offset(0, 70),
    );
  }
}

PopupMenuEntry<Item> popupMenuItem(BuildContext context,Item value, String icon, String title) {
  return PopupMenuItem<Item>(
    value: value,
    child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          icon,
          colorFilter:ColorFilter.mode( Theme.of(context).primaryColor,BlendMode.srcIn)
        ),
        title: Text(title) //,style: Theme.of(context).textTheme.bodyMedium,),
    ),
  );

}
