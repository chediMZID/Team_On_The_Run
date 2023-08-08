import '../entities/user.dart';

abstract class AuthRepo {
  Future<bool> verifyPhoneNumber(User user);
  Future<bool> sendVerificationCode(User user);
  Future<bool> verifyCompanyId(String id);
  Future<bool> verifyCode(String code);
}