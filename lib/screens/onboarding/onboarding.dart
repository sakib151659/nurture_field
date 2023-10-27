import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/asset_strings.dart';
import '../../utils/custom_text_style.dart';
import '../../utils/local_storage_manager.dart';
import 'onboarding_template.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() => isLastPage = index == 2);
                      print(index);
                    },
                    children: const [
                      CustomScreenTemplate(
                          title: "Log & track your daily meals",
                          imagePath: AssetStrings.onBoarding1
                      ),

                      CustomScreenTemplate(
                          title: "Purchase meal plans from certified coaches",
                          imagePath: AssetStrings.onBoarding2
                      ),

                      CustomScreenTemplate(
                          title: "Sign up or sign in",
                          imagePath: AssetStrings.onBoarding3
                      ),

                    ],
                  ),
                  if(isLastPage==false)...[
                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(onPressed: (){
                          controller.jumpToPage(2);
                        },
                            child: Text("Skip", style: MyTextStyle.primaryBold(fontSize: 16),)))
                  ]
                ],
              ),
            ),
            const SizedBox(height: 60,),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                    spacing: 16,
                    dotColor: MyColors.unselectedDot,
                    activeDotColor: MyColors.customOrange),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),

            const SizedBox(height: 40,),
            if(isLastPage==false)...[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButtonRounded(
                      title: "Next",
                      onPress: (){
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                        //print("print ");
                        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const SignInScreen()));
                        //LocalStorageManager.saveData(AppConstant.showHome, true);
                      }
                  )
              ),
            ],

            if(isLastPage==true)...[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButtonRounded(
                      title: "Sign Up",
                      onPress: (){
                        //print("print ");
                        //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const Auth()));
                        LocalStorageManager.saveData(AppConstant.isOnBoarding, false);
                      }
                  )
              ),

              const SizedBox(height: 15,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButtonRounded(
                      title: "Sign In",
                      onPress: (){
                        //print("print ");
                        //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const LoginScreen()));
                        LocalStorageManager.saveData(AppConstant.isOnBoarding, false);
                      }
                  )
              ),
            ],

            isLastPage?const SizedBox(height: 30,): const SizedBox(height: 70,),

          ],
        ),
      ),
    );
  }


}

