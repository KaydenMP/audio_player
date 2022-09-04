import 'package:flutter/material.dart';

class Song {
  String songName;
  String imageName;
  String title;
  String artist;

  Song(
      {required this.songName,
      required this.imageName,
      required this.title,
      required this.artist});
}

class MyPlayList {
  final List<Song> _playlist = [
    Song(
        songName: 'Benny_Blanco_Bad_Decisions.mp3',
        imageName: 'images/Bad decisions.jpg',
        title: 'Bad Decisions',
        artist: 'Benny Blanco , Snoop Dogg, BTS'),
    Song(
        songName: 'BTS-Life-Goes-On-(TrendyBeatz.com).mp3',
        imageName: 'images/Life goes on.png',
        title: 'Life Goes On',
        artist: 'BTS'),
    Song(
        songName: 'SEVENTEEN - CHEERS.mp3',
        imageName: 'images/Cheers.jpg',
        title: 'Cheers',
        artist: 'SVT leaders'),
    Song(
        songName: 'SEVENTEEN - Darling.mp3',
        imageName: 'images/Darling.jpg',
        title: 'Darling',
        artist: 'SEVENTEEN'),
    Song(
        songName: 'Yet to come.mp3',
        imageName: 'images/Yet_To_Come_Cover.webp',
        title: 'Yet To Come',
        artist: 'BTS')
  ];

  String getSongName(int indexNum) {
    return _playlist[indexNum].songName;
  }

  String getImageName(int indexNum) {
    return _playlist[indexNum].imageName;
  }

  String getTitle(int indexNum) {
    return _playlist[indexNum].title;
  }

  String getArtist(int indexNum) {
    return _playlist[indexNum].artist;
  }

  int getLenght() {
    return _playlist.length;
  }
}
