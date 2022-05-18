import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_tutorial_flutter/model/transaction.dart';
import 'package:hive_tutorial_flutter/page/transaction_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  //AFTER!!--> flutter packages pub run build_runner build
  Hive.registerAdapter(TransactionAdapter());
  //elneveztuk a boxot
  await Hive.openBox<Transaction>("transactions");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "Hive Expense App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: TransactionPage(),
    );
  }
}
