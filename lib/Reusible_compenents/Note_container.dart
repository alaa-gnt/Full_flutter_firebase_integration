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
    return Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(12.0),
      ),

      // Row: text area (Expanded) + icons column
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Expanded makes the text column take all available space
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.content, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                  widget.date,
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          //  Icons on the far right
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.edit, size: 22),
              SizedBox(height: 10),
              Icon(Icons.delete, size: 22),
            ],
          ),
        ],
      ),
    );
  }
}
