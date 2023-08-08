
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/repositories/auth_repo_imp.dart';
import '../../domain/services/auth_service.dart';
import '../../domain/services/auth_service_impl.dart';


final loginProvider = Provider((ref) => LoginNotifier());
final authService = Provider<AuthService>((ref) => AuthServiceImpl());

class LoginNotifier extends ChangeNotifier{
  final authRepositoryProvider = Provider<AuthRepo>((ref) => AuthRepoImpl(ref.read(authService)));
  final TextEditingController companyIdController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final enabledProvider =StateProvider.autoDispose<bool>((ref) => true);
  final userProvider = StateProvider<User>((ref) => User(companyId: '', phoneNumber: ''));
  final verificationProvider = StateProvider<String>((ref) => "");
  final TextEditingController codeController1 = TextEditingController();
  final TextEditingController codeController2 = TextEditingController();
  final TextEditingController codeController3 = TextEditingController();
  final TextEditingController codeController4 = TextEditingController();
  final TextEditingController codeController5 = TextEditingController();
  final TextEditingController codeController6 = TextEditingController();




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