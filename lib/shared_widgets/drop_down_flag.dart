

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/contacts/presentation/view_model/home_view_model.dart';

class DropDownFlag extends ConsumerWidget {
  const DropDownFlag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    final ConnectionStatus currentFlag = ref.watch(homeNotifier.flagProvider);
    return  DropdownButton<ConnectionStatus>(
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(50.0),
      value: currentFlag,
      onChanged: (ConnectionStatus? newValue) {
        ref.read(homeNotifier.flagProvider.notifier).state = newValue ?? ConnectionStatus.connected;
      },
      items: [
        dropdownMenuItem(ConnectionStatus.connected,
            'assets/icons/greenflag.png'),
        dropdownMenuItem(ConnectionStatus.disconnected,
            'assets/icons/greyflag.png'),
        dropdownMenuItem(
            ConnectionStatus.busy, 'assets/icons/orangeflag.png'),
        dropdownMenuItem(
            ConnectionStatus.out, 'assets/icons/blueflag.png'),
      ],
      icon: const SizedBox(),
      underline: const SizedBox(),
    );
  }
}

DropdownMenuItem<ConnectionStatus> dropdownMenuItem(
    ConnectionStatus status, String path) {
  return DropdownMenuItem<ConnectionStatus>(
    value: status,
    child: Image.asset(
      path,
    ),
  );
}