import 'package:flutter/material.dart';
import 'package:nurture_field/utils/app_colors.dart';

import '../../utils/custom_text_style.dart';
import 'draw_field/draw_field_on_map.dart';

class FiledMapView extends StatefulWidget {
  const FiledMapView({Key? key}) : super(key: key);

  @override
  State<FiledMapView> createState() => _FiledMapViewState();
}

class _FiledMapViewState extends State<FiledMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Container(
                  height: 66,
                  width: 66,
                  decoration: const BoxDecoration(
                    color: MyColors.verifiedBg,
                    shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.verified_outlined, color: MyColors.primaryColor, size: 30,),
                ),

                const SizedBox(height: 5,),
                Text("Congratulations!",
                  style: MyTextStyle.primaryBold(fontSize: 20),
                ),
                const SizedBox(height: 5,),
                Text("Now it’s time to set your field",
                  style: MyTextStyle.secondaryLight(),
                ),
                const SizedBox(height: 25,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Select the field adding option",
                    style: MyTextStyle.primaryBold(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10,),

                customOption(
                  bgColor: MyColors.greenBg,
                    borderColor: MyColors.primaryColor,
                    icon: Icons.draw_outlined,
                    title: "Draw field on map",
                    subTitle: "Draw your field on the map, creating a polygon using the drawing tool.",
                    onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const DrawFieldOnMap()));

                    }
                ),
                const SizedBox(height: 15,),
                customOption(
                    icon: Icons.location_on_outlined,
                    title: "Set Coordinates manually",
                    subTitle: "fill your land coordinates on input",
                    onTap: (){

                    }
                ),

                const SizedBox(height: 15,),
                Stack(
                  children: [
                    customOption(
                        icon: Icons.upload_outlined,
                        title: "Draw field on map",
                        subTitle: "Support formates are: .kml, .kmz .shp, or Zip",
                        onTap: (){}
                    ),
                    Positioned(
                      left: 10,
                        top: 10,
                        child: comingSoon())
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  // custom widgets

  Widget customOption({
    Color bgColor= MyColors.white,
    Color borderColor = MyColors.borderColor,
    required IconData icon,
    required String title,
    required String subTitle,
    required Function() onTap
  }){
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
          color: bgColor
        ),
        child: Column(
          children: [
            Icon(icon, size: 33,),
            const SizedBox(height: 5,),
            Text(title,
              style: MyTextStyle.primaryBold(fontSize: 20),
            ),
            const SizedBox(height: 5,),
            Text(subTitle,
              style: MyTextStyle.secondaryLight(fontSize: 15),textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // coming soon
  Widget comingSoon(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.customOrange,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text("Coming Soon", style: MyTextStyle.secondaryLight(fontColor: MyColors.white, fontSize: 12),),
    );
  }
}
