


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/channel_repo.dart';

final channelProvider = StateNotifierProvider<ChannelNotifier,List<bool>>(
        (ref) {
          List<bool> list = ref.watch(channelsListProvider)
              .when(
              data: (channels)=>channels.map(
                      (channel) => channel.isOpen).toList(),
              error: (_,___)=>[],
              loading: ()=>[]);
          return ChannelNotifier(initialList: list);
        }
);


class ChannelNotifier extends StateNotifier<List<bool>>{
  ChannelNotifier({required List<bool> initialList}):super(initialList);
  /*void add(bool b){
    state = [...state,b];
  }*/
  void update(int index){
    List<bool> updatedList=<bool>[];
    for(var i=0;i<state.length;i++){
      if(i==index){
        updatedList.add(!state[i]);
      }else{
        updatedList.add(state[i]);
      }
    }
    state = updatedList;
  }

  /*final openedChannels = StateProvider<List<bool>>((ref) =>  ref.watch(channelsListProvider)
      .when(
      data: (channels)=>channels.map(
              (channel) => channel.isOpen).toList(),
      error: (_,___)=>[],
      loading: ()=>[])
  );*/

}