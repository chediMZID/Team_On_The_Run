
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totr/core/strings/assests.dart';
import 'package:totr/shared_widgets/drop_down_flag.dart';
import 'package:totr/shared_widgets/popup_message.dart';


class CustomHeader extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  const CustomHeader({required this.title,Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+40.0);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return AppBar(
      toolbarHeight: 100.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DropDownFlag(),
          Text(title,style: Theme.of(context).textTheme.headlineLarge,),
          PopupMessage(icon:SvgPicture.asset(
              Assets.moreHorizantal,
              colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),),),
        ],
      ),
    );
  }
}
