import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  String id;
  String title;
  double amount;
  String category;
  String note;
  DateTime date;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.note,
    required this.date,
  });

  factory ExpenseModel.fromJson(
      Map<String, dynamic> json,
      String id,
      ) {
    return ExpenseModel(
      id: id,
      title: json["title"] ?? "",
      amount: (json["amount"] as num).toDouble(),
      category: json["category"] ?? "",
      note: json["note"] ?? "",
      date: (json["date"] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "amount": amount,
      "category": category,
      "note": note,
      "date": Timestamp.fromDate(date),
    };
  }
}