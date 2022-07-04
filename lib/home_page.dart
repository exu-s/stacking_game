// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacking_game/pixel.dart';
import 'package:stacking_game/play_stop.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numberOfSquares = 160;
  List<int> piece = [];
  var direction = 'left';

  void startGame() {
    piece = [numberOfSquares - 3, numberOfSquares - 2, numberOfSquares - 1];
    Timer.periodic(
      const Duration(milliseconds: 250),
      (timer) {
        if (piece.first % 10 == 0) {
          direction = 'right';
        } else if (piece.last % 10 == 9) {
          direction = 'left';
        }

        setState(() {
          if (direction == 'right') {
            for (int i = 0; i < piece.length; i++) {
              piece[i] += 1;
            }
          } else {
            for (int i = 0; i < piece.length; i++) {
              piece[i] -= 1;
            }
          }
        });
      },
    );
  }

  void stack() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: GridView.builder(
                itemCount: numberOfSquares,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10),
                itemBuilder: (BuildContext context, int index) {
                  if (piece.contains(index)) {
                    return const MyPixel(
                      color: Colors.white,
                    );
                  } else {
                    return const MyPixel(
                      color: Colors.black,
                    );
                  }
                },
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PlayStop(
                    laFunction: startGame,
                    child: Text(
                      'P L A Y',
                      style: GoogleFonts.pressStart2p(
                          color: Colors.white, letterSpacing: .5),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PlayStop(
                    laFunction: stack,
                    child: Text(
                      'S T O P',
                      style: GoogleFonts.pressStart2p(
                        color: Colors.white,
                        letterSpacing: .5,
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
