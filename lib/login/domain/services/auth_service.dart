import '../entities/user.dart';

abstract class AuthService {
  Future<bool> verifyPhoneNumber(User user);
  Future<bool> sendVerificationCode(User user);
  Future<bool> verifyCompanyId(String id);

}