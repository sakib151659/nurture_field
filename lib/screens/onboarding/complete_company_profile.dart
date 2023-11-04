import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_dropdown/string_dropdown.dart';
import 'package:nurture_field/components/custom_text_input_field/custom_text_input_field.dart';
import 'package:nurture_field/components/custom_widgets/common_widgets.dart';
import 'package:nurture_field/utils/app_colors.dart';
import 'package:nurture_field/utils/static_lists.dart';
import '../../components/custom_buttons/custom_button_rounded.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_strings.dart';
import '../../utils/custom_text_style.dart';
import '../../utils/local_storage_manager.dart';
import '../filed_map_view/filed_map_view.dart';

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
  final _formKey = GlobalKey<FormState>();
  String selectedEmployee = "";
  String selectedCountry = "";
  bool isFormFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
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
                                hintText: "Company Name",
                              onChanged: (value){
                                isFormFullyFilled();
                              },
                              validatorFunction: (value) {
                                if (value==null || value.isEmpty) {
                                  return AppStrings.requiredField;
                                }
                                return null;
                              },
                            )
                        ),

                        CustomWidgets().titledColumn(
                            title: "Employee",
                            widget: StringDropdown(
                                hintText: "Select Employee",
                                itemList: StaticList().dummyList,
                                callBackFunction: (value){
                                  selectedEmployee = value;
                                  isFormFullyFilled();
                                }
                            )
                        ),

                        CustomWidgets().titledColumn(
                            title: "Country name",
                            widget: StringDropdown(
                                hintText: "Select Country name",
                                itemList: StaticList().dummyList,
                                callBackFunction: (value){
                                  selectedCountry = value;
                                  isFormFullyFilled();
                                }
                            )
                        ),

                        CustomWidgets().titledColumn(
                            title: "Province",
                            widget: CustomTextInputField(
                                controller: provinceController,
                                textInputType: TextInputType.text,
                                hintText: "Province",
                              onChanged: (value){
                                isFormFullyFilled();
                              },
                              validatorFunction: (value) {
                                if (value==null || value.isEmpty) {
                                  return AppStrings.requiredField;
                                }
                                return null;
                              },
                            )
                        ),

                        CustomWidgets().titledColumn(
                            title: "Town",
                            widget: CustomTextInputField(
                                controller: townController,
                                textInputType: TextInputType.text,
                                hintText: "Town",
                              onChanged: (value){
                                isFormFullyFilled();
                              },
                              validatorFunction: (value) {
                                if (value==null || value.isEmpty) {
                                  return AppStrings.requiredField;
                                }
                                return null;
                              },
                            )
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                CustomButtonRounded(
                    title: "Completed & Save",
                    bgColor: isFormFilled? MyColors.primaryColor: MyColors.customGrayDark,
                    onPress: (){
                      if(_formKey.currentState!.validate()){
                        LocalStorageManager.saveData(AppConstant.isCompanyProfileCompleted, true);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const FiledMapView()));
                      }
                    }
                ),
                const SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void isFormFullyFilled(){
    if(companyNameController.text.isNotEmpty && provinceController.text.isNotEmpty && townController.text.isNotEmpty && selectedEmployee.isNotEmpty && selectedCountry.isNotEmpty){
      setState(() {
        isFormFilled = true;
      });
    }
  }
}
