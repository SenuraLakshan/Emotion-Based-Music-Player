class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  final String artist;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
    required this.artist,

  });

  static List<Song> songs =[
    Song(
        title: 'Cant Stop the Feeling',
        description: 'Cant Stop the Feeling',
        url: 'assets/Songs/Happy/CantStopTheFeeling/CantStopTheFeeling.mp3',
        coverUrl: 'assets/Songs/Happy/CantStopTheFeeling/poster2.jpg',
        artist: 'Justin Timberlake',),

    Song(
        title: 'What Makes You Beautiful',
        description: 'What Makes You Beautiful By OneDirection',
        url: 'assets/Songs/Happy/WhatMakesYouBeautifulByOneDirection/one_direction_what_makes_you_beautiful.mp3',
        coverUrl: 'assets/Songs/Happy/CantStopTheFeeling/poster2.jpg',
        artist: 'One Direction',)
  ];
}