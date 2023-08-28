/*

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/features/contacts/presentation/view_model/home_view_model.dart';
import 'package:totr/shared_widgets/radio_checkbox.dart';
import 'package:totr/shared_widgets/user_widget.dart';
import 'package:totr/shared_widgets/userx.dart';
import 'package:totr/user_repo.dart';


class CustomListView extends ConsumerWidget {
  final bool isHorizantal;

  CustomListView({ required this.isHorizantal,});
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    final users = ref.watch(usersListProvider);

    return users.when(
      data: (users) {
        final List<UserX> favUsers = users.where((user)=> ref.watch(homeNotifier.favoriteUsers).contains(user.id)).toList();
        final query = ref.watch(homeNotifier.searchQueryProvider);
        return Padding(
          padding: EdgeInsets.only(left: 18.0,right:18.0,top: !isHorizantal? 14:25),
          child: ListView.builder(

            shrinkWrap: true,
            scrollDirection: isHorizantal ? Axis.horizontal:Axis.vertical,
            itemCount:isHorizantal ? users.where((user)=> ref.watch(homeNotifier.favoriteUsers).contains(user.id)).toList().length:users.length,
            itemBuilder: (context, index) {
              if(isHorizantal){
                UserX favUser = favUsers[index];

                if(favUser.isFavorite) {
                  return UserWidget(
                  name: favUser.name,
                  imageUrl: favUser.urlImage,
                  status: favUser.status,
                  workState: favUser.workState,
                  axis: isHorizantal,
                );
                }else{return const SizedBox();}
              }else{
                UserX user = users[index];
                if( user.name.toLowerCase().contains(query)){
                  var checklist = ref.watch(homeNotifier.isCheckedList);
                  return Row(
                    children: [
                      ref.watch(homeNotifier.favoriteActiveProvider) ?
                      Padding(
                        padding: EdgeInsets.only(right: Paddings.large),
                        child: RadioCheckbox(
                          value: ref.watch(homeNotifier.isCheckedList).contains(user.id) ,
                          onChanged: (value){
                            //print(checklist);
                            if (value == false) {

                              ref.read(homeNotifier.isCheckedList.notifier).state =
                                  ref.read(homeNotifier.isCheckedList.notifier).state.where((i) => i != user.id).toList();
                              print('no');
                            } else {
                              ref.read(homeNotifier.isCheckedList.notifier).state =
                              [...ref.read(homeNotifier.isCheckedList.notifier).state, user.id];
                              print(checklist);
                            }
                          },
                        ),
                      ):const SizedBox(),
                      Expanded(
                        child: UserWidget(
                          name: user.name,
                          imageUrl: user.urlImage,
                          status: user.status,
                          workState: user.workState,
                          axis: isHorizantal,
                        ),
                      ),
                    ],
                  );
                }else{
                  return SizedBox();
                }
              }


            },
          ),
        );
      },
      loading: () => const Center(child: SizedBox(child: CircularProgressIndicator())),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

 */
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
  }*//*

}
*/
