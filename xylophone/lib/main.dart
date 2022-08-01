import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Expanded Xylo_Key(int num, Color col) => Expanded(
        child: MaterialButton(
          onPressed: () {
            final player = AudioPlayer();
            player.play(
              AssetSource('note$num.wav'),
            );
          },
          color: col,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Xylo_Key(1, Colors.red),
              Xylo_Key(2, Colors.orange),
              Xylo_Key(3, Colors.yellow),
              Xylo_Key(4, Colors.green),
              Xylo_Key(5, Colors.teal),
              Xylo_Key(6, Colors.blue),
              Xylo_Key(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
