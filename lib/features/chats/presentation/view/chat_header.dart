
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totr/shared_widgets/drop_down_flag.dart';
import 'package:totr/shared_widgets/popup_message.dart';


class ChatHeader extends ConsumerWidget implements PreferredSizeWidget {
  const ChatHeader({Key? key}) : super(key: key);

  Size get preferredSize => const Size.fromHeight(kToolbarHeight+40.0);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return AppBar(
      toolbarHeight: 100.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropDownFlag(),
          Text("Chats",style: Theme.of(context).textTheme.headlineLarge,),
          PopupMessage(icon:SvgPicture.asset(
              'assets/icons/more_horz.svg',
              color: Theme.of(context).primaryColor),),
        ],
      ),
    );
  }
}
