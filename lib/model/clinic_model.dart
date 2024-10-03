class Clinic {
  String? name;
  String? img;
  String? cid;

  Clinic({required this.name, required this.img, this.cid});

  Clinic.fromJson(Map<String, dynamic> json, String id) {
    cid = id;
    name = json['name'];
    img = json['img'];
  }
}
