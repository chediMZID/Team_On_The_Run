
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totr/core/strings/assests.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/features/channels/presentation/view_model/channels_view_model.dart';
import 'package:totr/features/channels/presentation/view_model/state_notifier.dart';

import '../../../../shared_widgets/channel.dart';


class ChannelWidget extends ConsumerWidget {
  final Channel channel;
  const ChannelWidget({required this.channel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final List<bool> openedChannels = ref.watch(openedChannelsProvider);

    return  ListTile(
      shape: Border(bottom: BorderSide(color: Theme.of(context).focusColor)),
      contentPadding: EdgeInsets.symmetric(vertical: Paddings.small),

    leading: CircleAvatar(
        radius: Raidus.large,
        backgroundColor: openedChannels[channel.index]?Theme.of(context).primaryColorDark:Colors.transparent,
        child: SvgPicture.asset(
            Assets.channels,
          colorFilter: ColorFilter.mode(openedChannels[channel.index]?
          Theme.of(context).scaffoldBackgroundColor
              :Theme.of(context).primaryColor,BlendMode.srcIn),
        ),
      ),
      title:Text(channel.name,style: Theme.of(context).textTheme.labelLarge,) ,

      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          openedChannels[channel.index]? Row(
            children: [
              SvgPicture.asset(Assets.contact,width: 16.0,),
              Text("  ${channel.connectedUsersNumber} / ${channel.usersNumber}",
              style: Theme.of(context).textTheme.bodySmall,),
            ],
          )
              :const SizedBox(),
          //openedChannels[channel.index]? Text(""):const SizedBox(),
          Text('Priority level : ${channel.priorityLevel}',style: Theme.of(context).textTheme.bodySmall,),
        ],
      ),
      trailing: Switch(
        activeColor: Theme.of(context).primaryColorDark,
        inactiveTrackColor: Theme.of(context).focusColor,
        value: openedChannels[channel.index],
        onChanged: (value){
          channel.isOpen^=true;
          ref.read(openedChannelsProvider.notifier).update(channel.index);
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
