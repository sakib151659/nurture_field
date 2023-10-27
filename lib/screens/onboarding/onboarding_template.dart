import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';



class CustomScreenTemplate extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;

  const CustomScreenTemplate({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imagePath
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Image.asset(
            imagePath,
            //width: double.infinity,
            height: MediaQuery.of(context).size.height*.35,
            fit: BoxFit.contain,
          ), // runs after the above w/new duration,
          const SizedBox(height: 15,),
          Text(
            title,
            textAlign: TextAlign.center,
            style: MyTextStyle.primaryBold(fontSize: 24),
          ),
          const SizedBox(height: 10,),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: MyTextStyle.secondaryLight(),
          ),

        ],
      ),
    );
  }
}