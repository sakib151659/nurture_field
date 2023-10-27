import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CustomCircularAddButton extends StatefulWidget {
  final Function()? onTap;
  final double radius;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  const CustomCircularAddButton({Key? key, this.onTap, this.radius=30, this.icon=Icons.add, this.bgColor =MyColors.customGery, this.iconColor = MyColors.primaryColor }) : super(key: key);

  @override
  State<CustomCircularAddButton> createState() => _CustomCircularAddButtonState();
}

class _CustomCircularAddButtonState extends State<CustomCircularAddButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.radius,
        width: widget.radius,
        decoration: BoxDecoration(
            color: widget.bgColor,
            shape: BoxShape.circle
        ),
        child: Center(child: Icon(widget.icon, color: widget.iconColor,size: 19,)),
      ),
    );
  }
}
