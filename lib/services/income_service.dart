import 'package:expense_tracker_app/models/income_model.dart';
import 'package:expense_tracker_app/services/firebase_service.dart';

class IncomeService {
  final FirebaseService firebaseService = FirebaseService();

  Future<void> addIncome(IncomeModel income) async {
    await firebaseService
        .incomeCollection()
        .add(income.toJson());
  }

  Future<void> deleteIncome(String id) async {
    await firebaseService
        .incomeCollection()
        .doc(id)
        .delete();
  }

  Future<void> updateIncome(
      IncomeModel income,
      ) async {
    await firebaseService
        .incomeCollection()
        .doc(income.id)
        .update(income.toJson());
  }

  Stream<List<IncomeModel>> getIncome() {
    return firebaseService
        .incomeCollection()
        .orderBy("date", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
          .map(
            (e) => IncomeModel.fromJson(
          e.data() as Map<String, dynamic>,
          e.id,
        ),
      )
          .toList(),
    );
  }
}