
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/shared_widgets/custom_list_view.dart';
import 'package:totr/shared_widgets/search_field.dart';
import 'package:totr/user_repo.dart';

import '../../../../shared_widgets/custom_header.dart';

class ChatsScreen extends ConsumerWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ChatNotifier chatNotifier = ref.watch(chatProvider);
    final users = ref.watch(usersListProvider);
    return Scaffold(
      appBar: const CustomHeader(title: "Chat",),
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenSize.screenHeight,
          child: Column(
            children: [

              Padding(
                padding:  EdgeInsets.only(top: 14.0,left: Paddings.medium,right:Paddings.medium),
                child: Search(
                    onChanged: (query) => ref.read(chatNotifier.searchQueryProvider.notifier).state=query,
                    filter: false
                ),
              ),
             Expanded(
               child: users.when(
                   data: (users){
                     return CustomList(type: WidgetType.chatWidget, list: users);
                   },
                   error: (_,__) => Center(child: Text("$_")),
                   loading: ()=>const Center(child: CircularProgressIndicator())),
             )
            ],
          ),
        ),
      ),
    );
  }
}
