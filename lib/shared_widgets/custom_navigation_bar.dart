import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:totr/providers/router_provider.dart';

import '../core/theme/colors.dart';


class CustomNavigationBar extends ConsumerWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final position = ref.watch(navigationIndexProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            //color: Color(0x2E14243E),
            color: Theme.of(context).shadowColor,
            offset: Offset(0, 0),
            blurRadius: 55,
            spreadRadius: 0,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: position,
        onTap: (value){
          ref.read(navigationIndexProvider.notifier).state=value;
          switch (value){
            case 0 :
              context.go('/home');
              break;
            case 1:
              context.go('/chats');
              break;
            case 2:
              context.go('/channels');
              break;
            case 3:
              context.go('/more');
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor:Theme.of(context).scaffoldBackgroundColor,
            icon: SvgPicture.asset('assets/icons/contact.svg'),
            activeIcon: SvgPicture.asset('assets/icons/contact.svg',color: Theme.of(context).primaryColorDark,),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            backgroundColor:Theme.of(context).scaffoldBackgroundColor,
            icon: SvgPicture.asset('assets/icons/chat.svg'),
            activeIcon: SvgPicture.asset('assets/icons/chat.svg',color: Theme.of(context).primaryColorDark,),
            label: 'Chats',

          ),
          BottomNavigationBarItem(
            backgroundColor:Theme.of(context).scaffoldBackgroundColor,
            icon: SvgPicture.asset('assets/icons/channels.svg'),
            activeIcon: SvgPicture.asset('assets/icons/channels.svg',color: Theme.of(context).primaryColorDark,),
            label: 'Channels',

          ) ,
          BottomNavigationBarItem(
            backgroundColor:Theme.of(context).scaffoldBackgroundColor,
            icon: SvgPicture.asset('assets/icons/more.svg'),
            activeIcon: SvgPicture.asset('assets/icons/more.svg',color: Theme.of(context).primaryColorDark,),
            label: 'More',

          ),
        ],

      ),
    );
  }
}
