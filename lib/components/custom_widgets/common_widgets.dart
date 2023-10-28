import 'package:flutter/material.dart';
import '../../utils/custom_text_style.dart';

class CustomWidgets{

  Widget titledColumn({required String title, required Widget widget}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          textAlign: TextAlign.center,
          style: MyTextStyle.primaryLight(),
        ),
        const SizedBox(height: 3,),
        widget,
        const SizedBox(height: 17,),
      ],
    );
  }

}