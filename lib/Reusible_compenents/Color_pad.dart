import 'package:flutter/material.dart';
import 'package:test_01/Reusible_compenents/small_color_squire.dart';

class ColorPad extends StatefulWidget {
  const ColorPad({super.key});

  @override
  State<ColorPad> createState() => _ColorPadState();
}

class _ColorPadState extends State<ColorPad> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.brown,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
  ];

  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: GridView.builder(
        shrinkWrap: true, // Allow GridView to size itself in Column
        physics:
            NeverScrollableScrollPhysics(), // Disable scrolling since it's in a Column
        itemCount: colors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final color = colors[index];
          final isSelected = color == selectedColor;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = color;
              });
            },
            child: SmallColorSquare(color: color, isSelected: isSelected),
          );
        },
      ),
    );
  }
}
