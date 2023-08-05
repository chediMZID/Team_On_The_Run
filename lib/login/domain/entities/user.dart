

class User {
  final String companyId;
  final String phoneNumber;

  User({required this.companyId,required this.phoneNumber});
  User copyWith({String? companyId, String? phoneNumber}) {
    return User(
      companyId: companyId ?? this.companyId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString (){
    return 'User(companyId: $companyId , phoneNumber: $phoneNumber)';
  }
}