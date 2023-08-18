

import 'package:flutter/material.dart';
import 'package:totr/shared_widgets/custom_buttons.dart';
import 'package:totr/shared_widgets/custom_home_buttons.dart';
void showConfirmationDialog(BuildContext context,String string){

  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            width:MediaQuery.of(context).size.width *0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Theme.of(context).canvasColor,

              ),
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical:17.0 ),
              child: const Text('Confirmation',textAlign: TextAlign.center,)
          ),
          content: Text(string,style: Theme.of(context).textTheme.bodySmall,),
          actions: [
            CustomHomeButton(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                onPressed: (){
                  Navigator.of(context).pop();
                },
                text: 'Cancel',
              primary: false,
            ),
            CustomHomeButton(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              text: 'Proceed',
                primary: true,
                onPressed: (){
                Navigator.of(context).pop();
                },

            )
           ],
        );
      });
}