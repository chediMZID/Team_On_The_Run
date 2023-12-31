import 'package:flutter/material.dart';
import 'package:totr/core/theme/colors.dart';
import 'package:totr/core/theme/sizes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback onPressed;

  CustomButton({
    required this.text,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: TextButton(
          onPressed: enabled ? onPressed:null,
          style:ButtonStyle(
            elevation: MaterialStateProperty.all<double>(5.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(Raidus.small)),
            ),
            backgroundColor: enabled
                ? MaterialStateProperty.all<Color>(kPrimaryColor)
                : MaterialStateProperty.all<Color>(Theme.of(context).disabledColor),
            foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
            //overlayColor:  MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0,),
            child: Text(text,style: TextStyle(
                fontSize: Sizes.x16,
                fontFamily:'Poppins',
                fontWeight: FontWeight.w500,
            ),
            ),
          )),
    );
  }
}
