import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_buttons/custom_text_button.dart';
import 'package:nurture_field/landing_page.dart';
import '../../components/custom_appbar/custom_appbar_inner.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../components/custom_text_input_field/custom_text_input_field.dart';
import '../../components/custom_text_input_field/sign_in_text_input_field.dart';
import '../../components/custom_widgets/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/custom_text_style.dart';
import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isSecurePass = true;
  bool isValidEmail = false;
  //bool isSpecialChar = false;
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
                  Text("Log in",
                    style: MyTextStyle.primaryBold(fontSize: 24),
                  ),
                  const SizedBox(height: 5,),
                  Text("Welcome back to nurture field!",
                    style: MyTextStyle.secondaryLight(),
                  ),
                  const SizedBox(height: 15,),

                  //form
                  CustomWidgets().titledColumn(
                      title: "Email",
                      widget: CustomTextInputField(
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        hintText: "Email",
                        onChanged: (value){
                          isFormFullyFilled();
                          isValidEmail = isEmailValid(value);
                        },
                        validatorFunction: (value) {
                          if (isValidEmail==false) {
                            return AppStrings.requiredField;
                          }
                          return null;
                        },
                      )
                  ),

                  CustomWidgets().titledColumn(
                      title: "Password",
                      widget: MyTextFieldSignIn(
                        isSecure: isSecurePass,
                        controller: passwordController,
                        textInputType: TextInputType.text,
                        hintText: "Password",
                        suffix: _passwordVisibility(),
                        onChanged: (value){
                          isFormFullyFilled();
                        },
                        validatorFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.requiredField;
                          }
                          return null;
                        },

                      )
                  ),

                  // if credentials is invalid then set the isInvalidCredentials = true
                  if(isInvalidCredentials)...[
                    Text("ⓘ Wrong password. Try again or click forgot password to reset it.",
                      style: MyTextStyle.secondaryLight(fontColor: MyColors.customRed),
                    ),
                    const SizedBox(height: 10,),
                  ],

                  CustomTextButton(
                      title: "Forgot password?",
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const ForgetPassword()));
                      }
                  ),

                  const SizedBox(height: 35,),
                  CustomButtonRounded(
                      title: "Log in",
                      bgColor: isFormFilled?MyColors.primaryColor:MyColors.greyColorNew,
                      onPress: (){
                        if(_formKey.currentState!.validate() && isValidEmail && passwordController.text.isNotEmpty){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> LandingPage()));

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
      child: Icon(isSecurePass ? Icons.visibility_off : Icons.visibility, size: 18),
    );
  }

  void isFormFullyFilled(){
    if(isValidEmail==true && passwordController.text.isNotEmpty){
      setState(() {
        isFormFilled = true;
      });
    }else{
      setState(() {
        isFormFilled = false;
      });
    }
  }

  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );
    return emailRegex.hasMatch(email);
  }

}
