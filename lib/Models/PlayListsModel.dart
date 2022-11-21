import '../Pages/SongPage.dart';

class Playlist{
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });


  static List<Playlist> playlists =[
    Playlist(
      title: 'Happy',
      songs: Song.songs,
      imageUrl: 'assets/Images/Happy.jpg',
    ),
    Playlist(
      title: 'Sad',
      songs: Song.songs,
      imageUrl: 'assets/Images/sad.jpg',
    ),
    Playlist(
      title: 'Neutral',
      songs: Song.songs,
      imageUrl: 'assets/Images/360_F_246149382_KHkt8Mw8pptlmVuiqmhavvHBC4SEqBu1.jpg',
    ),
    Playlist(
      title: 'Surprised',
      songs: Song.songs,
      imageUrl: 'assets/Images/surprise.jpg',
    ),
  ];
}