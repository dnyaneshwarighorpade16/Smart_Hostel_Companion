import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // LOGIN FUNCTION
  Future<String> loginUser(String email, String password) async {
    try {
      // 🔹 STEP 1: CHECK INVITE
      final inviteDoc =
          await _firestore.collection('invites').doc(email).get();

      if (!inviteDoc.exists) {
        return "You are not invited!";
      }

      if (inviteDoc['isUsed'] == true) {
        return "Invitation already used!";
      }

      // 🔹 STEP 2: FIREBASE LOGIN
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user!.uid;

      // 🔹 STEP 3: CREATE USER DOC IF NOT EXISTS
      final userDoc = _firestore.collection('users').doc(uid);

      if (!(await userDoc.get()).exists) {
        await userDoc.set({
          "name": email.split("@")[0],
          "email": email,
          "role": inviteDoc['role'],
          "hostelType": inviteDoc['hostelType'],
          "isActive": true,
          "createdAt": DateTime.now(),
        });
      }

      // 🔹 STEP 4: MARK INVITE USED
      await _firestore.collection('invites').doc(email).update({
        "isUsed": true,
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Login failed";
    } catch (e) {
      return e.toString();
    }
  }
}