import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import 'controller/notification_handler.dart';
import 'core/binding.dart';
import 'core/utils/size_config.dart';
import 'view/splash/splash_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //       apiKey: "AIzaSyCHnDWAr4RPsE1ucWijsiY0Mm-GIVy-kEM",
  //       authDomain: "ibn-sina-app-dd53f.firebaseapp.com",
  //       projectId: "ibn-sina-app-dd53f",
  //       storageBucket: "ibn-sina-app-dd53f.appspot.com",
  //       messagingSenderId: "793271240901",
  //       appId: "1:793271240901:web:1f51e03079f697fab848ac",
  //       measurementId: "G-NX2MM0WY9F"
  //     )
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );


  // notificationHandler();

  SizeConfig();
  // GetStorage().write('isActivity', false);
  // FirebaseMessaging.instance.subscribeToTopic('res');

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Janna',
        // appBarTheme: const AppBarTheme(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: Colors.white10,
        //     statusBarIconBrightness: Brightness.dark,
        //   ),
        // ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: SplashScreen(),
    );
  }
}
