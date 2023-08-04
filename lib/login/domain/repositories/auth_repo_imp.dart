import 'package:totr/login/domain/repositories/auth_repo.dart';
import 'package:totr/login/domain/services/auth_service.dart';

import '../entities/user.dart';

class AuthRepoImpl implements AuthRepo{
  final AuthService _authService;
  AuthRepoImpl(this._authService);


  @override
  Future<bool> verifyCompanyId (String id) async{
    return (_authService.verifyCompanyId(id));
  }
  @override
  Future<bool> verifyPhoneNumber (User user) async{
    return (_authService.verifyPhoneNumber(user));
  }
  @override
  Future<bool> sendVerificationCode(User user) async{
    return (_authService.sendVerificationCode(user));

  }
}