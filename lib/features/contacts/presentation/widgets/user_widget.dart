import 'package:flutter/material.dart';
import 'package:totr/features/contacts/presentation/view_model/contact_view_model.dart';

import '../../../../shared_widgets/dialog_buttons.dart';



class UserWidget extends StatelessWidget {

  final String imageUrl ;
  final String name ;
  final String workState;
  final ConnectionStatus status ;
  final bool axis ;

  UserWidget({required this.imageUrl,required this.name,required this.status, this.workState='', required this.axis});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (axis) {
      return Container(
      height: 300.0,
      width: screenWidth * 0.25,
      child: GestureDetector(
        onLongPress: (){
          showOptionsDialog(context);
        },
        child: Column(
          children: [
            SizedBox(
              width: 54.0,
              height: 54.0,
              child: CircleAvatar(
                radius: status == ConnectionStatus.connected ? 27:25,
                backgroundColor: status == ConnectionStatus.connected ? Colors.green:Colors.transparent,
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Stack(
                      children: [
                        ClipOval(child: Image.asset(imageUrl)),
                        Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: statusColorMap[status],
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ),
            const SizedBox(height: 8.0,),
            Text(name,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            Text(workState ,style: Theme.of(context).textTheme.headlineSmall,)
          ],
        ),
      ),
    );
    } else {
      return GestureDetector(
        onTap: (){
          showBottom(context,name,imageUrl,);
        },

          onLongPress: (){
            showOptionsDialog(context);
          },
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading:SizedBox(
              width: 54.0,
              height: 54.0,
              child: CircleAvatar(
                radius:25,
                backgroundColor:Colors.transparent,
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Stack(
                      children: [
                        ClipOval(child: Image.asset(imageUrl)),
                      /*  Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: statusColorMap[status],
                          ),
                        ),*/
                      ],
                    ),
                  ),

                ),
              ),
            ),
            title:Text(name,style: Theme.of(context).textTheme.headlineMedium,),
            subtitle:Text(workState,style: Theme.of(context).textTheme.headlineSmall,),
          ),
        );
    }
  }
}


