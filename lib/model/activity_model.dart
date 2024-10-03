import 'package:intl/intl.dart';

class ActivityModel
{
  String? title;
  String? body;
  String? id;
  String? time;

  ActivityModel({required this.title, required this.body, required this.id});

  ActivityModel.fromJson(Map<String, dynamic> json, String activityId)
  {
    title = json['title'];
    body = json['body'];
    id = activityId;
    time = json['time'] != null ? DateFormat('EEE, MMM d, ''yyyy').format(json['time'].toDate()) : '';
  }
}