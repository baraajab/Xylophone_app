import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

final player = AudioPlayer();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Xylophone', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Xylophone'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Tile(color: Colors.red, noteSound: "note1.wav"),
          const Tile(color: Colors.orange, noteSound: "note2.wav"),
          const Tile(color: Colors.yellow, noteSound: "note3.wav"),
          const Tile(color: Colors.green, noteSound: "note4.wav"),
          const Tile(color: Colors.blue, noteSound: "note5.wav"),
          const Tile(color: Colors.purple, noteSound: "note6.wav"),
          const Tile(color: Colors.pink, noteSound: "note7.wav"),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({super.key, required this.color, required this.noteSound});
  final Color color;
  final String noteSound;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          await player.setAsset('assets/audio/$noteSound');
          player.play();
        },
        child: Container(
          color: color,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.circle, size: 30, color: Colors.white70),
              Icon(Icons.circle, size: 30, color: Colors.white70),
            ],
          ),
        ),
      ),
    );
  }
}
