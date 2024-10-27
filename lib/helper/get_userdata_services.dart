import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/userdataModel/userdata_Model.dart';

class GetUserdataServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserdataModel?> getUserData(String email) async {
    try {
      DocumentSnapshot docSnapshot = await _firestore.collection('Users').doc(email).get();

      if (docSnapshot.exists) {
        // Map the document data to the UserModel
        var data = docSnapshot.data() as Map<String, dynamic>;
        UserdataModel user = UserdataModel.fromMap(data); // Assuming you have a fromMap method in UserModel
        return user;
      } else {
        print("User document does not exist for email: $email");
        return null;
      }
    } catch (e) {
      print("Error retrieving user data: $e");
      return null;
    }
  }

}
