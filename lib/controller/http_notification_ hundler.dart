import 'dart:convert';

import 'package:http/http.dart' as http;

class Http {
  static Uri url = Uri.parse("https://fcm.googleapis.com/fcm/send");

  // static String key =
  //     "AAAAPGUr-cI:APA91bHAneX5V_d2bgeJxqZbyuaHCdAVsH0WX9eJrB9za3FGnJyOk01kZlFI2jXBoyStRuxgTJikg6Ujf5dCYjzi1QHuzF4U8cG74fB_HT1SPhUBf3TCauQbbfWa4K0CkCL7aYbDfmi0";


  Map<String, dynamic> fcmBody({required String name, required String clinic, String topic='reservations'})
  {
    return {
      "to": "/topics/$topic",
      "notification": {
        "title": clinic,
        "body": name,
        "sound": "default"
      },
      "android": {
        "priority": "HIGH",
        "notification": {
          "notification_priority": "PRIORITY_MAX",
          "sound": "default",
          "default_sound": "true",
          "default_vibrate_timings": "true",
          "default_light_settings": "true"
        }
      },
      "date": {"click_action": "FLUTTER_NOTIFICATION_CLICK"}
    };
  }

  void pushNotification(url, key, name, clinic, {String topic='reservations'}) async {
    await http.post(
      url,
      body: json.encode(fcmBody(name: name, clinic: clinic ,topic: topic)),
      headers: {
        'Content-type': 'application/json',
        "Authorization": "key=$key"
      },
    ).then((http.Response response) {
          // final int statusCode = response.statusCode;
          // print("====response ${response.body.toString()}");
    });
  }
}


