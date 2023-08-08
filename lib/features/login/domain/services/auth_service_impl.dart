
import '../entities/user.dart';
import 'auth_service.dart';

class AuthServiceImpl implements AuthService {

  @override
  Future<bool> verifyCompanyId (String id) async{
    return id=="0000";
    //return Future.delayed(const Duration(milliseconds:4000)).then((value) => true);
  }
  @override
  Future<bool> verifyPhoneNumber (User user) async{
    return (user.companyId=="0000"&& user.phoneNumber == "28") ;
  }
  @override
  Future<bool> sendVerificationCode(User user) async{
    return true;
  }

  @override
  Future<bool> verifyCode(String code) async {
    return code == "111111";
  }
}