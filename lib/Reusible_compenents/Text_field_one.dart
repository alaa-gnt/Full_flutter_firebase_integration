import 'package:flutter/material.dart';

class TextFieldOne extends StatefulWidget {
  const TextFieldOne({super.key});

  @override
  State<TextFieldOne> createState() => _TextFieldOneState();
}

class _TextFieldOneState extends State<TextFieldOne> {
  final TextEditingController _TitleText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return // 🟦 Title Field
    SizedBox(
      width: 350,
      child: TextField(
        controller: _TitleText,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: 'Title',
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600, width: 3),
          ),
        ),
      ),
    );
  }
}
