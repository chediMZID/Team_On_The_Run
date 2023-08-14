import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Item { newMessage, deleteMessage }


class PopupMessage extends ConsumerWidget {
  const PopupMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return PopupMenuButton<Item>(
      padding: EdgeInsets.zero,

      icon:  Icon(Icons.more_vert,color: Theme.of(context).primaryColor,),
      onSelected: (item) {
      },
      itemBuilder: (context) => [
        popupMenuItem(context,Item.newMessage, Icons.add_comment_outlined,
            'New message'),
        popupMenuItem(context,Item.deleteMessage, Icons.delete_outlined,
            'Delete message'),
        // Add more menu items as needed
      ],
      offset: const Offset(0,
          70), // Add space between the popup menu and the big container
    );
  }
}

PopupMenuEntry<Item> popupMenuItem(BuildContext context,Item value, IconData icon, String title) {
  return PopupMenuItem<Item>(
    value: value,
    child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(title) //,style: Theme.of(context).textTheme.bodyMedium,),
    ),
  );

}
