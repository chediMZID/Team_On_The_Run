
import 'package:flutter/material.dart';
import 'package:totr/core/theme/colors.dart';
import 'package:totr/core/theme/sizes.dart';


class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({required this.child,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(top: Paddings.large,),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(Raidus.medium),
          topRight: Radius.circular(Raidus.medium),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
        boxShadow:  const [
          BoxShadow(
            //color: Color(0x2E14243E),
            color: kNeutralColor700,
            offset: Offset(0, 0),
            blurRadius: 55,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
