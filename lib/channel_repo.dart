
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/shared_widgets/channel.dart';

class ChannelRepo{
  List<Channel> channels = [];


  Future<void> fetchUsers() async {
    final jsonString = await rootBundle.loadString('assets/Json/channel.json');
    final jsonData = json.decode(jsonString);
    final List<dynamic> channelJsonList = jsonData['channels'];

    final List<Channel> usersList = channelJsonList.map((channelJson) {
      return Channel.fromJson(channelJson);
    }).toList();

    channels.addAll(usersList);
  }
}


final channelsListProvider = FutureProvider<List<Channel>>((ref) async {
  final channelRepo = ChannelRepo();
  print("done");

  await channelRepo.fetchUsers();
  //await Future.delayed(const Duration(seconds: 2));
  for(var channel in channelRepo.channels)print(channel.name);
  return channelRepo.channels;
});