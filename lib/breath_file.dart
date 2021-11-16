import 'package:flutter/material.dart';
import 'package:oxy/video_provider.dart';
import 'package:video_player/video_player.dart';

class AssetPlayer extends StatefulWidget {
  const AssetPlayer({Key? key}) : super(key: key);

  @override
  _AssetPlayerState createState() => _AssetPlayerState();
}

class _AssetPlayerState extends State<AssetPlayer> {
 // final asset= 'assets/vdd.mp4';
  late VideoPlayerController controller;
  late VoidCallback listener;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller= VideoPlayerController.network('images/breath1.gif')

    ..addListener(() { })
    ..setLooping(true)
    ..initialize().then((value) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return VideoProvider(controller=controller);

  }
}





