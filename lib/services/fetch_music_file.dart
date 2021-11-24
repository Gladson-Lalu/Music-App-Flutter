import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:gd_music/models/album.dart';
import 'package:gd_music/models/song.dart';
import 'package:gd_music/services/find_color.dart';

class FetchMusicFile {
  static final FlutterAudioQuery _audioQuery = FlutterAudioQuery();
  static List<Album> _albumsList = [];

  static Future<List<Album>> fetchAlbums() async {
    List<AlbumInfo> _list = await _audioQuery.getAlbums();
    List<Album> _albumList = [];
    for (AlbumInfo e in _list) {
      _albumList.add(Album.fromStorage(
          e, await _audioQuery.getArtwork(type: ResourceType.ALBUM, id: e.id)));
    }
    return _albumList;
  }

  static Future<List<Album>> get albums async {
    _albumsList = _albumsList.isEmpty ? await fetchAlbums() : _albumsList;
    return _albumsList;
  }

  static Future<Album> getAlbumById({required Album album}) async {
    if (album.sourceType == SourceType.Local) {
      List<SongInfo> _list =
          await _audioQuery.getSongsFromAlbum(albumId: album.id);
      album.color ??= await getImagePalette(album.coverImageProvider);
      album.songs = _list
          .map((e) => Song(album: album, songUrl: e.filePath, title: e.title))
          .toList();
    }
    return album;
  }
}
