
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totr/shared_widgets/custom_home_buttons.dart';

void showFilter(BuildContext context,) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Makes the sheet take up full width
    builder: (BuildContext context) {
      return Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Theme.of(context).focusColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5.0),
                child: ListTile(

                    title: Text(
                      'Fliter data',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16),

                    ),
                    trailing:IconButton(
                      padding: EdgeInsets.zero,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: SvgPicture.asset(
                        'assets/icons/remove.svg',
                      ),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    //padding: EdgeInsets.only(left: 50.0,top: 20.0,bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Organization',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        TextButton(
                          child: Text('Apply',
                          style: Theme.of(context).textTheme.titleSmall,
                          ),
                          onPressed: (){},
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomHomeButton(text: 'Group', border: Border.all(),onPressed: (){}, primary: false,padding:const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),),
                        SizedBox(width: 30.0),
                        CustomHomeButton(text: 'Individual', onPressed: (){}, primary: true,padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),),
                      ],
                    ),
                  ),
                  Text('Status',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomHomeButton(text: 'Online',border: Border.all(), onPressed: (){}, primary: false,padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),),
                        CustomHomeButton(text: 'OnDuty', onPressed: (){}, primary: true,padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),),
                        CustomHomeButton(text: 'Offline',border: Border.all(), onPressed: (){}, primary: false,padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0)),
                        CustomHomeButton(text: 'OffDuty', onPressed: (){}, primary: true,padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0)),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}