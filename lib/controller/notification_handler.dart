import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'layout_controller.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  LayoutController controller = Get.put(LayoutController());

  await GetStorage.init();

  await GetStorage().write('isActivity', true);
  controller.getActivityIcon();

}

void notificationHandler() async {

  await FirebaseMessaging.instance.getToken();

  FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  LayoutController controller = Get.put(LayoutController());


  FirebaseMessaging.onMessage.listen((event) async {
    await GetStorage().write('isActivity', true);
    controller.getActivityIcon();
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) async {
    await GetStorage().write('isActivity', true);
    controller.getActivityIcon();
  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


}