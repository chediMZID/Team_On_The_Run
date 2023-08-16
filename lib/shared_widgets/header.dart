import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totr/core/theme/colors.dart';
import 'package:totr/features/contacts/presentation/view_model/home_view_model.dart';
import 'package:totr/shared_widgets/actions_component.dart';
import 'package:totr/shared_widgets/confirmation_dialog.dart';
import 'package:totr/shared_widgets/search_field.dart';


class Header extends ConsumerWidget implements PreferredSizeWidget {
  const Header({super.key});


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 130.0);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    //final ConnectionStatus currentFlag = ref.watch(homeNotifier.flagProvider);
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
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
          ActionsComponent(),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Column(
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  Expanded(
                    child:Search(),
                  ),
                  IconButton(

                      onPressed: () {
                        if(ref.watch(homeNotifier.favoriteActiveProvider)){
                          showConfirmationDialog(context,'Select and add to favorites');
                        }
                        ref.read(homeNotifier.favoriteActiveProvider.notifier).state=
                            !ref.read(homeNotifier.favoriteActiveProvider.notifier).state;

                      },
                      icon: CircleAvatar(

                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ref.watch(homeNotifier.favoriteActiveProvider) ?
                          SvgPicture.asset(
                            'assets/icons/favorite.svg',
                            color: Theme.of(context).scaffoldBackgroundColor
                          ):SvgPicture.asset(
                              'assets/icons/favorite_outlined.svg',
                              color: Theme.of(context).scaffoldBackgroundColor
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



