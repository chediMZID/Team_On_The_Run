

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/login/domain/entities/user.dart';

import '../login/domain/repositories/auth_repo.dart';
import '../login/domain/repositories/auth_repo_imp.dart';
import '../login/domain/services/auth_service.dart';
import '../login/domain/services/auth_service_impl.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepo>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthRepoImpl(authService);
});

final authServiceProvider = Provider.autoDispose<AuthService>((ref) {
  return AuthServiceImpl();
});

final enabledProvider = StateProvider.autoDispose<bool>((ref) => true);


final loginProvider =
StateNotifierProvider<LoginNotifier, User>((ref) {
  return LoginNotifier(User(companyId: '', phoneNumber: ''));
});

class LoginNotifier extends StateNotifier<User> {
  LoginNotifier(User state) : super(state);

  void updateCompanyId(String companyId) {
    state = state.copyWith(companyId: companyId);
  }

  void updatePhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }
}