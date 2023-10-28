import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';

class CustomButtonRounded extends StatelessWidget {
  final String title;
  final Function() onPress;
  final double ?height;
  final double ? width;
  final Color ? bgColor;
  const CustomButtonRounded({Key? key, required this.title, this.bgColor= MyColors.primaryColor,required this.onPress, this.height=55, this.width=double.infinity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bgColor!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: Text(title,style: MyTextStyle.secondaryLight(fontColor: MyColors.white, fontWeight:FontWeight.w600 ),),
      ),
    );
  }
}