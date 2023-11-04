import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_appbar/custom_appbar_inner.dart';
import '../../../components/custom_buttons/custom_button_rounded.dart';
import '../../../components/custom_text_input_field/custom_text_input_field.dart';
import '../../../components/custom_widgets/common_widgets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/custom_text_style.dart';

class SetCoordinatesManually extends StatefulWidget {
  const SetCoordinatesManually({Key? key}) : super(key: key);

  @override
  State<SetCoordinatesManually> createState() => _SetCoordinatesManuallyState();
}

class _SetCoordinatesManuallyState extends State<SetCoordinatesManually> {
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  bool isBtnVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarInner(title: "Coordinates",),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //heading
                const SizedBox(height: 25,),
                Text("DD (Decimal degrees)",
                  style: MyTextStyle.primaryBold(fontSize: 20),
                ),
                const SizedBox(height: 10,),
                Text("Gps Coordinates finder is a tool used to find the latitude and longitude of your current location including your address, zip code, state, city and latlong.",
                  style: MyTextStyle.secondaryLight(),
                ),
                const SizedBox(height: 15,),



                CustomWidgets().titledColumn(
                    title: "Latitude",
                    widget: CustomTextInputField(
                      controller: latController,
                      textInputType: TextInputType.number,
                      hintText: "e.x, 25.0629723",
                      onChanged: (value){
                        btnVisibilityCheck();
                      },
                      validatorFunction: (value) {
                        if (value==null || value.isEmpty) {
                          return AppStrings.requiredField;
                        }
                        return null;
                      },
                    )
                ),


                CustomWidgets().titledColumn(
                    title: "Longitude",
                    widget: CustomTextInputField(
                      controller: longController,
                      textInputType: TextInputType.number,
                      hintText: "e.x, 28.0629723",
                      onChanged: (value){
                        btnVisibilityCheck();
                      },
                      validatorFunction: (value) {
                        if (value==null || value.isEmpty) {
                          return AppStrings.requiredField;
                        }
                        return null;
                      },
                    )
                ),


                const SizedBox(height: 50,),
                if(isBtnVisible==true)...[
                  CustomButtonRounded(
                      title: "Continue",
                      bgColor: MyColors.primaryColor,
                      onPress: (){
                        if(_formKey.currentState!.validate()){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> VerifyCode(email: emailController.text,)));
                        }
                      }
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }


  // functions
  void btnVisibilityCheck(){
    if(latController.text.isNotEmpty && longController.text.isNotEmpty){
      setState(() {
        isBtnVisible = true;
      });
    }else{
      setState(() {
        isBtnVisible = false;
      });
    }
  }
}
