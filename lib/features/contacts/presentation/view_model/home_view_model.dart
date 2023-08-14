


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectionStatus { connected, disconnected, busy, out }

Map<ConnectionStatus, Color> statusColorMap = {
  ConnectionStatus.connected: Colors.green,
  ConnectionStatus.disconnected: Colors.grey,
  ConnectionStatus.busy: Colors.yellow,
  ConnectionStatus.out: Colors.black,
};
final homeProvider = Provider((ref) => HomeNotifier());

class HomeNotifier extends ChangeNotifier {

  final flagProvider = StateProvider<ConnectionStatus>((ref) => ConnectionStatus.connected);

  final searchFocusProvider = StateProvider<bool>((ref) => false);
  final buttonProvider = StateProvider<bool>((ref) => true);
  final usersProvider = FutureProvider<List<dynamic>>((ref) async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonString = await rootBundle.loadString('assets/Json/user.json');
    final jsonData = json.decode(jsonString);
    return jsonData['users'];
  });
  final searchQueryProvider = StateProvider<String>((ref) => '');
}