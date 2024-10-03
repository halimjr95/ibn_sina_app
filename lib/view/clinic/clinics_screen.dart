import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/layout_controller.dart';
import '../../core/widgets/indicator.dart';
import '../../model/clinic_model.dart';
import '../widgets/no_result_found.dart';
import '../widgets/search_widget.dart';
import 'doctors_screen.dart';
import 'widgets/carousel_slider.dart';

class ClinicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        builder: (controller) => controller.loading
            ? Center(child: Indicator())
            : Column(
                children: [
                  BuildCarouselSlider(
                    images: controller.adsImages,
                  ),
                  SearchWidget(
                    text: controller.queryClinic,
                    hintText: '',
                    onChanged: controller.searchClinic,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: controller.queryClinic != '' &&
                              controller.clinicSearchResult.isEmpty
                          ? NoResultFound()
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.all(8.0),
                              itemBuilder: (context, index) => buildClinicItem(
                                  controller.queryClinic == ''
                                      ? controller.clinics[index]
                                      : controller.clinicSearchResult[index],
                                  context,
                                  index,
                                  controller),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 1.0,
                                      childAspectRatio: 1 / 1.1),
                              itemCount: controller.queryClinic == ''
                                  ? controller.clinics.length
                                  : controller.clinicSearchResult.length,
                              // children: List.generate(
                              //     controller.clinics.length,
                              //         (index) => buildClinicItem(controller.clinics[index]),
                              // ),
                            ),
                    ),
                  ),
                ],
              ));
  }

  Widget buildClinicItem(
          Clinic clinic, context, index, LayoutController controller) =>
      InkWell(
        onTap: () {
          controller.changeClinicId(clinic.cid!);

          // controller.addDoctor(DoctorModel(name: 'Madinaty Doctor1', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty Doctor2', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty Doctor3', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty Doctor4', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty Doctor5', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty Doctor6', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty Doctor7', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);

          // controller.addDoctor(DoctorModel(name: 'Madinaty2 Doctor1', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty2 Doctor2', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty2 Doctor3', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty2 Doctor4', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty2 Doctor5', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty2 Doctor6', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Madinaty2 Doctor7', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);

          // controller.addDoctor(DoctorModel(name: 'Rehab Doctor1', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Rehab Doctor2', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Rehab Doctor3', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Rehab Doctor4', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Rehab Doctor5', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Rehab Doctor6', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);
          // controller.addDoctor(DoctorModel(name: 'Rehab Doctor7', day: ['Sunday', 'Friday'], time: ['5:00 PM - 7:00 PM', '5:00 PM - 7:00 PM'],img: 'https://firebasestorage.googleapis.com/v0/b/mdpoly-459f8.appspot.com/o/doctor.jpg?alt=media&token=f23efb47-ca21-4617-b51e-9c9549eb4d15',phone: '164416161'), controller.clinicId);

          controller.getClinicDoctor(clinic.cid!);
          controller.getClinic(clinic.cid!);
          // controller.addReservation();

          Get.to(() => DoctorsScreen());
        },
        child: Card(
            elevation: 2.0,
            child: new Container(
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 3,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                        flex: 6,
                        child: Image(image: NetworkImage(clinic.img!))),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          '${clinic.name}',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
}
