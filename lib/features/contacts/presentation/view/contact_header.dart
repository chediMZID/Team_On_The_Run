import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totr/core/strings/assests.dart';
import 'package:totr/core/theme/sizes.dart';
//import 'package:totr/core/theme/colors.dart';
import 'package:totr/features/contacts/presentation/view_model/contact_view_model.dart';
import 'package:totr/features/contacts/presentation/widgets/actions_component.dart';
import 'package:totr/shared_widgets/confirmation_dialog.dart';
import 'package:totr/shared_widgets/search_field.dart';
import 'package:totr/user_repo.dart';


class ContactHeader extends ConsumerWidget implements PreferredSizeWidget {
  const ContactHeader({super.key});


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 130.0);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    //final ConnectionStatus currentFlag = ref.watch(homeNotifier.flagProvider);
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    final users = ref.watch(usersListProvider);
    return AppBar(
      toolbarHeight: 120.0,
      //backgroundColor: Theme.of,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Contacts',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const ActionsComponent(),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
              width: ScreenSize.screenWidth * 0.8,
              child: Row(
                children: [
                  Expanded(
                    child:Search(filter:true,onChanged: (query) => ref.read(homeNotifier.searchQueryProvider.notifier).state=query,),
                  ),
                  IconButton(

                      onPressed: () {
                        if(ref.watch(homeNotifier.favoriteActiveProvider)){
                          showConfirmationDialog(context,'Select and add to favorites',
                              (BuildContext ctx){
                            ref.read(homeNotifier.favoriteUsers.notifier).state = List.from(ref.watch(homeNotifier.isCheckedList));
                            Navigator.of(ctx).pop();

                              });
                          print(ref.watch(homeNotifier.favoriteUsers));
                        }
                        ref.read(homeNotifier.favoriteActiveProvider.notifier).state=
                            !ref.read(homeNotifier.favoriteActiveProvider.notifier).state;

                      },
                      icon: CircleAvatar(

                        child: Padding(
                          padding: EdgeInsets.all(Paddings.small),
                          child: ref.watch(homeNotifier.favoriteActiveProvider) ?
                          SvgPicture.asset(
                            Assets.favorite,
                            colorFilter:ColorFilter.mode(Theme.of(context).scaffoldBackgroundColor, BlendMode.srcIn)
                          ):SvgPicture.asset(
                              Assets.favoriteOutilned,
                              colorFilter:ColorFilter.mode(Theme.of(context).scaffoldBackgroundColor, BlendMode.srcIn)
                          )
                        ),
                      ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 11.6,)
          ],
        ),
      ),
    );
  }

  }



