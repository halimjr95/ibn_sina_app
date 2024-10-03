import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inb_sina/core/constants.dart';

import '../../controller/http_notification_ hundler.dart';
import '../../controller/layout_controller.dart';
import '../../core/widgets/indicator.dart';


class BookScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Image(
                  image: AssetImage(controller.appBarImg),
                  // height: 50,
                  width: 100
                  ,
                ),
                centerTitle: true,
                backgroundColor: Colors.grey[50],
                iconTheme: IconThemeData(
                  color: Colors.blue,
                  size: 30.0,
                ),
              ),
              body: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Directionality(
                      textDirection:
                          (controller.isEn == null || controller.isEn == false)
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0, right: 30.0, left: 30.0, bottom: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${controller.clinic!.name}',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            Divider(
                              thickness: 2.0,
                            ),
                            Text(
                              '${controller.doctor!.name}',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            Divider(
                              thickness: 2.0,
                            ),
                            Text(
                              '${controller.doctor!.day![controller.dayIndex]}',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            (controller.isEn == null ||
                                    controller.isEn == false)
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: controller.reservationType,
                                        items: controller.listReservationType
                                            .map(buildMenuItem)
                                            .toList(),
                                        onChanged: (value) => controller
                                            .changeReservationType(value!),
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: controller.reservationTypeE,
                                        items: controller.listReservationTypeE
                                            .map(buildMenuItem)
                                            .toList(),
                                        onChanged: (value) => controller
                                            .changeReservationTypeE(value!),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 15.0,
                            ),
                            (controller.isEn == null ||
                                    controller.isEn == false)
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: controller.paymentType,
                                        items: controller.listPaymentType
                                            .map(buildMenuItem)
                                            .toList(),
                                        onChanged: (value) => controller
                                            .changePaymentType(value!),
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: controller.paymentTypeE,
                                        items: controller.listPaymentTypeE
                                            .map(buildMenuItem)
                                            .toList(),
                                        onChanged: (value) => controller
                                            .changePaymentTypeE(value!),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              controller: nameController,
                              onFieldSubmitted: (String value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                }
                              },
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: (controller.isEn == null ||
                                        controller.isEn == false)
                                    ? 'الأسم'
                                    : 'Name',
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                border: OutlineInputBorder(),
                                focusColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              controller: phoneController,
                              onFieldSubmitted: (String value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your phone';
                                }
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: (controller.isEn == null ||
                                        controller.isEn == false)
                                    ? 'رقم الهاتف'
                                    : 'Phone Number',
                                prefixIcon: Icon(
                                  Icons.phone,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print(controller.reservationType +
                                      controller.paymentType);
                                  controller
                                      .addReservation(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    clinic: controller.clinic!.name!,
                                    doctor: controller.doctor!.name!,
                                    resType: controller.reservationType,
                                    payType: controller.paymentType,
                                    day: controller
                                        .doctor!.day![controller.dayIndex],
                                    platform:
                                        Platform.isIOS ? 'Iphone' : 'Android',
                                  )
                                      .then((value) {
                                    Get.back();
                                    final snackBar = SnackBar(
                                      content: Directionality(
                                          textDirection:(controller.isEn == null || controller.isEn == false) ? TextDirection.rtl : TextDirection.ltr,
                                          child: Text(
                                            (controller.isEn == null ||
                                                    controller.isEn == false)
                                                ? 'سوف يتم التواصل معكم..'
                                                : 'We will contact you soon..',
                                            style: TextStyle(
                                              fontFamily: 'Janna',
                                              fontSize: 18.0,
                                            ),
                                          )),
                                      backgroundColor: MainColor2,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 15.0),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);

                                    Http().pushNotification(
                                        Http.url,
                                        controller.key,
                                        nameController.text,
                                        controller.clinic!.name!);
                                  }).catchError((error) {
                                    Get.snackbar(
                                        "Error", 'something went wrong',
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 4),
                                        margin: EdgeInsets.only(
                                            left: 20.0,
                                            right: 20.0,
                                            top: 30.0));
                                  });
                                }
                                // Get.to(()=> BookScreen());
                              },
                              elevation: 3.0,
                              minWidth: double.infinity,
                              height: 45.0,
                              color: MainColor2,
                              child: controller.loading
                                  ? Container(
                                      height: 25.0,
                                      width: 25.0,
                                      child: Indicator())
                                  : Text(
                                      (controller.isEn == null ||
                                              controller.isEn == false)
                                          ? 'حفظ'
                                          : 'Save',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.0,
                                          color: Colors.white),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ),
      );
}
