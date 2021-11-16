 import 'package:flutter/material.dart';
import 'package:oxy/notifications.dart';
import 'package:provider/provider.dart';
//import 'package:oxy/notifications.dart';
//import 'package:provider/provider.dart';

 class Alarm extends StatefulWidget {
   const Alarm({Key? key}) : super(key: key);

   @override
   _AlarmState createState() => _AlarmState();
 }

 class _AlarmState extends State<Alarm> {
   @override
   void initState() {
     Provider.of<NotificationService>(context, listen: false).initialize();
     super.initState();
   }

   @override
           Widget build(BuildContext context) {
   //  var model;
     return Scaffold(

       appBar: AppBar(
         backgroundColor: Color(0xFF4F311C),
         title: Text('Back'),
       ),
          body: Container(

              decoration: BoxDecoration(
                image: DecorationImage(
              //    image: NetworkImage('https://i.pinimg.com/originals/34/a7/41/34a741a07b3981632e1b780a2acc2d7c.jpg'),
                    image: AssetImage('images/notifibag.png'),
                  fit: BoxFit.cover,
                ),
              ),

             child: Center(
           child:  Consumer<NotificationService>(
                   builder: (context, model, _) =>
                       Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        // ElevatedButton(
                        //     onPressed: () => model.instantNofitication(),
                        //     child: Text('Instant Notification')),
                        // ElevatedButton(
                        //     onPressed: () => model.imageNotification(),
                        //     child: Text('Image Notification')),
                        // ElevatedButton(
                        //     onPressed: () => model.stylishNotification(),
                        //     child: Text('Media Notification')),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Color(0xFF624226),shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),)),
                            onPressed: () => model.scheduledNotification(),
                            child: Text('Scheduled Notification')),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Color(0xFF0E0000),shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0),)),
                            onPressed: () => model.cancelNotification(),
                            child: Text('Cancel Notification')),
                      ]),

                ) )

          ));


   }
 }





