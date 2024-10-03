import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/layout_controller.dart';
import '../../../core/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../layout/home_layout_screen.dart';
import 'home_card.dart';



class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (_) => Expanded(
        child: Container(
          constraints: BoxConstraints(maxWidth: 450.0),
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: SizeConfig.defaultSize! * 1.5,
            crossAxisSpacing: SizeConfig.defaultSize! * 1.5,
            childAspectRatio: 1 / 1,
            padding: EdgeInsets.only(bottom: 60.0, top: 10.0),
            children: [
              GestureDetector(
                  onTap: () {
                    _.changeCurrentindex(0, main2);
                    _.changeHospital(controller.clinicPath);
                    _.getClinics();
                    Get.to(() => HomeLayout());
                  },
                  child: HomeCard(img: clinicImg)),
              GestureDetector(
                  onTap: () {
                    _.changeCurrentindex(1, main2);
                    Get.to(() => HomeLayout());
                  },
                  child: HomeCard(img: locationImg)),

            ],
          ),
        ),
      ),
    );
  }
}
