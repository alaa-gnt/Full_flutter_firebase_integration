import 'package:flutter/material.dart';
import 'package:test_01/Reusible_compenents/Text_field_second.dart';
import '../Reusible_compenents/Text_field_one.dart';
import '../Reusible_compenents/Color_pad.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Add New Task",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),

      body: Center(
        // 👈 Centers everything on the X-axis
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            TextFieldOne(),

            const SizedBox(height: 20),

            // 🟨 Content Field
            TextFieldSecond(),

            const SizedBox(height: 30),

            // 🟩 Color Selection Pad
            ColorPad(),
          ],
        ),
      ),
    );
  }
}
