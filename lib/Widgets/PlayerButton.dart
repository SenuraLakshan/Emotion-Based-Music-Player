import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
            builder: (context, index){
              return IconButton(
                iconSize: 35,
                  onPressed:
                    audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null,
                  icon: const Icon(
                      Icons.skip_previous,
                    color: Colors.white,
                  ),
              );
            }
        ),


        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot){
            if(snapshot.hasData){
              final playerState = snapshot.data;
              final processingState =
                  playerState!.processingState;

              if(processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering){
                return Container(
                  width: 54.0,
                  height: 54.0,
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                );
              } else if (!audioPlayer.playing){
                return IconButton(
                  onPressed: audioPlayer.play,
                  iconSize: 65,
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  ),
                );
              } else if(processingState!= ProcessingState.completed){
                return IconButton(
                  onPressed: audioPlayer.pause,
                  iconSize: 65,
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  ),
                );
              } else{
                return IconButton(
                  onPressed: () => audioPlayer.seek(Duration.zero,
                      index: audioPlayer.effectiveIndices!.first),
                  iconSize: 65,
                  icon: const Icon(
                    Icons.replay_circle_filled_outlined,
                    color: Colors.white,
                  ),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),

        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index){
              return IconButton(
                iconSize: 35,
                onPressed:
                audioPlayer.hasNext ? audioPlayer.seekToNext : null,
                icon: const Icon(
                  Icons.skip_next,
                  color: Colors.white,
                ),
              );
            }
        ),
      ],
    );
  }
}
