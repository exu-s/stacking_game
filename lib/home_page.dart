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
  List<int> landed = [10000];
  int level = 0;

  void startGame() {
    piece = [
      numberOfSquares - 3 - level * 10,
      numberOfSquares - 2 - level * 10,
      numberOfSquares - 1 - level * 10
    ];
    Timer.periodic(
      const Duration(milliseconds: 250),
      (timer) {
        if (checkWinner()) {
          _showDialog();
          timer.cancel();
        }

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

  bool checkWinner() {
    if (landed.last < 10) {
      return true;
    } else {
      return false;
    }
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Winner!'),
          );
        });
  }

  // stack
  void stack() {
    level++;
    setState(() {
      for (int i = 0; i < piece.length; i++) {
        landed.add(piece[i]);
      }
      if (level < 4) {
        piece = [
          numberOfSquares - 3 - level * 10,
          numberOfSquares - 2 - level * 10,
          numberOfSquares - 1 - level * 10
        ];
      } else if (level >= 4 && level < 8) {
        piece = [
          numberOfSquares - 2 - level * 10,
          numberOfSquares - 1 - level * 10
        ];
      } else if (level >= 8) {
        piece = [numberOfSquares - 1 - level * 10];
      }
      checkStack();
    });
  }

  // check stack
  void checkStack() {
    setState(
      () {
        for (int i = 0; i < landed.length; i++) {
          if (!landed.contains(landed[i] + 10) &&
              (landed[i] + 10 < numberOfSquares - 1)) {
            landed.remove(landed[i]);
          }
        }
        for (int i = 0; i < landed.length; i++) {
          if (!landed.contains(landed[i] + 10) &&
              (landed[i] + 10 < numberOfSquares - 1)) {
            landed.remove(landed[i]);
          }
        }
      },
    );
  }

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
                  } else if (landed.contains(index)) {
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
