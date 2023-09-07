import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:veechat/Auth/manageuser.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const Authpage() ,)));
  }
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    return Scaffold(body: SizedBox(
      height: _height,
      width: _width,
      child: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              height: _height*0.4,
              child: LottieBuilder.asset("assets/lotties/splash3.json"),
             ),
            //  Spacer(),
             SizedBox(height: _height*0.07,),
            SizedBox(
              height: _height*0.2,
              child: LottieBuilder.asset("assets/lotties/line.json"),
             ),
          ],
        ),
      ),

    ));
  }
}
