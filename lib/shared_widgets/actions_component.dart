import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totr/core/strings/assests.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/shared_widgets/popup_message.dart';

import 'drop_down_flag.dart';



class ActionsComponent extends StatelessWidget {
  const ActionsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(Raidus.extraLarge),
      elevation: 10.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(Paddings.small),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/ellipse.png'),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Flexible(
            //width: 15.0,
            //height: 500.0,
            child: DropDownFlag(),
          ),
          const SizedBox(
            width: 12.0,
          ),
          PopupMessage(icon:SvgPicture.asset(
              Assets.moreVertical,
              colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn), ),
          ),

        ],
      ),
    );
  }
}
