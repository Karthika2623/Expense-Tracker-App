import 'package:cloud_firestore/cloud_firestore.dart';

class IncomeModel {
  String id;
  String title;
  double amount;
  DateTime date;

  IncomeModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  factory IncomeModel.fromJson(
      Map<String, dynamic> json,
      String id,
      ) {
    return IncomeModel(
      id: id,
      title: json["title"] ?? "",
      amount: (json["amount"] as num).toDouble(),
      date: (json["date"] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "amount": amount,
      "date": Timestamp.fromDate(date),
    };
  }
}