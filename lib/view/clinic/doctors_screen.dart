import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inb_sina/core/constants.dart';

import '../../controller/layout_controller.dart';
import '../../core/widgets/indicator.dart';
import '../../model/doctor_model.dart';
import '../widgets/no_result_found.dart';
import '../widgets/search_widget.dart';
import 'doctor_profile_screen.dart';
import 'widgets/carousel_slider.dart';


class DoctorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: Image(
                image: AssetImage(controller.appBarImg),
                // height: 50,
                width: 100,
              ),
              centerTitle: true,
              backgroundColor: Colors.grey[50],
              iconTheme: IconThemeData(
                color: MainColor,
                size: 30.0,
              ),
            ),
            body: controller.loading
                ? Center(child: Indicator())
                : Column(
                    children: [
                      BuildCarouselSlider(
                        images: controller.adsDoctorsImages,
                      ),
                      SearchWidget(
                        text: controller.queryDoctor,
                        hintText: '',
                        onChanged: controller.searchDoctor,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: controller.queryDoctor != '' &&
                                  controller.doctorSearchResult.isEmpty
                              ? NoResultFound()
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(10.0),
                                  itemBuilder: (context, index) =>
                                      buildDoctorItem(
                                          controller.queryDoctor == ''
                                              ? controller.clinicDoctors[index]
                                              : controller
                                                  .doctorSearchResult[index],
                                          context,
                                          index,
                                          controller),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 1.0,
                                          mainAxisSpacing: 1.0,
                                          childAspectRatio: 1 / 1.22),
                                  itemCount: controller.queryDoctor == ''
                                      ? controller.clinicDoctors.length
                                      : controller.doctorSearchResult.length,
                                  // children: List.generate(
                                  //     controller.clinics.length,
                                  //         (index) => buildClinicItem(controller.clinics[index]),
                                  // ),
                                ),
                        ),
                      ),
                    ],
                  )));
  }

  Widget buildDoctorItem(
          DoctorModel model, context, index, LayoutController controller) =>
      InkWell(
        onTap: () {
          controller.changeDoctorId(model.doctorId!);
          controller.getDoctor(controller.clinicId, controller.doctorId);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DoctorProfile(),
          //   ),
          // );
          Get.to(() => DoctorProfile());
        },
        child: Card(
            elevation: 2.0,
            // color: Colors.blue[50],
            child: new Container(
              // height: MediaQuery.of(context).size.width / 6,
              // width: MediaQuery.of(context).size.width / 3,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.height / 11.5,
                          backgroundColor: MainColor2,
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.height / 12,
                            backgroundColor: Colors.white,
                            child: Hero(
                              tag: model.doctorId!,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(model.img!),
                                radius:
                                    MediaQuery.of(context).size.height / 12.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 2.0,),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          '${model.name}',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
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

// Container(
// padding: EdgeInsets.all(1),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(300),
// border: Border.all(
// color: Colors.green,
// // width: 3,
// ),
// ),
// child: CircleAvatar(
// backgroundColor: Colors.transparent,
// backgroundImage: NetworkImage(model.img!),
// radius: 70,
// ),
// ),
