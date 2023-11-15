import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_buttons/custom_text_button.dart';
import 'package:nurture_field/screens/onboarding/onboarding.dart';
import 'package:nurture_field/utils/app_colors.dart';
import '../../components/custom_appbar/custom_appbar_inner.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../components/custom_text_input_field/custom_text_input_field.dart';
import '../../components/custom_widgets/common_widgets.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_strings.dart';
import '../../utils/custom_text_style.dart';
import '../../utils/local_storage_manager.dart';

class ConfirmEmail extends StatefulWidget {
  final String email;
  const ConfirmEmail({Key? key, required this.email}) : super(key: key);

  @override
  State<ConfirmEmail> createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbarInner(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/icons/mail_icon.png", height: 130,),
              const SizedBox(height: 15,),
              Text("Check your email",
                style: MyTextStyle.primaryBold(fontSize: 20),
              ),
              const SizedBox(height: 15,),
              RichText(
                text: TextSpan(
                  text: 'To activate your account, please enter the 6 digit code we sent to ',
                  style: MyTextStyle.secondaryLight(fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.email,
                      style: MyTextStyle.primaryMedium(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),


              const SizedBox(height: 20,),
              CustomWidgets().titledColumn(
                  title: "Code",
                  widget: CustomTextInputField(
                    controller: codeController,
                    textInputType: TextInputType.text,
                    hintText: "6 digit code",
                    validatorFunction: (value) {
                      if (value == null || value.length<6) {
                        //return AppStrings.requiredField;
                      }
                      return null;
                    },
                  )
              ),


              Align(
                alignment: Alignment.centerLeft,
                  child: CustomTextButton(title: "Resend email", onTap: (){})),


              const Spacer(),
              const SizedBox(height: 20,),
              CustomButtonRounded(
                  title: "Confirm email",
                  onPress: (){
                    if(_formKey.currentState!.validate()){
                      LocalStorageManager.saveData(AppConstant.isEmailConfirmed, true);
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> const OnBoardingScreen()));

                    }

                  }
              ),

              const SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}
