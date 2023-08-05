

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../login/domain/entities/user.dart';
import '../login/domain/repositories/auth_repo.dart';
import '../login/domain/repositories/auth_repo_imp.dart';
import '../login/domain/services/auth_service.dart';
import '../login/domain/services/auth_service_impl.dart';

final loginProvider = Provider((ref) => LoginNotifier());
final authService = Provider<AuthService>((ref) => AuthServiceImpl());

class LoginNotifier extends ChangeNotifier{
  final authRepositoryProvider = Provider<AuthRepo>((ref) => AuthRepoImpl(ref.read(authService)));
  final TextEditingController companyIdController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final enabledProvider =StateProvider.autoDispose<bool>((ref) => true);
  final userProvider = StateProvider<User>((ref) => User(companyId: '', phoneNumber: ''));


  /*void wrongCompanyId () {
    companyIdController.text = '';
    enabledButton = false;
    notifyListeners();
  }

  void reSet(){
    enabledButton =true;
    notifyListeners();

  }*/
}