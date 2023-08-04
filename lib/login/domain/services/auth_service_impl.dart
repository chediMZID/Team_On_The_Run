

import 'package:totr/login/domain/services/auth_service.dart';

import '../entities/user.dart';

class AuthServiceImpl implements AuthService {

  @override
  Future<bool> verifyCompanyId (String id) async{
    return true;
    //return Future.delayed(const Duration(milliseconds:4000)).then((value) => true);
  }
  @override
  Future<bool> verifyPhoneNumber (User user) async{
    return true;
  }
  @override
  Future<bool> sendVerificationCode(User user) async{
    return true;
  }
}