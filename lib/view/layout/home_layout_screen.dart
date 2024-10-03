import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/layout_controller.dart';
import '../../core/constants.dart';
import '../home/home_screen.dart';


class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //           begin: Alignment.topLeft,
          //           end: Alignment.bottomRight,
          //           colors: <Color>[
          //             Colors.blue,
          //           ])
          //   ),
          // ),
          // titleSpacing: 100.0,
          title: Image(
            image: AssetImage(controller.appBarImg),
            // height: 50,
            width: 100,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[50],
          actions: [
            // Stack(
            //   alignment: Alignment.bottomRight,
            //   children: [
            //     controller.myAvticityIcon
            //         ? Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: CircleAvatar(
            //               backgroundColor: Colors.red,
            //               radius: 5.0,
            //             ),
            //           )
            //         : Text(''),
            //   ],
            // ),
            SizedBox(
              width: 7,
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors.blue,
            size: 30.0,
          ),
        ),
        body: controller.screens[controller.currentIndex],
        drawer: Container(
          width: 250.0,
          child: Drawer(
            elevation: 0.0,
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.only(top: 40.0),
                children: [

                  Container(
                    height: 130,
                    // color: Colors.blue[50],
                    child: const DrawerHeader(
                        decoration: BoxDecoration(),
                        child: Center(
                            child: Image(
                          image: AssetImage(logo),
                          height: 100.0,
                          width: 120.0,
                        ))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Divider(
                      //   height: 1,
                      //   thickness: 1,
                      // ),
                      ///////////////////////////////////////////////////////

                      ///////////////////////////////////////////////////////

                      ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/1.png'),
                              height: 40.0,
                              width: 40.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Clinics',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            )
                          ],
                        ),
                        onTap: () {
                          controller.changeHospital(controller.clinicPath);
                          controller.changeCurrentindex(0, main2);
                          Navigator.pop(context);
                          controller.getClinics();
                        },
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/9.png'),
                              height: 40.0,
                              width: 40.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Locations',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            )
                          ],
                        ),
                        onTap: () {
                          controller.changeCurrentindex(1, main2);
                          Navigator.pop(context);
                        },
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ToggleButtons(
                          // fillColor: Colors.grey,
                          borderColor: MainColor2,
                          selectedBorderColor: MainColor2,
                          selectedColor: MainColor2,
                          borderRadius: BorderRadius.circular(Get.width * 0.1),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('عربي'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('English'),
                            ),
                          ],
                          onPressed: (i) {
                            print(i);
                            bool lan = i == 0 ? false : true;
                            if (controller.isEn != lan){
                              Get.off(() => HomeScreen(),
                                  transition: Transition.fade);
                            }
                            controller.writeLang(i);
                          },
                          isSelected: [
                            (controller.isEn == null ||
                                controller.isEn == false),
                            !(controller.isEn == null ||
                                controller.isEn == false)
                          ],
                        ),
                        // Text('Toggle Value : ${controller.isEn}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
