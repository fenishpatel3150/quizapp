class UserModal {
  String? username, email,photoUrl,mobile;
  int Quizscore;

  UserModal._({required this.username, required this.email,required this.photoUrl,required this.mobile,required this.Quizscore});

  factory UserModal(Map m1) {
    return UserModal._(username: m1['username'], email: m1['email'],photoUrl: m1['photoUrl'] ?? 'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png',mobile: m1['mobile'],Quizscore:m1['Quizscore'] ??0 );
    // (m1['photoUrl']== null)?'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png':
  }

  Map<String, dynamic > objectToMap(UserModal userModal) {
    return {
      'username': userModal.username??'User_Name_Null',
      'email': userModal.email??"User_Name_Null",
      'photoUrl':userModal.photoUrl!,
      'mobile' :userModal.mobile ?? "User_Number_Null",
      'Quizscore' : userModal.Quizscore ?? 0,
    };
  }
}