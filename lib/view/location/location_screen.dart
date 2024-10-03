import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../controller/layout_controller.dart';
import '../../core/constants.dart';

class LocationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                // color: Colors.blue[200],
                  image: DecorationImage(
                    image: AssetImage(locationImg_),
                  )
              ),
            ),
            Divider(
              height: 1.5,
              thickness: 2.0,
              // color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                (controller.isEn == null ||
                    controller.isEn == false)
                    ? 'أين تجدنا' : 'Find us',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 25.0),
              ),
            ),
            Divider(
              height: 1.5,
              thickness: 2.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 30.0,
                            right: 30.0,
                            bottom: 30.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hotline:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5.0)),
                              onPressed: () => launch(
                                  'tel:${controller.hotlineNumber}'),
                              elevation: 3.0,
                              minWidth: double.infinity,
                              height: 60.0,
                              color: Colors.grey[50],
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
                                    '${controller.hotlineNumber}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0),
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
                            bottom: 30.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Locations:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5.0)),
                              onPressed: () => launch(
                                  'https://maps.app.goo.gl/6aUaGUmcptEsaNmC9'),
                              elevation: 3.0,
                              minWidth: double.infinity,
                              height: 60.0,
                              color: Colors.grey[50],
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: MainColor2,
                                    size: 40.0,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Image(
                                    image: AssetImage(main2),
                                    height: 50.0,
                                    width: 50.0,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  // Text(
                                  //   'Madinaty B6',
                                  //   maxLines: 1,
                                  //   style: TextStyle(
                                  //       fontWeight: FontWeight.w500,
                                  //       fontSize: 20.0),
                                  // ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
