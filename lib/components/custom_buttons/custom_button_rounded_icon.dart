import 'package:flutter/material.dart';

import '../../utils/custom_text_style.dart';


class CustomButtonRoundedIcon extends StatefulWidget {
  final String title;
  final Function() onPress;
  final double ? height;
  final double ? width;
  final String iconImage;
  final Color gradientStart;
  final Color gradientMiddle;
  final Color gradientEnd;
  const CustomButtonRoundedIcon({Key? key, required this.title, required this.iconImage,this.height=55, this.width=double.infinity, required this.gradientStart, required this.gradientMiddle,required this.gradientEnd, required this.onPress}) : super(key: key);

  @override
  State<CustomButtonRoundedIcon> createState() => _CustomButtonRoundedIconState();
}

class _CustomButtonRoundedIconState extends State<CustomButtonRoundedIcon> { 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: widget.height,
          width: widget.width,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [widget.gradientStart,widget.gradientMiddle,widget.gradientEnd],
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Image.asset(widget.iconImage,height: 22,),
              ),
              Text(widget.title, style: MyTextStyle.secondaryLight(),),
            ],
          ),
        )
    );
  }
}
