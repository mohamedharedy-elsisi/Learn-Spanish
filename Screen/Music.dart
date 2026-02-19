import 'package:flutter/material.dart';
import '../Controller/MusicController.dart';
// import 'music_controller.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}


class _MusicPageState extends State<MusicPage> {

  String? playingNow;

  Widget buildCard(String title, String path) {
    bool isCurrent = playingNow == path && MusicController.isPlaying;

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: ListTile(
        leading: const Icon(Icons.music_note, size: 35),
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isCurrent ? Icons.pause : Icons.play_arrow,
                size: 30,
              ),
              onPressed: () async {
                if (isCurrent) {
                  await MusicController.pause();
                } else {
                  await MusicController.play(path);
                  playingNow = path;
                }
                setState(() {});
              },
            ),
            IconButton(
              icon: const Icon(Icons.stop, size: 30),
              onPressed: () async {
                await MusicController.stop();
                playingNow = null;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    MusicController.stop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Music Player")),
      body: Column(
        children: [
          buildCard("Music 1", "Audio/music/music1.m4a"),
          buildCard("Music 2", "Audio/music/music2.m4a"),
        ],
      ),
    );
  }
}
