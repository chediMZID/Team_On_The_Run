
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totr/core/strings/assests.dart';

class ChatActionRow extends StatelessWidget {
  const ChatActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize:MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity(horizontal: -2,),
            onPressed: (){},
            icon:SvgPicture.asset(
                Assets.call,
              colorFilter:ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
              width: 20,
            )
        ),
        IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity(horizontal: -2,),
            onPressed: (){},
            icon:SvgPicture.asset(
                Assets.mic,
              colorFilter:ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
              width: 20,

            )
        ),
        IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity(horizontal: -2,),
            onPressed: (){},
            icon:SvgPicture.asset(
                Assets.gps,
              colorFilter:ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
              width: 20,

            )
        )
      ],
    );
  }
}
