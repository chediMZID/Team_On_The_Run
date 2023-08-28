
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/channel_repo.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/features/chats/presentation/view/chat_header.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/shared_widgets/channel_widget.dart';
import 'package:totr/shared_widgets/custom_list_view.dart';
import 'package:totr/shared_widgets/search_field.dart';

class ChannelsScreen extends ConsumerWidget {
  const ChannelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final channels = ref.watch(channelsListProvider);
    final ChatNotifier chatNotifier = ref.watch(chatProvider);
    return Scaffold(
      appBar: const CustomHeader(title: "Channels",),
      body: Padding(
        padding: const EdgeInsets.only(top: 14.0,left: 18.0,right:18.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: ScreenSize.screenHeight,
            child: Column(
              children: [

                Search(
                    onChanged: (query) => ref.read(chatNotifier.searchQueryProvider.notifier).state=query,
                    filter: false
                ),
                Expanded(
                    child: channels.when(
                        data: (channels)=> CustomList(type: WidgetType.channelWidget, list: channels),
                        error: (_,__)=>Center(child: Text('$_')),
                        loading: ()=>const CircularProgressIndicator())
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
