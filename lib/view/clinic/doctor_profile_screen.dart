import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inb_sina/core/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/layout_controller.dart';
import '../../core/widgets/indicator.dart';
import 'book_screen.dart';

class DoctorProfile extends StatelessWidget {
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
                  color: MainColor2,
                  size: 30.0,
                ),
              ),
              body: controller.loading
                  ? Center(child: Indicator())
                  : CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          // stretch: true,
                          expandedHeight:
                              MediaQuery.of(context).size.height / 6,
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.grey[50],
                          // pinned: true,
                          // toolbarHeight: 80,
                          flexibleSpace: FlexibleSpaceBar(
                            // stretchModes: [
                            //   StretchMode.zoomBackground
                            // ],
                            background: Container(
                              color: Colors.grey[50],
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 6,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: MainColor2,
                                  // backgroundImage: NetworkImage(controller.doctor!.img!),
                                  child: Hero(
                                    tag: controller.doctor!.doctorId!,
                                    child: CircleAvatar(
                                      radius: 65,
                                      backgroundImage:
                                          NetworkImage(controller.doctor!.img!),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Divider(
                                height: 1.5,
                                thickness: 2.0,
                                // color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '${controller.doctor!.name}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0),
                                ),
                              ),
                              Divider(
                                height: 1.5,
                                thickness: 2.0,
                              ),
                              if (controller.doctor!.about != '')
                                Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0,
                                            left: 30.0,
                                            right: 30.0,
                                            bottom: 30.0),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (controller.isEn == null ||
                                                  controller.isEn == false)
                                                Text(
                                                  'التخصص:',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18.0),
                                                ),
                                              Text(
                                                '${controller.doctor!.about}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 1.5,
                                      thickness: 2.0,
                                    ),
                                  ],
                                ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      left: 30.0,
                                      right: 30.0,
                                      bottom: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text(
                                      //   'Phone Number:',
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.w600,
                                      //       fontSize: 18.0),
                                      // ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        onPressed: () => launch(
                                            'tel:${controller.doctor!.phone}'),
                                        elevation: 3.0,
                                        minWidth: double.infinity,
                                        height: 60.0,
                                        color: Colors.indigo[50],
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color: MainColor2,
                                              size: 30.0,
                                            ),
                                            SizedBox(
                                              width: 20.0,
                                            ),
                                            Text(
                                              '${controller.doctor!.phone}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17.0),
                                            ),
                                            Spacer(),
                                            Icon(Icons.arrow_forward_ios),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1.5,
                                thickness: 2.0,
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0,
                                      left: 30.0,
                                      right: 30.0,
                                      bottom: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Directionality(
                                          textDirection:
                                              (controller.isEn == null ||
                                                      controller.isEn == false)
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                          child: Text(
                                            (controller.isEn == null ||
                                                    controller.isEn == false)
                                                ? 'احجز الآن:'
                                                : 'Book now',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          onPressed: () {
                                            controller.changeDayIndex(index);
                                            Get.to(() => BookScreen());
                                          },
                                          elevation: 3.0,
                                          minWidth: double.infinity,
                                          height: 75.0,
                                          color: Colors.indigo[50],
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                size: 50.0,
                                                color: MainColor2,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${controller.doctor!.day![index]}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 17.0),
                                                    ),
                                                    SizedBox(
                                                      height: 0.0,
                                                    ),
                                                    Text(
                                                      '${controller.doctor!.time![index]}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.grey,
                                                          fontSize: 16.0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          height: 10.0,
                                        ),
                                        itemCount:
                                            controller.doctor!.day!.length,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.green[200],
                              // backgroundImage: NetworkImage(controller.doctor!.img!),
                              child: Hero(
                                tag: controller.doctor!.doctorId!,
                                child: CircleAvatar(
                                  radius: 65,
                                  backgroundImage:
                                      NetworkImage(controller.doctor!.img!),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.5,
                          thickness: 2.0,
                          // color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${controller.doctor!.name}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20.0),
                          ),
                        ),
                        Divider(
                          height: 1.5,
                          thickness: 2.0,
                        ),*/
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       right: 60.0, left: 60.0, top: 5.0, bottom: 5.0),
                        //   child: MaterialButton(
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5.0)),
                        //     onPressed: () {
                        //       Get.to(() => BookScreen());
                        //     },
                        //     elevation: 3.0,
                        //     minWidth: double.infinity,
                        //     height: 40.0,
                        //     color: Colors.green[300],
                        //     child: controller.loading
                        //         ? CircularProgressIndicator()
                        //         : Text(
                        //             // 'Book Now',
                        //             'احجز الآن',
                        //             style: TextStyle(
                        //                 fontWeight: FontWeight.w600,
                        //                 fontSize: 16.0,
                        //                 color: Colors.white),
                        //           ),
                        //   ),
                        // ),
                        // Divider(
                        //   height: 1.5,
                        //   thickness: 2.0,
                        // ),
                        /*Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                if(controller.doctor!.about != '')
                                Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0,
                                            left: 30.0,
                                            right: 30.0,
                                            bottom: 30.0),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'التخصص:',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18.0),
                                              ),
                                              Text(
                                                '${controller.doctor!.about}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 1.5,
                                      thickness: 2.0,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0,
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 30.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   'Phone Number:',
                                        //   style: TextStyle(
                                        //       fontWeight: FontWeight.w600,
                                        //       fontSize: 18.0),
                                        // ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          onPressed: () => launch(
                                              'tel:${controller.doctor!.phone}'),
                                          elevation: 3.0,
                                          minWidth: double.infinity,
                                          height: 60.0,
                                          color: Colors.grey[100],
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                color: Colors.green,
                                                size: 30.0,
                                              ),
                                              SizedBox(
                                                width: 20.0,
                                              ),
                                              Text(
                                                '${controller.doctor!.phone}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17.0),
                                              ),
                                              Spacer(),
                                              Icon(Icons.arrow_forward_ios),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1.5,
                                  thickness: 2.0,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0,
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              'احجز الآن:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        ListView.separated(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            onPressed: () {
                                              controller.changeDayIndex(index);
                                              Get.to(() => BookScreen());
                                            },
                                            elevation: 3.0,
                                            minWidth: double.infinity,
                                            height: 75.0,
                                            color: Colors.green[100],
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  size: 50.0,
                                                  color: Colors.green,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${controller.doctor!.day![index]}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 17.0),
                                                      ),
                                                      SizedBox(
                                                        height: 0.0,
                                                      ),
                                                      Text(
                                                        '${controller.doctor!.time![index]}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.grey,
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                              ],
                                            ),
                                          ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                            height: 10.0,
                                          ),
                                          itemCount:
                                              controller.doctor!.day!.length,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),*/
                      ],
                    ),
            ));
  }
}
