

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/core/strings/assests.dart';
import '../features/contacts/presentation/view_model/contact_view_model.dart';

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
           const Color.fromRGBO(30, 203, 68, 1)),
        dropdownMenuItem(ConnectionStatus.disconnected,
           const Color.fromRGBO(255, 173, 49, 1)),
        dropdownMenuItem(
            ConnectionStatus.busy,
            const Color.fromRGBO(171, 171, 171, 1)),
        dropdownMenuItem(
            ConnectionStatus.out,
            const Color.fromRGBO(20, 36, 62, 1)),
      ],
      icon: const SizedBox(),
      underline: const SizedBox(),
    );
  }
}

DropdownMenuItem<ConnectionStatus> dropdownMenuItem(
    ConnectionStatus status, Color color) {
  return DropdownMenuItem<ConnectionStatus>(
    value: status,
    child: Image.asset(
      Assets.flag,color: color,
    ),
  );
}