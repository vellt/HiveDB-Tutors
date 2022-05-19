import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_db_tutor/model/notes.dart';
import 'package:hive_db_tutor/boxes/crud_box.dart';

class NotesController extends GetxController {
  final Box _observableBox = CrudBox.getBox();

  Box get observableBox => _observableBox;
  int get notesCount => _observableBox.length;

  addNote({required Note note}) async {
    _observableBox.add(note);
    update();
  }

  deleteAll() {
    _observableBox.deleteAll(_observableBox.keys);
    update();
  }

  deleteNote({required int index}) {
    _observableBox.deleteAt(index);
    update();
  }
}
