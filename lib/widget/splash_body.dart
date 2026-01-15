import 'package:flutter/material.dart';

class SplashBody extends StatefulWidget {
  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    fadingAnimation = Tween<double>(
      begin: .2,
      end: 1,
    ).animate(animationController!);
    animationController?.forward();
    // الانتقال بعد 5 ثواني
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: fadingAnimation!,
            child: Image.asset('assets/logo.png'),
          ),
        ],
      ),
    );
  }
}
