import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nurture_field/components/custom_appbar/custom_appbar_inner.dart';
import 'package:nurture_field/components/custom_text_input_field/search_input_field.dart';
import 'package:nurture_field/utils/app_colors.dart';
import '../../../components/custom_buttons/custom_button_rounded.dart';
import '../../../components/custom_buttons/custom_button_unfilled.dart';
import '../../../utils/asset_strings.dart';
import '../../../utils/custom_text_style.dart';
import '../common_screen/field_create.dart';

class DrawnCompletedMap extends StatefulWidget {
  final List<LatLng> fieldLatLong;
  final double lat;
  final double long;
  const DrawnCompletedMap({Key? key, required this.fieldLatLong, required this.lat, required this.long}) : super(key: key);

  @override
  State<DrawnCompletedMap> createState() => _DrawnCompletedMapState();
}

class _DrawnCompletedMapState extends State<DrawnCompletedMap> {
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
              prefix: Icon(Icons.search),
              hintText: "Search location",
              onChangedCallBack: (value){
                print(value);
              },
            ),
          ),

          const SizedBox(height: 15,),



          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.satellite,
                  initialCameraPosition: CameraPosition(target: LatLng(widget.lat, widget.long),
                      zoom: 19
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    // print("lat long");
                    // print(controller.getLatLng(ScreenCoordinate(x: 10, y: 20)));
                  },
                  polygons: {
                    Polygon(
                        polygonId: PolygonId("filed"),
                        points: widget.fieldLatLong,
                        fillColor: MyColors.selectedArea,
                        strokeWidth: 2,
                        strokeColor: MyColors.white
                    ),
                  },

                ),
                fieldEditDeleteCard(),

                Align(
                  alignment: Alignment.bottomCenter,
                    child: bottomSheet())

              ],
            ),
          ),

        ],
      ),
    );
  }





  /// custom widgets
  Widget fieldEditDeleteCard(){
    return Container(
      height: 80,
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

                /// use this when draw completed
                // showModalBottomSheet(
                //   context: context,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                //   builder: (BuildContext context) {
                //     return bottomSheet();
                //   },
                // );

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


  //bottom sheets
  Widget bottomSheet(){
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomButtonRounded(
                  title: "Save field",
                  bgColor: MyColors.primaryColor,
                  onPress: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>const FieldCreate()));
                  }
              ),
              const SizedBox(height: 20,),
              CustomButtonUnfilled(
                  title: "Cancel drawing",
                  width: double.infinity,
                  color: MyColors.secondaryTextColor,
                  onTap: (){
                    Navigator.of(context).pop();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

}
