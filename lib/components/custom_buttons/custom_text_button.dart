import 'package:flutter/material.dart';
import 'package:nurture_field/utils/app_colors.dart';
import 'package:nurture_field/utils/custom_text_style.dart';

class CustomTextButton extends StatefulWidget {
  final String title;
  final Color fontColor;
  final Function() onTap;
  const CustomTextButton({Key? key, required this.title, this.fontColor = MyColors.customGreenNew, required this.onTap}) : super(key: key);

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
        child: Text(widget.title, style: MyTextStyle.primaryLight(fontColor:widget.fontColor , fontSize: 14, fontWeight: FontWeight.w600),));
  }
}
