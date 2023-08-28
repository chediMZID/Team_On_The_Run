
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/channel_repo.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/features/channels/presentation/view_model/channels_view_model.dart';
import 'package:totr/shared_widgets/custom_header.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/features/channels/presentation/widgets/channel_widget.dart';
import 'package:totr/shared_widgets/custom_list_view.dart';
import 'package:totr/shared_widgets/search_field.dart';

class ChannelsScreen extends ConsumerWidget {
  const ChannelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final channels = ref.watch(channelsListProvider);
    final ChannelNotifier channelNotifier = ref.watch(channelProvider);
    return Scaffold(
      appBar: const CustomHeader(title: "Channels",),
      body: Padding(
        padding: EdgeInsets.only(top: 14.0,left: Paddings.regular,right:Paddings.regular),
        child: SingleChildScrollView(
          child: SizedBox(
            height: ScreenSize.screenHeight,
            child: Column(
              children: [

                Search(
                    onChanged: (query) => ref.read(channelNotifier.searchQueryProvider.notifier).state=query,
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
