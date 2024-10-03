import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/layout_controller.dart';
import '../../../core/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/space_widget.dart';
import '../../layout/home_layout_screen.dart';
import 'home_card.dart';
import 'home_list.dart';



class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<LayoutController>(
      builder: (_) => Container(

          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 3),
          decoration: BoxDecoration(
            color: MainColor,
            // image: DecorationImage(
            //   image: AssetImage(homeBackground),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpace(9.0),
              Image(
                image: AssetImage(logo),
                height: 80.0,
              ),
              // VerticalSpace(5),
              // HomeList(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VerticalSpace(3.0),
                    Container(
                      width: 180,
                      child: GestureDetector(
                          onTap: () {
                            _.changeCurrentindex(0, main2);
                            _.changeHospital(controller.clinicPath);
                            _.getClinics();
                            Get.to(() => HomeLayout());
                          },
                          child: HomeCard(img: clinicImg)),
                    ),
                    // VerticalSpace(10),
                    Container(
                      width: 180,
                      child: GestureDetector(
                          onTap: () {
                            _.changeCurrentindex(1, main2);
                            Get.to(() => HomeLayout());
                          },
                          child: HomeCard(img: locationImg)),
                    ),
                    VerticalSpace(3.0),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
