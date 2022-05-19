import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_db_tutor/model/notes.dart';
import 'package:hive_db_tutor/repository/box_repository.dart';

class NotesController extends GetxController {
  final Box _observableBox = BoxRepository.getBox();

  Box get observableBox => _observableBox;
  int get notesCount => _observableBox.length;

  addNote({required Note note}) async {
    _observableBox.add(note);
    update();
  }

  updateNote({required int index, required Note note}) {
    _observableBox.putAt(index, note);
    update();
  }

  deleteNote({required int index}) {
    _observableBox.deleteAt(index);
    update();
  }
}
