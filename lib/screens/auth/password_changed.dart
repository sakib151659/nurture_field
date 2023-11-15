import 'package:flutter/material.dart';
import 'package:nurture_field/screens/auth/login_screen.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.check_circle, size: 90,color: MyColors.primaryColor,),
              Image.asset("assets/icons/tick_icon.png", height: 72,),
              const SizedBox(height: 25,),
              Text("Password changed!",
                style: MyTextStyle.primaryBold(),
              ),
              const SizedBox(height: 8,),
              Text("Your password has been changed successfully.",
                style: MyTextStyle.secondaryLight(),
              ),
              const SizedBox(height: 25,),
              CustomButtonRounded(
                  title: "Log in",
                  bgColor: MyColors.primaryColor,
                  onPress: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=> const LoginScreen()));
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
