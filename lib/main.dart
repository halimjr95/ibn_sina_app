import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import 'controller/notification_handler.dart';
import 'core/binding.dart';
import 'core/utils/size_config.dart';
import 'view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyAHH6Y7ASUvZqALZvKU9Y4fbXgbkhrf3bs',
        appId: '1:793271240901:android:ddb3a48d0f6f7b27b848ac',
        messagingSenderId: '793271240901',
        projectId: 'ibn-sina-app-dd53f',
        storageBucket: 'ibn-sina-app-dd53f.appspot.com',
      )
  );

  await GetStorage.init();

  notificationHandler();

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
