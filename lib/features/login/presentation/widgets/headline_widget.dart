
import 'package:flutter/material.dart';


class HeadLine extends StatelessWidget {
  final String text;
  final bool backArrow;
  const HeadLine({this.backArrow=true,required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        backArrow ? IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Theme.of(context).primaryColor,),
          onPressed: ()=>Navigator.pop(context),)
            :SizedBox(width: 30.0,),
        Text(
            text,
            style:Theme.of(context).textTheme.headlineLarge
        )
      ],
    );
  }
}
