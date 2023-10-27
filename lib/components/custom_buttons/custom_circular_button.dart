import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';


class CustomCircularButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  const CustomCircularButton({Key? key, required this.icon, required this.title, required this.onTap}) : super(key: key);

  @override
  State<CustomCircularButton> createState() => _CustomCircularButtonState();
}

class _CustomCircularButtonState extends State<CustomCircularButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                  color: MyColors.customGery,
                shape: BoxShape.circle
              ),
              child: Center(child: Icon(widget.icon, color: MyColors.primaryColor,)),
            ),
            const SizedBox(width: 10,),
            Text(widget.title, style: MyTextStyle.primaryBold(fontSize: 16),)
          ],
        ),
      ),
    );
  }
}
