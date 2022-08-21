import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:spotnote/model/note_model.dart';

import 'package:spotnote/widgets/custom_icon.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;

    return Card(
      margin: const EdgeInsets.all(10),
      color: color,
      shadowColor: Colors.red.shade900,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CustomIcon(
                    icon: FontAwesomeIcons.bell, color: Colors.red),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        style: const TextStyle(
                          overflow: TextOverflow.fade,
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "last updated → ${DateFormat.jm().format(note.updatedTime)} ⏱️",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black12,
            ),
            const SizedBox(height: 10),
            Text(
              note.description,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
