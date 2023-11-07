import 'package:flutter/cupertino.dart';
import 'app_colors.dart';
import 'app_constants.dart';


class MyTextStyle{
  static primaryLight({Color fontColor = MyColors.primaryTextColor, double fontSize = 14,FontWeight fontWeight = FontWeight.w400}){
    return TextStyle(
        fontFamily: AppConstant.epilogue,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight
    );
  }

  static primaryMedium({Color fontColor = MyColors.primaryTextColor, double fontSize = 24,FontWeight fontWeight = FontWeight.w600}){
    return TextStyle(
        fontFamily: AppConstant.epilogue,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight
    );
  }

  static primaryBold({Color fontColor = MyColors.primaryTextColor, double fontSize = 24,FontWeight fontWeight = FontWeight.w700}){
    return TextStyle(
        fontFamily: AppConstant.epilogue,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight
    );
  }


  static secondaryLight({String fontFamily=AppConstant.epilogue,Color fontColor = MyColors.secondaryTextColor, double fontSize = 14,FontWeight fontWeight = FontWeight.w400}){
    return TextStyle(
        fontFamily: fontFamily,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight
    );
  }

  static secondaryMedium({String fontFamily=AppConstant.epilogue,Color fontColor = MyColors.secondaryTextColor, double fontSize = 24,FontWeight fontWeight = FontWeight.w500}){
    return TextStyle(
        fontFamily: fontFamily,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight
    );
  }

  static secondaryBold({Color fontColor = MyColors.secondaryTextColor, double fontSize = 24,FontWeight fontWeight = FontWeight.w700}){
    return TextStyle(
        fontFamily: AppConstant.epilogue,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight
    );
  }

  static appLogoStyle({String fontFamily=AppConstant.epilogue,Color fontColor = MyColors.white, double fontSize = 40,FontWeight fontWeight = FontWeight.w800}){
    return TextStyle(
        fontFamily: fontFamily,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight
    );
  }

}