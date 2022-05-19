import 'package:hive_db_tutor/model/notes.dart';
import 'package:hive/hive.dart';

class BoxRepository {
  static const String boxName = "CRUD";

  static openBox() async => await Hive.openBox<Note>(boxName);

  static Box getBox() => Hive.box<Note>(boxName);

  static closeBox() async => await Hive.box(boxName).close();
}
