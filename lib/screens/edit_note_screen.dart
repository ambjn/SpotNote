import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:spotnote/database/db.dart';
import 'package:spotnote/model/note_model.dart';
import 'package:spotnote/widgets/note_form.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key, this.note}) : super(key: key);
  final Note? note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  late IconData generalIcon;
  @override
  void initState() {
    super.initState();
    title = widget.note?.title ?? ''; // by default empty
    description = widget.note?.description ?? ''; // by default empty
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: NoteForm(
            title: title,
            description: description,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid =
        title.isNotEmpty && description.isNotEmpty; // check is form valid

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor:
              isFormValid ? Colors.redAccent : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateNote,
        child: const Icon(
          FontAwesomeIcons.check,
        ),
      ),
    );
  }

//addOrUpdateNote
  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final isUpdating = widget.note != null;
      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }
      Get.back();
    }
  }

//updateNote
  Future updateNote() async {
    final note = widget.note!.copy(
      title: title,
      description: description,
      updatedTime: DateTime.now(),
    );
    await NotesDatabase.instance.update(note);
  }

//addNote
  Future addNote() async {
    final note = Note(
      title: title,
      description: description,
      updatedTime: DateTime.now(),
    );
    await NotesDatabase.instance.create(note);
  }
}
