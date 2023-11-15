import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_appbar/custom_appbar_inner.dart';
import 'package:nurture_field/components/custom_buttons/custom_button_rounded.dart';
import 'package:nurture_field/utils/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../components/custom_text_input_field/custom_text_input_field.dart';
import '../../components/custom_text_input_field/sign_in_text_input_field.dart';
import '../../components/custom_widgets/common_widgets.dart';
import '../../utils/app_strings.dart';
import '../../utils/custom_text_style.dart';
import 'confirm_email.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isSecurePass = true;
  bool is8Char = false;
  bool isSpecialChar = false;
  bool isFormFilled = false;
  @override
  void initState() {
    // TODO: implement initState
    getLocationPermission();
    super.initState();
  }

  void getLocationPermission()async{
    // Check if the app has permission to access the location.
    PermissionStatus status = await Permission.location.status;
    if (status.isRestricted) {
      // Request permission if it's undetermined.
      status = await Permission.location.request();
    }

    if (status.isDenied) {
      // Permission was denied. Handle this situation as needed.
      status = await Permission.location.request();
    } else if (status.isGranted) {
      // Permission was granted. You can now access the location.
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarInner(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //heading
                const SizedBox(height: 5,),
                Text("Create an account!",
                  style: MyTextStyle.primaryBold(fontSize: 24),
                ),
                const SizedBox(height: 5,),
                Text("You can log in or make an account if you’re new to Nurture-field.",
                  style: MyTextStyle.secondaryLight(),
                ),
                const SizedBox(height: 15,),

                //form
                CustomWidgets().titledColumn(
                    title: "Name",
                    widget: CustomTextInputField(
                      controller: nameController,
                      textInputType: TextInputType.text,
                      hintText: "Name",
                      onChanged: (value){
                        isFormFullyFilled();
                      },
                      validatorFunction: (value) {
                      if (value == null || value.isEmpty) {
                        //return AppStrings.requiredField;
                      }
                      return null;
                    },
                   )
                ),

                CustomWidgets().titledColumn(
                    title: "Last name",
                    widget: CustomTextInputField(
                      controller: lastNameController,
                      textInputType: TextInputType.text,
                      hintText: "Last name",
                      onChanged: (value){
                        isFormFullyFilled();
                      },
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          //return AppStrings.requiredField;
                        }
                        return null;
                      },
                    )
                ),

                CustomWidgets().titledColumn(
                    title: "Company name",
                    widget: CustomTextInputField(
                      controller: companyNameController,
                      textInputType: TextInputType.text,
                      hintText: "Company name",
                      onChanged: (value){
                        isFormFullyFilled();
                      },
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          //return AppStrings.requiredField;
                        }
                        return null;
                      },
                    )
                ),

                CustomWidgets().titledColumn(
                    title: "Email",
                    widget: CustomTextInputField(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      hintText: "Email",
                      onChanged: (value){
                        isFormFullyFilled();
                      },
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          //return AppStrings.requiredField;
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
                        passwordValidate(value: value);
                        isFormFullyFilled();
                      },
                      validatorFunction: (value) {
                        if (!isSpecialChar) {
                          //return AppStrings.requiredField;
                        }
                        return null;
                      },

                    )
                ),

               // const SizedBox(height: 10,),
                customPassInstruction(isValid: is8Char, title: "Avoid using the same password for multiple sites."),
                customPassInstruction(isValid: is8Char, title: "Password must be 8 character long."),
                customPassInstruction(isValid: isSpecialChar, title: "Besides letters,  include at least a number or symbol (!@#%^&*())"),

                const SizedBox(height: 35,),
                CustomButtonRounded(
                    title: "Continue",
                    bgColor: isFormFilled?MyColors.primaryColor:MyColors.greyColorNew,
                    onPress: (){
                      if(isFormFilled){
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ConfirmEmail(email: emailController.text,)));

                      }

                    }
                ),

                const SizedBox(height: 30,),

              ],
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
  
  Widget customPassInstruction({required bool isValid, required String title}){
    return Column(
      children: [
        Row(
          children: [
            isValid?Icon(Icons.check_circle, color: MyColors.primaryColor,):Icon(Icons.adjust, color: MyColors.secondaryTextColor,),
            const SizedBox(width: 5,),
            Expanded(
              child: Text(title,
                style: MyTextStyle.secondaryLight(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,)
      ],
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
  bool _validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,}$');
    return regex.hasMatch(value);
  }

  void isFormFullyFilled(){
    if(nameController.text.isNotEmpty && lastNameController.text.isNotEmpty && companyNameController.text.isNotEmpty && emailController.text.isNotEmpty && isSpecialChar==true){
      setState(() {
        isFormFilled = true;
      });
    }
  }
}
