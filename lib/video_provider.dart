import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends StatelessWidget {
    final VideoPlayerController controller;



 // const  VideoProvider (VideoPlayerController controller);

 const VideoProvider(this.controller);

  @override
  Widget build(BuildContext context) =>
    controller !=null && controller.value.isInitialized?Container(alignment: Alignment.topCenter,child: buildVideo())
      :Container(height: 200.0,child: Center(child: CircularProgressIndicator()),
    );

    Widget buildVideo()=> buildVideoPlayer();

    Widget buildVideoPlayer()=> VideoProvider(controller);
    // return AspectRatio(
    //   aspectRatio: 16 / 9,
    //   child: VideoPlayer(
    //       controller
    //   ),
    // );
  }
