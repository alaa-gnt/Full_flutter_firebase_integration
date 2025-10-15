import 'package:flutter/material.dart';

class SmallColorSquare extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const SmallColorSquare({
    super.key,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 40,
      height: 40,

      decoration: BoxDecoration(
        color: color,
        border: isSelected ? Border.all(color: Colors.black, width: 3) : null,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
