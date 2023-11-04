import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_appbar/custom_appbar_inner.dart';
import '../../../components/custom_buttons/custom_button_rounded.dart';
import '../../../components/custom_buttons/custom_button_unfilled.dart';
import '../../../components/custom_text_input_field/custom_text_input_field.dart';
import '../../../components/custom_widgets/common_widgets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/asset_strings.dart';
import '../../../utils/custom_text_style.dart';

class FieldCreate extends StatefulWidget {
  const FieldCreate({Key? key}) : super(key: key);

  @override
  State<FieldCreate> createState() => _FieldCreateState();
}

class _FieldCreateState extends State<FieldCreate> {
  TextEditingController fieldNameController = TextEditingController();
  TextEditingController cropNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarInner(title: "Create a field",),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                  child: Image.network("https://www.canr.msu.edu/contentAsset/image/db789906-6e2a-4210-9eea-b6113b92966e/fileAsset/filter/Resize/resize_w/600")),

              const SizedBox(height: 15,),
              Row(
                children: [
                  const ImageIcon(AssetImage(AssetStrings.fileIcon)),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Field",
                          style: MyTextStyle.primaryBold(fontSize: 16),
                        ),
                        //const SizedBox(height: 2,),
                        Text("0.75 ha",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyle.secondaryLight(fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                      onTap: (){

                      },
                      child: const ImageIcon(AssetImage(AssetStrings.editIcon), color: MyColors.customGrayDark)
                  ),
                  const SizedBox(width: 15,),
                  InkWell(
                      onTap: (){

                      },
                      child: const ImageIcon(AssetImage(AssetStrings.deleteIcon), color: MyColors.customGrayDark,)
                  ),
                ],
              ),





              const SizedBox(height: 30,),
              CustomWidgets().titledColumn(
                  title: "Field name",
                  widget: CustomTextInputField(
                    controller: fieldNameController,
                    textInputType: TextInputType.number,
                    hintText: "Field name",
                    onChanged: (value){
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
                  title: "Crop type",
                  widget: CustomTextInputField(
                    controller: cropNameController,
                    textInputType: TextInputType.number,
                    hintText: "Type here",
                    onChanged: (value){
                    },
                    validatorFunction: (value) {
                      if (value==null || value.isEmpty) {
                        return AppStrings.requiredField;
                      }
                      return null;
                    },
                  )
              ),


              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: CustomButtonUnfilled(
                        title: "Cancel",
                        width: double.infinity,
                        color: MyColors.secondaryTextColor,
                        onTap: (){
                          Navigator.of(context).pop();
                        }
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: CustomButtonRounded(
                        title: "Save",
                        bgColor: MyColors.primaryColor,
                        onPress: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const FieldCreate()));
                        }
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
