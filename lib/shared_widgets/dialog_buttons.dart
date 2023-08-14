
import 'package:flutter/material.dart';




void showOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
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


void showBottom(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Makes the sheet take up full width
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Option 1'),
            Text('Option 2'),
            Text('Option 3'),
            // Add more options here
          ],
        ),
      );
    },
  );
}

