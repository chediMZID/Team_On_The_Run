import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:totr/features/contacts/presentation/view_model/home_view_model.dart';
import 'package:totr/shared_widgets/custom_navigation_bar.dart';
import 'package:totr/shared_widgets/header.dart';
import 'package:totr/shared_widgets/toggle_buttons.dart';
import 'package:totr/shared_widgets/user_widget.dart';

import '../../../../shared_widgets/custom_listview.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Header(),
      body: SingleChildScrollView(

        child: SizedBox(
          height: 600.0,

          child: Column(
            children: [
              Toggle(),
              Expanded(flex:2,child: CustomListView(isHorizantal: true,)),
              Container(
                height: 12.0,
                color: Theme.of(context).canvasColor,
              ),
              Expanded(flex:7,child: CustomListView(isHorizantal: false,)),
              //UserWidget(imageUrl: 'assets/images/ellipse.png', name: 'Martin', status:ConnectionStatus.connected, workState: 'On Duty',),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: CustomNavigationBar(),
    );
  }

}
