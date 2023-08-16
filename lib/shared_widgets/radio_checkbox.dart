import 'package:flutter/material.dart';

class RadioCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  RadioCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 20,
        height: 20,
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          color:  Colors.transparent,
        ),
        child:Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            /*border: Border.all(
              color: value ? Colors.blue : Colors.grey,
              width: 2,
            ),*/
            color: value ? Theme.of(context).primaryColor : Colors.transparent,
          ),
        ),
      ),

    );
  }
}
