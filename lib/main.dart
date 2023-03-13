
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxy/clone.dart';
import 'package:oxy/notifications.dart';

//import 'package:oxy/notifications.dart';

//import 'package:oxy/set_alarm.dart';

//import 'package:oxy/set_alarm.dart';
//import 'package:oxy/temp.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';






 void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MaterialApp(

     home: MyApp()));

}


class MyApp extends StatelessWidget {





  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BaseApp(),

        ),
        providers: [
          ChangeNotifierProvider(create: (_) => NotificationService())
        ]);
  }
}











