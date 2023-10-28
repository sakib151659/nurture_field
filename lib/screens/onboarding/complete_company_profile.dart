import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_dropdown/string_dropdown.dart';
import 'package:nurture_field/components/custom_text_input_field/custom_text_input_field.dart';
import 'package:nurture_field/components/custom_widgets/common_widgets.dart';
import 'package:nurture_field/utils/app_colors.dart';
import 'package:nurture_field/utils/static_lists.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../utils/app_constants.dart';
import '../../utils/custom_text_style.dart';
import '../../utils/local_storage_manager.dart';

class CompleteCompanyProfile extends StatefulWidget {
  const CompleteCompanyProfile({Key? key}) : super(key: key);

  @override
  State<CompleteCompanyProfile> createState() => _CompleteCompanyProfileState();
}

class _CompleteCompanyProfileState extends State<CompleteCompanyProfile> {
  // controllers
  TextEditingController companyNameController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController townController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //heading
                      const SizedBox(height: 15,),
                      Text("Complete Company Profile",
                        textAlign: TextAlign.center,
                        style: MyTextStyle.primaryBold(fontSize: 24),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        "Input some details about your company here.",
                        textAlign: TextAlign.center,
                        style: MyTextStyle.secondaryLight(),
                      ),
                      const SizedBox(height: 10,),

                      //form
                      CustomWidgets().titledColumn(
                          title: "Company Name",
                          widget: CustomTextInputField(
                              controller: companyNameController,
                              textInputType: TextInputType.text,
                              hintText: "Company Name"
                          )
                      ),

                      CustomWidgets().titledColumn(
                          title: "Employee",
                          widget: StringDropdown(
                              hintText: "Select Employee",
                              itemList: StaticList().dummyList,
                              callBackFunction: (value){
                                print(value);
                              }
                          )
                      ),

                      CustomWidgets().titledColumn(
                          title: "Country name",
                          widget: StringDropdown(
                              hintText: "Select Country name",
                              itemList: StaticList().dummyList,
                              callBackFunction: (value){
                                print(value);
                              }
                          )
                      ),

                      CustomWidgets().titledColumn(
                          title: "Province",
                          widget: CustomTextInputField(
                              controller: provinceController,
                              textInputType: TextInputType.text,
                              hintText: "Province"
                          )
                      ),

                      CustomWidgets().titledColumn(
                          title: "Town",
                          widget: CustomTextInputField(
                              controller: townController,
                              textInputType: TextInputType.text,
                              hintText: "Town"
                          )
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              CustomButtonRounded(
                  title: "Completed & Save",
                  bgColor: true? MyColors.primaryColor: MyColors.customGrayDark,  // change the color if everything filled
                  onPress: (){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const CompleteCompanyProfile()));
                    LocalStorageManager.saveData(AppConstant.isCompanyProfileCompleted, true);
                  }
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
