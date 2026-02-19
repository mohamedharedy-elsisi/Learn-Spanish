import 'package:audioplayers/audioplayers.dart';

class MusicController {
  static final AudioPlayer _player = AudioPlayer();
  static String? currentPath;
  static bool isPlaying = false;

  static Future<void> play(String path) async {
    if (currentPath == path && !isPlaying) {
      await _player.resume();
      isPlaying = true;
    } else {
      await _player.stop();
      await _player.play(AssetSource(path));
      currentPath = path;
      isPlaying = true;
    }
  }

  static Future<void> pause() async {
    await _player.pause();
    isPlaying = false;
  }

  static Future<void> stop() async {
    await _player.stop();
    isPlaying = false;
    currentPath = null;
  }
}
