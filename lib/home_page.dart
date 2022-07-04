// ignore_for_file: prefer_const_literals_to_create_immutables

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
                  return const MyPixel(color: Colors.black);
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
