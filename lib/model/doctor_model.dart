
class DoctorModel
{
  String? name;
  String? phone;
  String? img;
  String? doctorId;
  String? about;
  List? day = [];
  List? time = [];

  DoctorModel({this.name, this.phone, this.img,  this.doctorId, this.about ,this.day, this.time});

  DoctorModel.fromJson(Map<String, dynamic> json, String id)
  {
    name = json['name'];
    img = json['img'];
    phone = json['phone']!= null ? json['phone'] : '';
    about = json['about'] != null ? json['about'] : '';
    doctorId = id;
    json['day'].forEach((element) {
      day!.add(element);
    });
    json['time'].forEach((element) {
      time!.add(element);
    });
    // json['day'].forEach((e){
    //   day.add(e);
    // });
  }

}