

import 'package:flutter/material.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/shared_widgets/custom_buttons.dart';
import 'package:totr/shared_widgets/custom_home_buttons.dart';
void showConfirmationDialog(BuildContext context,String string,void Function(BuildContext) onPressed){

  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            width:MediaQuery.of(context).size.width *0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Raidus.extraSmall),
                color: Theme.of(context).canvasColor,

              ),
              padding: EdgeInsets.symmetric(horizontal: Paddings.veryLarge,vertical:Paddings.medium ),
              child: const Text('Confirmation',textAlign: TextAlign.center,)
          ),
          content: Text(string,style: Theme.of(context).textTheme.bodySmall,),
          actions: [
            CustomHomeButton(
              padding:  EdgeInsets.symmetric(horizontal:Paddings.large,vertical: Paddings.regular),
                onPressed: (){
                  Navigator.of(context).pop();
                },
                text: 'Cancel',
              primary: false,
            ),
            CustomHomeButton(
              padding:  EdgeInsets.symmetric(horizontal: Paddings.large,vertical: Paddings.regular),
              text: 'Proceed',
                primary: true,
                onPressed:(){onPressed(context);}

            )
           ],
        );
      });
}