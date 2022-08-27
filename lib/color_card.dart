import 'package:flutter/material.dart';

import 'constants.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({
    Key? key,
    required this.color,
    required this.label,
  }) : super(key: key);

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .45,
      width: size.width * .8,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(.1),
            offset: const Offset(1, 0),
            blurRadius: 25,
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
