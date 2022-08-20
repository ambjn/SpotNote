const String tableNotes = 'notes'; // table name

class NoteFields {
  static final List<String> values = [id, title, description, time];
  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class Note {
  final int? id;
  final String title;
  final String description;
  final DateTime updatedTime;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.updatedTime,
  });

  Note copy({
    int? id,
    String? title,
    String? description,
    DateTime? updatedTime,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        updatedTime: updatedTime ?? this.updatedTime,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.description: description,
        NoteFields.time: updatedTime.toIso8601String(),
      };

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        updatedTime: DateTime.parse(json[NoteFields.time] as String),
      );
}
