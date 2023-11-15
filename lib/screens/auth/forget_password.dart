import 'package:flutter/material.dart';
import 'package:nurture_field/screens/auth/verify_code.dart';
import '../../components/custom_appbar/custom_appbar_inner.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../components/custom_text_input_field/custom_text_input_field.dart';
import '../../components/custom_widgets/common_widgets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/custom_text_style.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isSecurePass = true;
  bool isValidEmail = false;
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
                  const SizedBox(height: 28,),
                  Text("Forgot your password?",
                    style: MyTextStyle.primaryBold(fontSize: 24),
                  ),
                  const SizedBox(height: 5,),
                  Text("Enter your email below to receive your password reset instructions.",
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
                          setState(() {
                            isValidEmail = isEmailValid(value);
                          });

                        },
                        validatorFunction: (value) {
                          if (isValidEmail==false) {
                            //return AppStrings.requiredField;
                          }
                          return null;
                        },
                      )
                  ),



                  const SizedBox(height: 30,),
                  CustomButtonRounded(
                      title: "Send verification code",
                      bgColor: isValidEmail?MyColors.primaryColor:MyColors.greyColorNew,
                      onPress: (){
                        if(_formKey.currentState!.validate() && isValidEmail){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> VerifyCode(email: emailController.text,)));

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

  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );
    return emailRegex.hasMatch(email);
  }

}
