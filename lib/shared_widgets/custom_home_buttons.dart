
import 'package:flutter/material.dart';

import '../core/theme/sizes.dart';


class CustomHomeButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Border? border;
  final double borderRaidus;
  final bool primary;

  CustomHomeButton({
    required this.text,
    required this.onPressed,
    this.border,
    this.borderRaidus = 8.0,
    required this.primary
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRaidus),
            border: border,
            color: primary ? Theme.of(context).primaryColorDark
                :Colors.transparent,
          ),
          child: Text(
            text,
            style:  TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: Sizes.x14,
              color: primary ? Colors.white:Theme.of(context).primaryColor,
            ),
          ),
        ));
  }
}
