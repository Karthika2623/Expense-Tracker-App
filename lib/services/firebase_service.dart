import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {

  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth auth =
      FirebaseAuth.instance;

  CollectionReference expenseCollection() {

    return firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("expenses");

  }
  CollectionReference incomeCollection() {
    return firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("income");
  }
}