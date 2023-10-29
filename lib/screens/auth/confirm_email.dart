import 'package:flutter/material.dart';
import 'package:nurture_field/utils/app_colors.dart';
import '../../components/custom_appbar/custom_appbar_inner.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../components/custom_text_input_field/custom_text_input_field.dart';
import '../../components/custom_widgets/common_widgets.dart';
import '../../utils/app_strings.dart';
import '../../utils/custom_text_style.dart';

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
      appBar: const CustomAppbarInner(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/icons/mail_icon.png", height: 130,),
              const SizedBox(height: 10,),
              Text("Check your email",
                style: MyTextStyle.primaryBold(),
              ),
              const SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  text: 'To activate your account, please enter the 6 digit code we sent to ',
                  style: MyTextStyle.secondaryLight(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.email,
                      style: MyTextStyle.primaryMedium(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
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
                        return AppStrings.requiredField;
                      }
                      return null;
                    },
                  )
              ),

              TextButton(
                  onPressed: (){

                  },
                  child: Text("Resend email", style: MyTextStyle.primaryBold(fontColor: MyColors.primaryColor, fontSize: 15),)
              ),


              const Spacer(),
              const SizedBox(height: 20,),
              CustomButtonRounded(
                  title: "Confirm email",
                  onPress: (){
                    if(_formKey.currentState!.validate()){
                      //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ConfirmEmail(email: emailController.text,)));

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
