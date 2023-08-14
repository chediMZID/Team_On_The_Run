import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/contacts/presentation/view_model/home_view_model.dart';
import 'package:totr/features/login/presentation/view_model/login_view_model.dart';
import 'package:totr/shared_widgets/user_widget.dart';


class CustomListView extends ConsumerWidget {
  final bool isHorizantal;

  CustomListView({ required this.isHorizantal,});
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    final users = ref.watch(homeNotifier.usersProvider);

    return users.when(
      data: (users) {
        final query = ref.watch(homeNotifier.searchQueryProvider);
        return ListView.builder(

          shrinkWrap: true,
          scrollDirection: isHorizantal ? Axis.horizontal:Axis.vertical,
          itemCount: users.length,
          itemBuilder: (context, index) {
            var user = users[index];
            if(isHorizantal){
              return UserWidget(
                name: user['NomPrenon'],
                imageUrl: user['urlimage'],
                status: user['etatConneter'] == 0 ? ConnectionStatus.disconnected
                    : user['etatConneter'] == 1 ? ConnectionStatus.connected
                    : user['etatConneter'] == 2 ? ConnectionStatus.busy
                    : ConnectionStatus.out,
                workState: "On Duty",
                axis: isHorizantal,
              );
            }else{
              if( user['NomPrenon'].toLowerCase().contains(query)){
                return UserWidget(
                  name: user['NomPrenon'],
                  imageUrl: user['urlimage'],
                  status: user['etatConneter'] == 0 ? ConnectionStatus.disconnected
                      : user['etatConneter'] == 1 ? ConnectionStatus.connected
                      : user['etatConneter'] == 2 ? ConnectionStatus.busy
                      : ConnectionStatus.out,
                  workState: "On Duty",
                  axis: isHorizantal,
                );
              }else{
                return SizedBox();
              }
            }


          },
        );
      },
      loading: () => const Center(child: SizedBox(child: CircularProgressIndicator())),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

 /* @override
  Widget build(BuildContext context,WidgetRef ref) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/Json/user.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var myjson = json.decode(snapshot.data.toString());
          List<dynamic> users = myjson['users'];
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: isHorizantal ? Axis.horizontal:Axis.vertical,
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return UserWidget(
                  name: user['NomPrenon'],
                  imageUrl:user['urlimage'],
                  status:user['etatConneter'] == 0 ? ConnectionStatus.disconnected
                        :user['etatConneter'] == 1 ? ConnectionStatus.connected
                        :user['etatConneter'] == 2 ? ConnectionStatus.busy
                        :ConnectionStatus.out,
                  workState:"01-On Duty",
                  axis: isHorizantal,
                );
              }
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }*/
}
