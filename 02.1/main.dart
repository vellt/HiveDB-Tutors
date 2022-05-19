import 'package:flutter/material.dart';
import 'package:hive_db_tutor/screens/notes_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/notes.dart';
import 'repository/box_repository.dart';

Future main() async {
  //you need to use this line, if your main function uses async keyword because you use await statement inside it
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //AFTER!!--> flutter packages pub run build_runner build
  Hive.registerAdapter(NoteAdapter());
  //megnyitjuk a boxot
  await BoxRepository.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD',
      home: NoteScreen(),
    );
  }
}
