import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:totr/shared_widgets/header.dart';

enum ConnectionStatus { connected, disconnected, busy,out }


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
    );
  }

}
