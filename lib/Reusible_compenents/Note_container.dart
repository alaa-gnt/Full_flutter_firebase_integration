import 'package:flutter/material.dart';

class NoteContainer extends StatefulWidget {
  const NoteContainer({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });

  final String title;
  final String content;
  final String date;
  final Color color;

  @override
  State<NoteContainer> createState() => _NoteContainerState();
}

class _NoteContainerState extends State<NoteContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50, // Made width even smaller
      height: 200,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),

        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: [
            // title
            Text(
              widget.title,
              textAlign: TextAlign.left, // Left-align text
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // note content
            Text(
              widget.content,
              textAlign: TextAlign.left, // Left-align text
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),

            // date
            Text(
              widget.date,
              textAlign: TextAlign.left, // Left-align text
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
