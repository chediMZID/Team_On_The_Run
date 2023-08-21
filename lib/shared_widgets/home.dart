
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/chats/presentation/view_model/chat_view_model.dart';
import 'package:totr/shared_widgets/custom_navigation_bar.dart';


class Home extends ConsumerWidget {
  final Widget child;

  const Home({required this.child, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ChatNotifier chatNotifier = ref.watch(chatProvider);
    return Scaffold(
      body: child,
      bottomNavigationBar: ref.watch(chatNotifier.conversationOpen)?null
          :CustomNavigationBar(),
    );
  }
}
