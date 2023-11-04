import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nurture_field/screens/onboarding/complete_company_profile.dart';
import 'package:nurture_field/utils/app_constants.dart';
import 'package:nurture_field/utils/custom_text_style.dart';
import '../../utils/api_constant.dart';
import '../../utils/app_colors.dart';
import '../../utils/asset_strings.dart';
import '../../utils/local_storage_manager.dart';
import '../auth/auth.dart';
import '../filed_map_view/filed_map_view.dart';
import '../onboarding/onboarding.dart';
class SplashScreen extends StatefulWidget {
  final bool isOnBoardingCompleted;
  const SplashScreen({Key? key, required this.isOnBoardingCompleted}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late String loginToken = "";
  bool isEmailConfirmed = false;
  bool isOnBoardingCompleted = false;
  bool isCompanyProfileCompleted = false;
  bool isFieldCreatedSuccessfully = false;
  void checkLoginToken()async{
    loginToken = await LocalStorageManager.readData(ApiConstant.loginToken)??"";
    isEmailConfirmed = await LocalStorageManager.readData(AppConstant.isEmailConfirmed)??false;
    isOnBoardingCompleted = await LocalStorageManager.readData(AppConstant.isOnBoardingCompleted)??false;
    isCompanyProfileCompleted = await LocalStorageManager.readData(AppConstant.isCompanyProfileCompleted)??false;
    isFieldCreatedSuccessfully = await LocalStorageManager.readData(AppConstant.isFieldCreatedSuccessfully)??false;
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
      if(loginToken.isEmpty){
        if(isEmailConfirmed){
          if(isOnBoardingCompleted){
            if(isCompanyProfileCompleted){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const FiledMapView()));
            }else if(isFieldCreatedSuccessfully){
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const Home()));
            }else{
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const CompleteCompanyProfile()));
            }
          }else{
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const OnBoardingScreen()));
          }
        }else{
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const AuthScreen()));
        }
      }else{
        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const Dashboard()));
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