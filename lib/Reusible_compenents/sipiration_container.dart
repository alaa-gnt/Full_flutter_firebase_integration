import 'package:flutter/material.dart';

class SipirationContainer extends StatefulWidget {
  const SipirationContainer({super.key});

  @override
  State<SipirationContainer> createState() => _SipirationContainerState();
}

class _SipirationContainerState extends State<SipirationContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        'choose a color',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
