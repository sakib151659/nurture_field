import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';



class CustomScreenTemplate extends StatelessWidget {
  final String title;
  final String imagePath;

  const CustomScreenTemplate({
    Key? key,
    required this.title,
    required this.imagePath
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                // .animate()
                // .fadeIn() // uses `Animate.defaultDuration`
                // .scale() // inherits duration from fadeIn
                // .move(delay: 300.ms, duration: 600.ms),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(height: 80,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [MyColors.backgroundColor,MyColors.transparentBackGround],
                    ),
                  ),
                ),
              )
            ],
          ),
        ), // runs after the above w/new duration,
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: MyTextStyle.primaryBold(fontSize: 24),
          ),
        ),

      ],
    );
  }
}