import 'package:flutter/material.dart';

class ItemColor extends StatelessWidget {
  const ItemColor({super.key, required this.isPicked, required this.color});

  final bool isPicked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isPicked
        ? CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 32,
            backgroundColor: color,
          );
  }
}
