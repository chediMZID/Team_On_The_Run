import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/contacts/presentation/view_model/contact_view_model.dart';
import 'package:totr/shared_widgets/custom_list_view.dart';
import 'package:totr/shared_widgets/custom_navigation_bar.dart';
import 'package:totr/features/contacts/presentation/view/contact_header.dart';
import 'package:totr/shared_widgets/toggle_buttons.dart';
import 'package:totr/features/contacts/presentation/widgets/user_widget.dart';
import 'package:totr/user_repo.dart';



class ContactScreen extends ConsumerWidget {
  const ContactScreen({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    final users = ref.watch(usersListProvider);
    final favUsers = ref.watch(homeNotifier.favoriteUsers);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ContactHeader(),
      body: SingleChildScrollView(

        child: SizedBox(
          height: 600.0,

          child: Column(
            children: [
              const Toggle(),
              SizedBox(
                  height:150.0,
                  child: CustomList(
                      type: WidgetType.contactWidgetVert,
                      list: users.when(
                          data: (users) =>users.where((user)=> ref.watch(homeNotifier.favoriteUsers).contains(user.id)).toList(),
                          error: (_,__)=>[],
                          loading: ()=>[])
                  ),
              ),
              Container(
                height: 12.0,
                color: Theme.of(context).canvasColor,
              ),
              Expanded(
                  child: users.when(
                      data: (users)=> CustomList(type: WidgetType.contactWidgetHorz, list: users),
                      error: (_,__)=>Center(child: Text('$_'),),
                      loading: ()=>const Center(child: CircularProgressIndicator())
                  )
              ),
              //UserWidget(imageUrl: 'assets/images/ellipse.png', name: 'Martin', status:ConnectionStatus.connected, workState: 'On Duty',),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
