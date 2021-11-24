import 'package:audioplayers/audioplayers.dart';
import 'package:gd_music/assets/constants.dart';
import 'package:gd_music/models/song.dart';

class MusicPlayer {
  static final MusicPlayer _singleton = MusicPlayer._internal();
  static late final AudioPlayer _player;
  int _isPlayingGlobally = -1;
  Song? _currentSong = null;
  factory MusicPlayer() {
    return _singleton;
  }
  MusicPlayer._internal() {
    _player = AudioPlayer(playerId: "GDMUSIC");
    _isPlayingGlobally = -1;
  }

  AudioPlayer get player {
    return _player;
  }

  void play({required Song song, bool isLocal: false}) async {
    try {
      if (_currentSong != song || _currentSong == null) {
        _currentSong = song;
        _player.release();
        toast(message: "playing");
        _isPlayingGlobally = await player.play(song.songUrl);
      } else {
        _player.resume();
        _isPlayingGlobally = 1;
      }
      if (_isPlayingGlobally != 1) toast(message: "Unable to fetch the music");
    } catch (e) {
      print(e);
      toast(message: "Something went wrong");
    }
  }

  void pause() {
    _player.pause();
  }

  void stop() {
    _isPlayingGlobally = -1;
    _player.stop();
  }
}
