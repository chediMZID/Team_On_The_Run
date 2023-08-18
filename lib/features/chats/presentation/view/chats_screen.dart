
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/shared_widgets/chat_listview.dart';
import 'package:totr/shared_widgets/search_field.dart';

import 'chat_header.dart';

class ChatsScreen extends ConsumerWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ChatNotifier chatNotifier = ref.watch(chatProvider);
    return Scaffold(
      appBar: ChatHeader(),
      body: Padding(
        padding: const EdgeInsets.only(top: 14.0,left: 18.0,right:18.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 600.0,
            child: Column(
              children: [

                Search(
                    onChanged: (query) => ref.read(chatNotifier.searchQueryProvider.notifier).state=query,
                    filter: false
                ),
               Expanded(
                 child: ChatListView(),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
