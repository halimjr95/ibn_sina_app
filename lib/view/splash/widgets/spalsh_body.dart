import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants.dart';
import '../../home/home_screen.dart';


class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin{

  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();

  }

  @override
  dispose() {
    animationController!.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color:MainColor,
        child: Center(
          child: FadeTransition(
            opacity: fadingAnimation!,
            child: Image.asset(logo,width: 300,),
          ),
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 4), () {
      Get.off(() => HomeScreen(), transition: Transition.fade);
    });
  }
}
