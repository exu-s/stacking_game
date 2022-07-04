// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {
  final color;

  const MyPixel({required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
