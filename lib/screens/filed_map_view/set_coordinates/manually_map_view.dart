import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_appbar/custom_appbar_inner.dart';
import 'package:nurture_field/components/custom_buttons/custom_button_unfilled.dart';
import 'package:nurture_field/components/custom_text_input_field/search_input_field.dart';
import 'package:nurture_field/utils/app_colors.dart';
import 'package:nurture_field/utils/asset_strings.dart';
import '../../../components/custom_buttons/custom_button_rounded.dart';
import '../../../utils/custom_text_style.dart';

class ManuallyMapView extends StatefulWidget {
  const ManuallyMapView({Key? key}) : super(key: key);

  @override
  State<ManuallyMapView> createState() => _ManuallyMapViewState();
}

class _ManuallyMapViewState extends State<ManuallyMapView> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarInner(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SearchInputField(
              controller: searchController,
              textInputType: TextInputType.text,
              prefix: const Icon(Icons.search),
              hintText: "Search location",
              onChangedCallBack: (value){
                print(value);
              },
            ),
          ),

          const SizedBox(height: 15,),


          /// REPLACE THIS IMAGE WITH GOOGLE MAP
          Stack(
            children: [
              Image.network("https://t3.ftcdn.net/jpg/03/62/18/34/360_F_362183460_4n0UlAKQ39ATMMkUxBEXmpLo1wQujTqd.jpg", fit: BoxFit.fitHeight,),
              Align(
                  alignment: Alignment.topCenter,
                  child: fieldEditDeleteCard()),

              // Align(
              //   alignment: Alignment.bottomCenter,
              //     child: bottomSheet())
            ],
          ),



        ],
      ),
    );
  }


  // widgets
  Widget fieldEditDeleteCard(){
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MyColors.white
      ),
      child: Row(
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
    );
  }


  Widget bottomSheet(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CustomButtonRounded(
              title: "Save field",
              bgColor: MyColors.primaryColor,
              onPress: (){
              }
          ),
          const SizedBox(height: 20,),
          CustomButtonUnfilled(
              title: "Cancel drawing",
              width: double.infinity,
              color: MyColors.secondaryTextColor,
              onTap: (){}
          )
        ],
      ),
    );
  }
}
