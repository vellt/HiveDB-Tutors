import 'package:hive/hive.dart';
import 'package:hive_tutorial_flutter/model/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>("transactions");
}
