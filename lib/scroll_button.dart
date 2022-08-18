import 'package:flutter/material.dart';

class ScrollButton extends StatelessWidget {
  const ScrollButton({
    Key? key,
    required this.press,
    required this.label,
  }) : super(key: key);

  final VoidCallback press;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 169, 255, 173),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
