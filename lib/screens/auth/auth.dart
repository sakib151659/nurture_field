import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_buttons/custom_button_unfilled.dart';
import 'package:nurture_field/screens/auth/login_screen.dart';
import 'package:nurture_field/utils/app_colors.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../utils/asset_strings.dart';
import '../../utils/custom_text_style.dart';
import 'create_account.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/auth/auth_background.png",), fit: BoxFit.cover)
            ),
          ),
          Container(
            color: MyColors.greenTransparent,
          ),


          // main contents
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.23,),
                  Image.asset(
                    AssetStrings.appLogo,
                    height: 90,
                  ),
                  const SizedBox(height: 18,),
                  Text("Nurturefield", style: MyTextStyle.appLogoStyle(),),

                  const Spacer(),
                  CustomButtonUnfilled(
                      title: "Log in",
                      width: double.infinity,
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const LoginScreen()));
                      }
                  ),
                  const SizedBox(height: 18,),
                  CustomButtonRounded(
                      title: "Create an account",
                      onPress: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const CreateAccount()));
                      }
                  ),

                  const SizedBox(height: 30,),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
