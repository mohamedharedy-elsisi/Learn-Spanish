import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Customcard2 extends StatelessWidget {
  final String imagePath;
  final String word;
  final String spanishWord;
  final String audioPath;

  Customcard2({
    super.key,
    required this.imagePath,
    required this.word,
    required this.spanishWord,
    required this.audioPath,
  });

  final AudioPlayer _player = AudioPlayer();

  void playSound() async {
    await _player.play(AssetSource(audioPath));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(word,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  spanishWord,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: playSound,
            icon: Icon(
              Icons.volume_up,
              size: 28,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
