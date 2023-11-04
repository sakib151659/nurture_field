import 'package:flutter/material.dart';
import 'package:nurture_field/utils/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/asset_strings.dart';
import '../../utils/custom_text_style.dart';
import '../../utils/local_storage_manager.dart';
import 'complete_company_profile.dart';
import 'onboarding_template.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;
  int pageIndex = 0;

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
            //if(isLastPage==false)...[
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if(pageIndex!=0)...[
                    IconButton(
                        onPressed: (){
                          controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        icon: Icon(Icons.arrow_back_ios)
                    ),
                  ],

                  const Spacer(),
                  TextButton(
                      onPressed: (){
                        controller.jumpToPage(2);
                      },
                      child: Text("Skip", style: MyTextStyle.primaryBold(fontSize: 16),)
                  ),
                ],
              ),
            //],
            Expanded(
              flex: 8,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                    pageIndex = index;
                  });
                },
                children: const [
                  CustomScreenTemplate(
                      title: "The key to unlocking your yield potential.",
                      subTitle: AppStrings.onBoardingSubtitle1,
                      imagePath: AssetStrings.onBoarding1
                  ),

                  CustomScreenTemplate(
                      title: "Detailed analytics",
                      subTitle: AppStrings.onBoardingSubtitle2,
                      imagePath: AssetStrings.onBoarding2
                  ),

                  CustomScreenTemplate(
                      title: "The next step in smart farming",
                      subTitle: AppStrings.onBoardingSubtitle3,
                      imagePath: AssetStrings.onBoarding3
                  ),

                ],
              ),
            ),

            //const SizedBox(height: 60,),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                    spacing: 10,
                    radius: 10,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: MyColors.unselectedDot,
                    activeDotColor: MyColors.primaryColor),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),

            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.15,),
                  if(isLastPage==false)...[
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButtonRounded(
                            title: "Next",
                            onPress: (){
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }
                        )
                    ),
                  ],

                  if(isLastPage==true)...[
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButtonRounded(
                            title: "Get Started",
                            onPress: (){
                              LocalStorageManager.saveData(AppConstant.isOnBoardingCompleted, true);
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const CompleteCompanyProfile()));
                            }
                        )
                    ),

                  ],
                ],
              ),
            ),

            const SizedBox(height: 30,)

          ],
        ),
      ),
    );
  }


}

