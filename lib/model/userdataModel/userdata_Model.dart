class UserdataModel {
  String? email,username,mobile,photoUrl;
  int? quizScore;

  UserdataModel({required this.email, required this.quizScore,required this.mobile,required this.photoUrl,required this.username});


  factory UserdataModel.fromMap(Map<String, dynamic> map) {
    return UserdataModel(
      email: map['email'] ?? '',
      quizScore: map['Quizscore'] ?? 0,
      mobile: map['mobile'],
      photoUrl: map['photoUrl'],
      username: map['username'],
    );
  }

}
