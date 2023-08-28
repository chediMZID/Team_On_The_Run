
import 'package:flutter/material.dart';


class PrivacyText extends StatelessWidget {
  const PrivacyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      'Terms of Use & Privacy Policy',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
