import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:expense_tracker_app/services/firebase_service.dart';

class ExpenseRepository {

  final FirebaseService firebaseService =
  FirebaseService();
  //
  // Future<void> addExpense(
  //     ExpenseModel expense,
  //     ) async {
  //
  //   await firebaseService
  //       .expenseCollection()
  //       .add(expense.toJson());
  //
  // }
  Future<void> addExpense(ExpenseModel expense) async {

    try {

      final docRef = await firebaseService
          .expenseCollection()
          .add(expense.toJson());

      print("Firestore Saved");
      print(docRef.id);

    } catch (e) {

      print("Firestore Error : $e");

    }
  }
  Future<void> deleteExpense(
      String id,
      ) async {

    await firebaseService
        .expenseCollection()
        .doc(id)
        .delete();

  }

  Stream<List<ExpenseModel>> getExpenses() {

    return firebaseService
        .expenseCollection()
        .orderBy("date", descending: true)
        .snapshots()
        .map(

          (snapshot) => snapshot.docs

          .map(

            (e) => ExpenseModel.fromJson(

          e.data() as Map<String, dynamic>,

          e.id,

        ),

      )

          .toList(),

    );

  }
  Future<void> updateExpense(
      ExpenseModel expense,
      ) async {

    await firebaseService
        .expenseCollection()
        .doc(expense.id)
        .update(
      expense.toJson(),
    );
  }
}