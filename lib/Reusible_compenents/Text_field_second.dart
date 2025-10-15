import 'package:flutter/material.dart';

class TextFieldSecond extends StatefulWidget {
  const TextFieldSecond({super.key});

  @override
  State<TextFieldSecond> createState() => _TextFieldSecondState();
}

class _TextFieldSecondState extends State<TextFieldSecond> {
  final TextEditingController _ContentText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 170,
      child: TextField(
        controller: _ContentText,
        textAlign: TextAlign.left,
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: 'Content',
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
          ),
        ),
      ),
    );
  }
}
