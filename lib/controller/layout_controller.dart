import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/activity_model.dart';
import '../model/clinic_model.dart';
import '../model/doctor_model.dart';
import '../view/clinic/clinics_screen.dart';
import '../view/location/location_screen.dart';


class LayoutController extends GetxController {
  static LayoutController instance = Get.find();
  @override
  void onInit() async {
    super.onInit();
    await Firebase.initializeApp();
    getLang();
    // await getPath();
    getKey();
    getNumbers();
    getAdsImages();
    getAdsDoctorsImages();
    getActivity();
    getActivityIcon();
  }

  bool? isEn;
  bool loading = false;
  int currentIndex = 0;

  String clinicId = '';
  String doctorId = '';
  int dayIndex = 0;

  List<Clinic> clinics = [];
  List<DoctorModel> clinicDoctors = [];

  Clinic? clinic;
  DoctorModel? doctor;

  String currentHospital = '';


  String appBarImg = '';

  String clinicPath = '';


  void getLang() async{
    isEn = GetStorage().read('isEn');
    getPath();
    // onInit();
    update();
  }


  void writeLang(int value) {
    bool lan = value == 0 ? false : true;
    GetStorage().write('isEn', lan);
    getLang();
    update();
  }



  Future<void> getPath() async {
    if (isEn == null || isEn == false){
      clinicPath = 'clinicPath';
    }else {
      clinicPath = 'clinicPath_e';
    }

    // print(surgery);
  }


  void changeHospital(String hospital) {
    currentHospital = hospital;
    update();
  }

  void changeCurrentindex(int index, String titleImg) {
    currentIndex = index;
    appBarImg = titleImg;
    update();
  }

  void changeDayIndex(int index) {
    dayIndex = index;
    update();
  }

  List<ActivityModel> activity = [];
  bool myAvticityIcon = GetStorage().read('isActivity') != null
      ? GetStorage().read('isActivity')
      : false;

  void getActivity() {
    FirebaseFirestore.instance
        .collection('Activity')
        .orderBy("time", descending: true)
        .snapshots()
        .listen((event) {
      activity = [];
      event.docs.forEach((doc) {
        activity.add(ActivityModel.fromJson(doc.data(), doc.id));
      });
      update();
    });
  }

  void getActivityIcon() {
    myAvticityIcon = GetStorage().read('isActivity') != null
        ? GetStorage().read('isActivity')
        : false;
    update();
  }

  // void deviceInfo() async
  // {
  //   final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  //   var build = await deviceInfoPlugin.androidInfo;
  //   var deviceName = build.model;
  //   var deviceVersion = build.version.toString();
  //   var identifier = build.androidId;  //UUID for Android
  //
  //
  //   print(deviceName);
  //   print(deviceVersion);
  //   print(identifier);
  //
  // }

  List<Widget> screens = [
    ClinicsScreen(), // index = 0
    LocationScreen(), // index = 1
  ];

  List<Widget> adsImages = [];


  void getAdsImages() async {
    await FirebaseStorage.instance.ref().child('Ads').listAll().then((value) {
      value.items.forEach((img) {
        print(img);
        FirebaseStorage.instance
            .ref()
            .child(img.fullPath)
            .getDownloadURL()
            .then((url) {
          // print(url);
          adsImages.add(Image(
            image: NetworkImage(url),
            width: double.infinity,
            fit: BoxFit.cover,
          ));
        });
      });
    }).catchError((error) {});
  }

  List<Widget> adsDoctorsImages = [];

  void getAdsDoctorsImages() async {
    await FirebaseStorage.instance
        .ref()
        .child('Ads/Doctors')
        .listAll()
        .then((value) {
      value.items.forEach((img) {
        FirebaseStorage.instance
            .ref()
            .child(img.fullPath)
            .getDownloadURL()
            .then((url) {
          // print(url);
          adsDoctorsImages.add(Image(
            image: NetworkImage(url),
            width: double.infinity,
            fit: BoxFit.cover,
          ));
        });
      });
    }).catchError((error) {});
  }

  void changeClinicId(String id) {
    clinicId = id;
    update();
  }

  void changeDoctorId(String id) {
    doctorId = id;
    update();
  }


  void getClinics() async {
    clearSearch();
    clinics = [];
    loading = true;
    update();
    await FirebaseFirestore.instance
        .collection(currentHospital)
        .get()
        .then((value) {
      value.docs.forEach((doc) {
        Map<String, dynamic> obj = doc.data();
        // Map<String, dynamic> obj = doc.data() as Map<String, dynamic>;
        clinics.add(Clinic.fromJson(obj, doc.id));
      });
    });
    loading = false;
    update();
  }


  void getClinicDoctor(String id) async {
    clearSearch();
    clinicDoctors = [];
    loading = true;
    update();
    await FirebaseFirestore.instance
        .collection(currentHospital)
        .doc(id)
        .collection('Doctors')
        .get()
        .then((value) {
      clinicDoctors = [];
      value.docs.forEach((doc) {
        Map<String, dynamic> obj = doc.data();
        clinicDoctors.add(DoctorModel.fromJson(obj, doc.id));
      });
    });
    loading = false;
    update();
  }

  void getDoctor(String cid, doctorId) async {
    doctor = null;
    loading = true;
    update();
    doctor = clinicDoctors.firstWhere((element) => element.doctorId == doctorId, orElse: doctor = null);
    loading = false;
    update();
  }

  void getClinic(String cid) async {
    clinic = null;
    loading = true;
    update();
    clinic = clinics.firstWhere((element) => element.cid == clinicId, orElse: clinic = null);

    // await FirebaseFirestore.instance
    //     .collection(currentHospital)
    //     .doc(cid)
    //     .get()
    //     .then((value) {
    //   if (value.exists) {
    //     clinic = Clinic.fromJson(value.data()!, clinicId);
    //     // print(value.data());
    //   }
    // });
    loading = false;
    update();
  }

  Future<void> addReservation({
    required String name,
    required String phone,
    required String clinic,
    required String doctor,
    required String day,
    required String resType,
    required String payType,
    String? platform,
  }) async {
    loading = true;
    update();
    return await FirebaseFirestore.instance
        .collection('$currentHospital Reservations')
        .add({
      'name': name,
      'phone': phone,
      'clinic': clinic,
      'doctor': doctor,
      'day': day,
      'resType': resType,
      'payType': payType,
      'replay': false,
      'timestamp': Timestamp.now(),
      'paltform': platform ?? '',
    }).then((value) {
      loading = false;
      update();
    }).catchError((onError) {
      loading = false;
      update();
    });
  }

  String kmNumber = '';
  String rscNumber = '';
  String emergencyNumber = '';
  String hotlineNumber = '';

  void getNumbers() {
    FirebaseFirestore.instance
        .collection('Numbers')
        .doc('1')
        .get()
        .then((value) {
      hotlineNumber = value['hotline'];
    }).catchError((error) {});
    update();
  }

  String key = '';

  void getKey() async {
    await FirebaseFirestore.instance
        .collection('Key')
        .doc('1')
        .get()
        .then((value) {
      key = value['key'];
    }).catchError((error) {});
    update();
  }


  List<String> listReservationDyas = ['السبت', 'الاحد','الاثنين','الثلاثاء','الاربعاء','الخميس','الجمعه'];
  List<String> listReservationDyasE = ['Sunday', 'Saturday','Monday','Tuesday','Wednesday','Thursday','Friday'];
  String reservationDay = 'السبت';
  String reservationDayE = 'Sunday';
  List<String> listReservationType = ['كشف', 'استشارة'];
  List<String> listReservationTypeE = ['Medical Examination', 'Consultation'];
  String reservationType = 'كشف';
  String reservationTypeE = 'Medical Examination';
  List<String> listPaymentType = ['نقدي', 'شركة تأمين'];
  List<String> listPaymentTypeE = ['Cash', 'Insurance'];
  String paymentType = 'نقدي';
  String paymentTypeE = 'Cash';

  void changePaymentType(String value) {
    this.paymentType = value;
    update();
  }
  void changePaymentTypeE(String value) {
    this.paymentTypeE = value;
    update();
  }

  void changeReservationType(String value) {
    this.reservationType = value;
    update();
  }
  void changeReservationTypeE(String value) {
    this.reservationTypeE = value;
    update();
  }

  void changeReservationDay(String value) {
    this.reservationDay = value;
    update();
  }
  void changeReservationDayE(String value) {
    this.reservationDayE = value;
    update();
  }


  ////////////////////////// Search /////////////////////////////////
  String queryClinic = '';
  String queryDoctor = '';
  List<Clinic> clinicSearchResult = [];
  List<DoctorModel> doctorSearchResult = [];

  void searchClinic(String query) {
    this.clinicSearchResult = clinics.where((clinic) {
      final searchLower = query.toLowerCase();
      return clinic.name!.toLowerCase().contains(searchLower);
    }).toList();
    this.queryClinic = query;
    update();
  }

  void searchDoctor(String query) {
    this.doctorSearchResult = clinicDoctors.where((doctor) {
      final searchLower = query.toLowerCase();
      return doctor.name!.toLowerCase().contains(searchLower);
    }).toList();
    this.queryDoctor = query;
    update();
  }

  void clearSearch() {
    queryClinic = '';
    queryDoctor = '';
    clinicSearchResult = [];
    doctorSearchResult = [];
    update();
  }

// List reservation = [];
//
// void getReservations() {
//   reservation = [];
//   FirebaseDatabase.instance
//       .reference()
//       .child('reservations/$currentHospital')
//       .once()
//       .then((DataSnapshot value) {
//     Map<dynamic, dynamic> values = value.value;
//     values.forEach((key, values) {
//       reservation.add(values);
//       // print(Timestamp.fromMillisecondsSinceEpoch(values['timestamp']).toDate());
//
//       final df = new DateFormat('dd-MM-yyyy hh:mm a');
//       // int myvalue = values['timestamp'];
//       print(df.format(
//           Timestamp.fromMillisecondsSinceEpoch(values['timestamp'])
//               .toDate()));
//     });
//   });
// }

}

// 4DFB8F18-ED86-4C20-89C3-E44A2AC26689
