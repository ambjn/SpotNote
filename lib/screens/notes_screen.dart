import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:spotnote/database/db.dart';
import 'package:spotnote/model/note_model.dart';
import 'package:spotnote/screens/edit_note_screen.dart';
import 'package:spotnote/screens/notes_detail_screen.dart';
import 'package:spotnote/widgets/note_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController controller = TextEditingController();
  List<Note> notes = <Note>[];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  // to refresh and read all notes
  Future refreshNotes() async {
    setState(() => _isLoading = true);
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                children: const [
                  Text(
                    "Spot",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  Text(
                    "N",
                    style: TextStyle(fontSize: 30, color: Colors.amber),
                  ),
                  Text(
                    "ote",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              width: double.infinity,
              height: 60,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.amberAccent,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade800,
                    ),
                    hintText: 'Search..',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.amberAccent,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    )),
                onChanged: searchTitle,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : notes.isEmpty
                        ? const Text(
                            'no notes :(',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 24),
                          )
                        : buildNotes(),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .endFloat, // use floatingActionButton for uninterrupted listview since it doesn't cause out of pixels error
        floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: Colors.amber,
          child: const Icon(FontAwesomeIcons.notesMedical),
          onPressed: () async {
            await Get.to(() => const EditNoteScreen());
            refreshNotes();
          },
        ),
      );

  Widget buildNotes() => ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(), // enable for both-ways scrolling
      itemCount: notes.length,
      itemBuilder: ((context, index) {
        final note = notes[index];
        return GestureDetector(
          onTap: () async {
            await Get.to(() => NotesDetailScreen(noteId: note.id!));
            refreshNotes();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: NoteCard(note: note, index: index),
          ),
        );
      }));

  void searchTitle(String query) {
    var suggestions = notes.where((note) {
      final noteTitle = note.title.toLowerCase();
      final input = query.toLowerCase();
      return noteTitle.contains(input);
    }).toList();
    setState(() => notes = suggestions);
  }
}
