
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totr/core/strings/assests.dart';
import 'package:totr/features/channels/presentation/view_model/channels_view_model.dart';

import 'channel.dart';


class ChannelWidget extends ConsumerWidget {
  final Channel channel;
  const ChannelWidget({required this.channel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final List<bool> openedChannels = ref.watch(channelProvider);

    return  ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SvgPicture.asset(Assets.channels),
      ),
      title:Text(channel.name) ,
      subtitle: Text('Priority level : ${channel.priorityLevel}'),
      trailing: Switch(
        value: openedChannels[int.parse(channel.id.substring(7))-1],
        onChanged: (value){
          channel.isOpen=!channel.isOpen;
          ref.read(channelProvider.notifier).update(int.parse(channel.id.substring(7))-1);
          /*ref.read(channelNotifier.openedChannels.notifier).update((state) {
            state[int.parse(channel.id.substring(7))-1]^= true;
            return state;
          });*/
          //ref.read(channelNotifier.openedChannels.notifier).state[int.parse(channel.id.substring(7))-1]
          //=!ref.read(channelNotifier.openedChannels.notifier).state[int.parse(channel.id.substring(7))-1];
          },
      ),

    );
  }
}
