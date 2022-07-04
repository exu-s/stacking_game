// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class PlayStop extends StatelessWidget {
  final child;
  final laFunction;

  const PlayStop({Key? key, required this.child, required this.laFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: laFunction,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.red,
          child: Center(child: child),
        ),
      ),
    );
  }
}
