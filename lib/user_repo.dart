
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/shared_widgets/userx.dart';

class UserRepository{
  List<UserX> users = [];


  Future<void> fetchUsers() async {
    final jsonString = await rootBundle.loadString('assets/Json/user.json');
    final jsonData = json.decode(jsonString);
    final List<dynamic> userJsonList = jsonData['users'];

    final List<UserX> usersList = userJsonList.map((userJson) {
      //print(userJson['NomPrenon']);
      return UserX.fromJson(userJson);
    }).toList();

    users.addAll(usersList);
  }
}


final usersListProvider = FutureProvider<List<UserX>>((ref) async {
  final userRepository = UserRepository();
  print("done");

  await userRepository.fetchUsers();
  //await Future.delayed(const Duration(seconds: 2));
  for(var user in userRepository.users)print(user.name);
  return userRepository.users;
});