




import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final channelProvider = Provider((ref) => ChannelNotifier());


class ChannelNotifier extends ChangeNotifier {

  final searchQueryProvider=StateProvider<String>((ref) => '');
}