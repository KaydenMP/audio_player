import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'songs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache cachePlayer = AudioCache();
  MyPlayList songList = MyPlayList();

  var result;
  int index = 0;
  bool songPlaying = false;

  void play() async {
    result = await cachePlayer.play(songList.getSongName(index));
    print('playing');
  }

  void pause() async {
    await result.pause();
    print('stopped');
  }

  void nextSong() {
    setState(() {
      if (index == songList.getLenght() - 1) {
        index = 0;
      } else {
        index++;
      }
    });
  }

  void previousSong() {
    setState(() {
      if (index == 0) {
        index = songList.getLenght() - 1;
      } else {
        index--;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MUSIC PLAYER',
          style: GoogleFonts.aBeeZee(),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 120, 176, 202),
                ),
                child: Icon(Icons.music_note_rounded, size: 20)),
            ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
              leading: const Icon(Icons.music_note_outlined),
              title: const Text('My Playlist'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),

      // backgroundColor: Color.fromARGB(255, 88, 201, 250),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Image(
                image: AssetImage(songList.getImageName(index)),
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              songList.getTitle(index),
              style: GoogleFonts.acme(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              songList.getArtist(index),
              style: GoogleFonts.adamina(fontSize: 17),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    previousSong();
                  },
                  icon: const Icon(Icons.skip_previous_outlined),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () {
                    if (songPlaying == false) {
                      setState(() {
                        play();
                      });
                    } else {
                      setState(() {
                        pause();
                      });
                    }
                    setState(() {
                      songPlaying = !songPlaying;
                    });
                  },
                  icon: songPlaying
                      ? const Icon(Icons.pause_circle)
                      : const Icon(Icons.play_arrow_rounded),
                  iconSize: 65,
                ),
                IconButton(
                  onPressed: () {
                    pause();
                    nextSong();
                  },
                  icon: const Icon(Icons.skip_next_outlined),
                  iconSize: 50,
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
