import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';


class CustomButtonUnfilled extends StatefulWidget {
  final String title;
  final double width;
  final Color color;
  final Function() onTap;
  const CustomButtonUnfilled({Key? key, required this.title, this.color = MyColors.white,this.width = 70,required this.onTap}) : super(key: key);

  @override
  State<CustomButtonUnfilled> createState() => _CustomButtonUnfilledState();
}

class _CustomButtonUnfilledState extends State<CustomButtonUnfilled> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15),
        height: 55,
        width: widget.width,
        decoration: BoxDecoration(
            //color: MyColors.backgroundColor,
            borderRadius: BorderRadius.circular(30),
          border: Border.all(color: widget.color, width: 1.5)
        ),
        child: Center(child: Text(widget.title, style: MyTextStyle.primaryLight(fontSize: 14, fontColor:widget.color,fontWeight: FontWeight.w600 )),
      ),),
    );
  }
}
