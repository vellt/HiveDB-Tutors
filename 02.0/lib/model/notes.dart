import 'package:hive_flutter/adapters.dart';

part 'notes.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveType(typeId: 0)
  final String? title;
  @HiveType(typeId: 1)
  final String? note;

  Note({this.title, this.note});
}
