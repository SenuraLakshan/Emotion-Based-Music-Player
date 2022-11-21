import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/PlayListsModel.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {

    Playlist playlist = Get.arguments ?? Playlist.playlists[0];

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF303151).withOpacity(0.2),
              const Color(0xFF303151).withOpacity(0.8)
            ],
          )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('PlayList'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _playlistInformation(playlist: playlist),
                const SizedBox(height: 30,),
                const _playOrShuffleSwitch(),
                ListView.builder(
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: playlist.songs.length,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                        Get.toNamed('/song',arguments: playlist);
                        },
                        child: ListTile(
                          leading: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(
                            playlist.songs[index].title,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle:
                            Text('${playlist.songs[index].description} - 02:45',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          trailing: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

class _playlistInformation extends StatelessWidget {
  const _playlistInformation({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(playlist.imageUrl,
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.height*0.3,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30,),
        Text(
          playlist.title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _playOrShuffleSwitch extends StatefulWidget {
  const _playOrShuffleSwitch({Key? key}) : super(key: key);

  @override
  State<_playOrShuffleSwitch> createState() => _playOrShuffleSwitchState();
}

class _playOrShuffleSwitchState extends State<_playOrShuffleSwitch> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xFF31314F).withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              left: isPlay ? 0 : width *0.45,
              child: Container(
                height: 50,
                width: width*0.45,
                decoration: BoxDecoration(
                  color: const Color(0xFF31314F).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('Play',
                          style: TextStyle(
                            color: isPlay ? Colors.white: Colors.deepPurple,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Icon(
                        Icons.play_circle,
                        color: isPlay ? Colors.white : Colors.deepPurple,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('Shuffle',
                          style: TextStyle(
                            color: isPlay ? Colors.deepPurple: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Icon(
                        Icons.shuffle,
                        color: isPlay ? Colors.deepPurple: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
