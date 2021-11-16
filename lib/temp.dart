
import 'package:flutter/material.dart';
//import 'package:oxy/clone.dart';
//import 'package:oxy/main.dart';
//import 'package:oxy/clone.dart';
//import 'package:oxy/clone.dart';
import 'package:video_player/video_player.dart';



class VideoExample extends StatefulWidget {
  const VideoExample({Key? key}) : super(key: key);

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<VideoExample> {
     VideoPlayerController?  playerController;
   VoidCallback  ? listener;
      // int   _counter=0;
   //  bool _isButtonActive = true;

      
     // void _increaseCounter(){
     //   setState(() {
     //     _counter=_counter+1;
     //     _isButtonActive=false;
     //   });
     // }



  @override
 void   initState() {
    super.initState();
    listener = () {
      setState(() {});
    //  _isButtonActive=true;
    };
  }



  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.asset(
       'assets/video/ezgif.com-gif-maker.mp4'
      )
        ..addListener(listener!)
        ..setVolume(1.0)
        ..initialize()
        ..play();
    } else {
      if (playerController!.value.isPlaying) {
        playerController!.pause();
      } else {
        playerController!.initialize();
        playerController!.play();

      }
    }
  }

  @override
  void deactivate() async{
    playerController!.removeListener!(listener!);
    super.deactivate();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: Color(0xFF4F311C),
        title: Text('     4-7-8  Excercise'),
       // title: Text('Breath Count=$_counter'),


      ),

      body: Column(
          children: [
            Center(
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage('images/copybreath.png'),
                      //   image: NetworkImage('https://images.squarespace-cdn.com/content/v1/5ee13c397feb216c826bc1cf/1592160209352-KOFOCUJ5GMH9RD9MASGV/Copy+of+4-7-8+Breathing.png' ),fit: BoxFit.cover
                       )
                     ),

                      child: (playerController != null
                          ? VideoPlayer(
                        playerController!,
                      )
                          : Container()),
                    ))),
            SizedBox(height: 125.0),



          ]),

      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF6E260E),
            onPressed: (){
                     createVideo();
                       playerController!.play();
                      //  _increaseCounter();

          },

           child: const Icon(Icons.play_arrow),

      ),
    );
  }
}
