import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nurture_field/utils/custom_text_style.dart';
import '../../utils/api_constant.dart';
import '../../utils/app_colors.dart';
import '../../utils/asset_strings.dart';
import '../../utils/local_storage_manager.dart';
import '../onboarding/onboarding.dart';
class SplashScreen extends StatefulWidget {
  final bool isOnBoarding;
  const SplashScreen({Key? key, required this.isOnBoarding}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late String loginToken = "";

  void checkLoginToken()async{
    loginToken = await LocalStorageManager.readData(ApiConstant.loginToken)??"";
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    checkLoginToken();
    pageDecider();
  }

  void pageDecider()async{
    Timer(const Duration(seconds: 5),(){
      if(widget.isOnBoarding){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const OnBoardingScreen()));
      }else{
        if(loginToken.isEmpty){
          print("loginToken.isEmpty");
          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const Auth()));
        }else{
          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const Dashboard()));
        }
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetStrings.appLogo,
                height: 90,
              ),
              const SizedBox(height: 18,),
              Text("Nurturefield", style: MyTextStyle.appLogoStyle(),)
            ],
          ),
        )
    );
  }
}