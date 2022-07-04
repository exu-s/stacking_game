import 'package:flutter/material.dart';
import 'package:stacking_game/pixel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numberOfSquares = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GridView.builder(
              itemCount: numberOfSquares,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10),
              itemBuilder: (BuildContext context, int index) {
                return MyPixel(color: Colors.black);
              },
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
              child: Container(
            color: Colors.red,
          ))
        ],
      ),
    );
  }
}
