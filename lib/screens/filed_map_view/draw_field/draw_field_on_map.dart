import 'package:flutter/material.dart';
import 'package:nurture_field/components/custom_appbar/custom_appbar_inner.dart';
import 'package:nurture_field/components/custom_text_input_field/search_input_field.dart';
import 'package:nurture_field/utils/app_colors.dart';

import '../../../utils/custom_text_style.dart';

class DrawFieldOnMap extends StatefulWidget {
  const DrawFieldOnMap({Key? key}) : super(key: key);

  @override
  State<DrawFieldOnMap> createState() => _DrawFieldOnMapState();
}

class _DrawFieldOnMapState extends State<DrawFieldOnMap> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarInner(),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SearchInputField(
                    controller: searchController,
                    textInputType: TextInputType.text,
                    prefix: Icon(Icons.search),
                    hintText: "Search location",
                    onChangedCallBack: (value){
                      print(value);
                    },
                ),
              ),



              /// REPLACE THIS IMAGE WITH GOOGLE MAP
              Expanded(child: Image.network("https://t3.ftcdn.net/jpg/03/62/18/34/360_F_362183460_4n0UlAKQ39ATMMkUxBEXmpLo1wQujTqd.jpg", fit: BoxFit.fitHeight,)),

            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
              child: addFieldCard())
        ],
      ),
    );
  }


  // widgets
  Widget addFieldCard(){
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MyColors.white
        ),
        child: Row(
          children: [
            const Icon(Icons.add_location_alt_outlined, size: 35,),
            const SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add your fields",
                    style: MyTextStyle.primaryBold(fontSize: 20),
                  ),
                  const SizedBox(height: 5,),
                  Text("Browse satellite images, vegetation indices, weather data and much more",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: MyTextStyle.secondaryLight(fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
