import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:oxy/notifications.dart';

import 'package:oxy/set_alarm.dart';


import 'package:oxy/temp.dart';
//import 'package:provider/provider.dart';






void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
      home: BaseApp()));

}

class BaseApp extends StatefulWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

       backgroundColor: Color(0xFF4F311C),
     // backgroundColor: Colors.blueGrey,
        body: Container(
          decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomCenter, colors: [Colors.black26,Colors.black,] )),

        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 40.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          child: Text('Set Reminder',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => Alarm())).then((value) => Alarm());
                          }
                      ),

                      Icon(Icons.notifications,
                        color: Colors.grey,
                      ),
                    ]
                ),
                SizedBox(
                  height: 180,
                ),
                Expanded(

                  child: Container(
                    margin: EdgeInsets.only(left: 120.0),
                    child: Text('OxyFlow',
                      style: TextStyle(
                        color: Colors.orange[300],
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                ),

              ],
            )
        ),



        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 130.0,bottom: 30.0),
          child: FloatingActionButton(
              backgroundColor: Color(0xFF6E260E),
         //     backgroundColor: Colors.red,
              child: Icon(Icons.play_circle_fill_rounded),
              onPressed: () async {
              await  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoExample()))
                    .then((value) => VideoExample());
              }
          ),
        )

    );
  }

  }
