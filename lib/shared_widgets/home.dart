
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/shared_widgets/custom_navigation_bar.dart';


class Home extends ConsumerWidget {
  final Widget child;

  const Home({required this.child, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
