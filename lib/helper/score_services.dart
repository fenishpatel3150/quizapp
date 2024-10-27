
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateQuizScore({required String? email, required int score}) async {
  try {
    if (email == null) {
      print("Email cannot be null.");
      return;
    }

    // Retrieve the current quiz score and wait for the result
    int currentScore = await getUserQuizScore(email);
    int totalScore = currentScore + score;

    // Reference to the Firestore document
    final docRef = FirebaseFirestore.instance.collection('Users').doc(email);

    // Update the Quizscore field in Firestore
    await docRef.update({
      'Quizscore': totalScore,
    });

    print("Quizscore updated successfully for $email to $totalScore.");
  } catch (e) {
    print("Error updating Quizscore: $e");
  }
}

Future<int> getUserQuizScore(String email) async {
  try {
    final docRef = FirebaseFirestore.instance.collection('Users').doc(email);

    // Retrieve document snapshot
    DocumentSnapshot documentSnapshot = await docRef.get();
    if (documentSnapshot.exists) {
      var data = documentSnapshot.data() as Map<String, dynamic>;
      int quizScore = data['Quizscore'];
      print("Quizscore for $email: $quizScore");
      return quizScore;
    } else {
      print("Document does not exist for email: $email");
      return 0;
    }
  } catch (e) {
    print("Error retrieving data: $e");
    return 0;
  }
}
