import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_buttons/custom_text_button.dart';
import 'package:nurture_field/screens/auth/password_changed.dart';
import 'package:nurture_field/utils/asset_strings.dart';
import '../../components/custom_appbar/custom_appbar_inner.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../components/custom_text_input_field/custom_text_input_field.dart';
import '../../components/custom_text_input_field/sign_in_text_input_field.dart';
import '../../components/custom_widgets/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/custom_text_style.dart';

class VerifyCode extends StatefulWidget {
  final String email;
  const VerifyCode({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  TextEditingController verificationCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isSecurePass = true;
  bool isSecureConfirmPass = true;
  bool isSpecialChar = false;
  bool is8Char = false;
  bool isFormFilled = false;
  bool isInvalidCredentials = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const CustomAppbarInner(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //heading
                  const SizedBox(height: 25,),
                  Text("Verify code",
                    style: MyTextStyle.primaryBold(fontSize: 24),
                  ),
                  const SizedBox(height: 5,),
                  Text("Please check your inbox for verification code sent to ${widget.email}",
                    style: MyTextStyle.secondaryLight(),
                  ),
                  const SizedBox(height: 15,),

                  //form
                  CustomWidgets().titledColumn(
                      title: "Enter verification code",
                      widget: CustomTextInputField(
                        controller: verificationCodeController,
                        textInputType: TextInputType.number,
                        hintText: "0 0 0 0",
                        onChanged: (value){
                          isFormValidate();
                        },
                        validatorFunction: (value) {
                          if (verificationCodeController.text.isEmpty) {
                            //return AppStrings.requiredField;
                          }else if (verificationCodeController.text.length!=4) {
                            //return AppStrings.should4digit;
                          }
                          return null;
                        },
                      )
                  ),

                  CustomTextButton(
                      title: "Resend code",
                      onTap: (){

                      }
                  ),

                  const SizedBox(height: 20,),
                  CustomWidgets().titledColumn(
                      title: "Password",
                      widget: MyTextFieldSignIn(
                        isSecure: isSecurePass,
                        controller: passwordController,
                        textInputType: TextInputType.text,
                        hintText: "Password",
                        suffix: _passwordVisibility(),
                        onChanged: (value){
                          passwordValidate(value: value);
                          isFormValidate();
                        },
                        validatorFunction: (value) {
                          if (!isSpecialChar) {
                            //return AppStrings.passwordInstruction;
                          }
                          return null;
                        },

                      )
                  ),

                  CustomWidgets().titledColumn(
                      title: "Confirm Password",
                      widget: MyTextFieldSignIn(
                        isSecure: isSecureConfirmPass,
                        controller: confirmPasswordController,
                        textInputType: TextInputType.text,
                        hintText: "Confirm Password",
                        suffix: _confirmPasswordVisibility(),
                        onChanged: (value){
                          isFormValidate();
                        },
                        validatorFunction: (value) {
                          if (passwordController.text!=confirmPasswordController.text) {
                            //return AppStrings.passwordNotMatching;
                          }
                          return null;
                        },

                      )
                  ),

                  const SizedBox(height: 30,),
                  CustomButtonRounded(
                      title: "Confirm",
                      bgColor: isFormFilled?MyColors.primaryColor:MyColors.greyColorNew,
                      onPress: (){
                        if(isFormFilled){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> const PasswordChanged()));
                        }

                      }
                  ),

                  const SizedBox(height: 30,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




  /// widgets and functions
  Widget _passwordVisibility() {
    return InkWell(
      onTap: () {
        setState(() {
          isSecurePass = !isSecurePass;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ImageIcon(AssetImage(isSecurePass ? AssetStrings.eyeOpenIcon:AssetStrings.eyeCloseIcon,),size: 10,),
      ),
    );
  }

  Widget _confirmPasswordVisibility() {
    return InkWell(
      onTap: () {
        setState(() {
          isSecureConfirmPass = !isSecureConfirmPass;
        });
      },
      //child: Icon(isSecureConfirmPass ? Icons.visibility_off : Icons.visibility, size: 18),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ImageIcon(AssetImage(isSecureConfirmPass ? AssetStrings.eyeOpenIcon:AssetStrings.eyeCloseIcon,),size: 10,),
      ),
    );
  }


  void passwordValidate({required String value}){
    if(value.length>=8){
      setState(() {
        is8Char = true;
      });
      setState(() {
        isSpecialChar = _validatePassword(value);
      });
    }else{
      setState(() {
        is8Char = false;
      });
    }
    if(isSpecialChar){
      setState(() {
        isSpecialChar = true;
      });
    }
  }

  void isFormValidate(){
    if(verificationCodeController.text.length== 4 && passwordController.text.isNotEmpty &&  passwordController.text == confirmPasswordController.text){
      setState(() {
        isFormFilled = true;
      });
    }else{
      setState(() {
        isFormFilled = false;
      });
    }
  }
  bool _validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,}$');
    return regex.hasMatch(value);
  }


}
