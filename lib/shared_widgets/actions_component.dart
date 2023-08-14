import 'package:flutter/material.dart';
import 'package:totr/shared_widgets/popup_message.dart';

import 'drop_down_flag.dart';



class ActionsComponent extends StatelessWidget {
  const ActionsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(50.0),
      elevation: 10.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
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
          PopupMessage(),

        ],
      ),
    );
  }
}
