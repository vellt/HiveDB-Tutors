import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_db_tutor/controller/notes_controller.dart';
import 'package:hive_db_tutor/model/notes.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final controller = Get.put(NotesController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD with hive"),
      ),
      body: GetBuilder<NotesController>(
          builder: (controller) => ListView.builder(
              itemCount: controller.notesCount,
              itemBuilder: (context, index) {
                if (controller.notesCount > 0) {
                  Note? note = controller.observableBox.getAt(index);
                  return Card(
                    child: ListTile(
                      title: Text(note?.title ?? "N/A"),
                      subtitle: Text(note?.note ?? "Blank"),
                      trailing: IconButton(
                          onPressed: () => controller.deleteNote(index: index),
                          icon: const Icon(Icons.delete)),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("List is Empty"),
                  );
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNote(),
        child: const Icon(Icons.add),
      ),
    );
  }

  addNote() {
    showDialog(
        context: context,
        builder: (context) {
          titleController.clear();
          noteController.clear();
          return Material(
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(hintText: "Title"),
                      controller: titleController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(hintText: "Notes"),
                      controller: noteController,
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () {
                          String titleText = titleController.text;
                          String noteText = noteController.text;
                          controller.addNote(
                              note: Note(title: titleText, note: noteText));
                          Navigator.pop(context);
                        },
                        child: Text("Submit"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
