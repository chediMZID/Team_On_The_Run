import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/core/theme/colors.dart';
import 'package:totr/features/contacts/presentation/view_model/home_view_model.dart';
import 'package:totr/shared_widgets/actions_component.dart';
import 'package:totr/shared_widgets/search_field.dart';


class Header extends ConsumerWidget implements PreferredSizeWidget {
  const Header({super.key});


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 130.0);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    //final ConnectionStatus currentFlag = ref.watch(homeNotifier.flagProvider);
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
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined))
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



