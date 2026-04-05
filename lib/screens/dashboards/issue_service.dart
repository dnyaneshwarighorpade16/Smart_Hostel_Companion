import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IssueService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔹 SUBMIT ISSUE
  Future<String> submitIssue({
    required String title,
    required String description,
    required String roomNo,
    required String studentName,
    required String hostelType,
  }) async {
    try {
      final user = _auth.currentUser;

      if (user == null) return "User not logged in";

      await _firestore.collection('issues').add({
        "title": title,
        "description": description,
        "roomNo": roomNo,
        "studentName": studentName,
        "hostelType": hostelType,
        "status": "pending",
        "createdByUid": user.uid,

        // ✅ IMPORTANT FIX (use Timestamp)
        "createdAt": FieldValue.serverTimestamp(),
        "updatedAt": FieldValue.serverTimestamp(),
      });

      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  // 🔥 REAL-TIME STREAM (FOR UI)
  Stream<QuerySnapshot> getIssues() {
    return _firestore
        .collection('issues')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // 🔥 (NEXT LEVEL) — ONLY CURRENT USER ISSUES
  Stream<QuerySnapshot> getMyIssues() {
    final user = _auth.currentUser;

    if (user == null) {
      return const Stream.empty();
    }

    return _firestore
        .collection('issues')
        .where('createdByUid', isEqualTo: user.uid)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}