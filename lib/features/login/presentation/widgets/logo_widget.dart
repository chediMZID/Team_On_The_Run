
import 'package:flutter/material.dart';


class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/zetalogo.png'),
        RichText(
            text:TextSpan(
              children: [
                TextSpan(
                  text: 'ZETA',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextSpan(
                  text: 'link',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            )
        ),
      ],
    );
  }
}
