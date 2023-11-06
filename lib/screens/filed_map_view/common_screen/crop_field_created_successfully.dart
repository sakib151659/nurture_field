import 'package:flutter/material.dart';

import '../../../components/custom_buttons/custom_button_rounded.dart';
import '../../../components/custom_buttons/custom_button_unfilled.dart';
import '../../../landing_page.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/custom_text_style.dart';

class CropFieldCreatedSuccessfully extends StatefulWidget {
  const CropFieldCreatedSuccessfully({Key? key}) : super(key: key);

  @override
  State<CropFieldCreatedSuccessfully> createState() => _CropFieldCreatedSuccessfullyState();
}

class _CropFieldCreatedSuccessfullyState extends State<CropFieldCreatedSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/crop_field.png", height: 140,),
                const SizedBox(height: 25,),
                Text("Crop field created successfully!",
                  textAlign: TextAlign.center,
                  style: MyTextStyle.primaryBold(fontSize: 24),
                ),
                const SizedBox(height: 15,),
                Text("Your crop field has been created. You can now monitor it using this app.",
                  textAlign: TextAlign.center,
                  style: MyTextStyle.secondaryLight(),
                ),
                const SizedBox(height: 15,),

              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const Spacer(),
                  CustomButtonRounded(
                      title: "Add new field",
                      bgColor: MyColors.primaryColor,
                      onPress: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const FieldCreate()));
                      }
                  ),
                  const SizedBox(height: 20,),
                  CustomButtonUnfilled(
                      title: "Go to home",
                      width: double.infinity,
                      color: MyColors.secondaryTextColor,
                      onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const LandingPage()));
                      }
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
