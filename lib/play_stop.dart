// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class PlayStop extends StatelessWidget {
  final child;

  const PlayStop({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.red,
          child: Center(child: child),
        ),
      ),
    );
  }
}
