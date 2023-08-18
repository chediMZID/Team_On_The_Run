
import 'package:flutter/material.dart';


class ChatUserHeader extends StatelessWidget implements PreferredSizeWidget{
  const ChatUserHeader({Key? key}) : super(key: key);

  Size get preferredSize => const Size.fromHeight(kToolbarHeight+40.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.0,
    );
  }
}
