
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totr/core/strings/assests.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/shared_widgets/chat_action_row.dart';
import 'package:totr/shared_widgets/chat_user_widget.dart';
import 'package:totr/shared_widgets/userx.dart';


class ChatUserHeader extends ConsumerWidget implements PreferredSizeWidget{
  late UserX user;
   ChatUserHeader({Key? key, }) : super(key: key);

  Size get preferredSize => const Size.fromHeight(kToolbarHeight+40.0);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ChatNotifier chatNotifier = ref.watch(chatProvider);
    user = ref.watch(chatNotifier.currentMessagingPartner);
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          Assets.backArrow,
          colorFilter:ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
        ),
        onPressed: (){
          ref.read(chatNotifier.conversationOpen.notifier).state =false;
          Navigator.of(context).pop();
        },
      ),
      titleSpacing: 0.0,
      toolbarHeight: 100.0,
      title:ChatUserWidget(inList:false, trailing: ChatActionRow(), subtitle: Text(user.workState), imageUrl: user.urlImage, name: user.name, status: user.status),
    );
  }
}
