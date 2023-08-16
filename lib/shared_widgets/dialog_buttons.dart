
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




void showOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
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
            child: const Text('Contact options')
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildOptionButton(context, 'Details'),
              const Divider(),
              _buildOptionButton(context, 'Call'),
              const Divider(),
              _buildOptionButton(context, 'Push to Talk'),
              const Divider(),
              _buildOptionButton(context, 'Conference Call'),
              const Divider(),
              _buildOptionButton(context, 'Video Conferencing'),
              const Divider(),
              _buildOptionButton(context, 'Video Call'),
              const Divider(),
              _buildOptionButton(context, 'Cellular Call'),
              const Divider(),
              _buildOptionButton(context, 'Brodcasting Call'),
              const Divider(),
              _buildOptionButton(context, 'Email'),


              // Add more buttons here
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildOptionButton(BuildContext context, String text) {
  return SizedBox(
    //color: Colors.redAccent,

    height: 35.0,
    child: TextButton(
      onPressed: () {
        // Handle button tap here
        Navigator.pop(context); // Close the dialog
      },
      //style: Theme.of(context).textButtonTheme.style,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(text,)),
    ),
  );
}


void showBottom(BuildContext context,String name,String imageUrl,) {
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
            Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 27.0,
                    child: ClipOval(
                      child: Image.asset(imageUrl),
                    ),

                  ),
                  title: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 16),

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
                    decoration: BoxDecoration(
                        border: Border(
                          bottom:BorderSide(
                              color: Theme.of(context).focusColor
                          ),
                        )
                    ),
                    padding: EdgeInsets.only(left: 50.0,top: 20.0,bottom: 10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/call.svg'),
                        SizedBox(width: 24.0,),
                        Text('+33 53 56 88 45',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:BorderSide(
                          color: Theme.of(context).focusColor
                        ),
                      )
                    ),
                    padding: EdgeInsets.only(left: 50.0,top: 20.0,bottom: 10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/sms.svg'),
                        SizedBox(width: 24.0,),
                        Text('Jhon.snow@yahoo.fr',
                          style: Theme.of(context).textTheme.titleSmall,
                          ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50.0,top: 20.0,bottom: 10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/message-add.svg'),
                        SizedBox(width: 24.0,),
                        Text('Send message',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Theme.of(context).focusColor,
              child: Text(
                'Priority level : 1',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16),
                textAlign: TextAlign.center,

              ),
            )
          ],
        ),
      );
    },
  );
}

