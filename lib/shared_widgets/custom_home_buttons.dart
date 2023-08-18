
import 'package:flutter/material.dart';

import '../core/theme/sizes.dart';


class CustomHomeButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Border? border;
  final double borderRaidus;
  final bool primary;
  final EdgeInsetsGeometry? padding;

  CustomHomeButton({
    required this.text,
    required this.onPressed,
    this.border,
    this.borderRaidus = 8.0,
    required this.primary,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: padding ?? EdgeInsets.zero,
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
