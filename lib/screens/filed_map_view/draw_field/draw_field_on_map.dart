import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nurture_field/components/custom_appbar/custom_appbar_inner.dart';
import 'package:nurture_field/components/custom_text_input_field/search_input_field.dart';
import 'package:nurture_field/screens/filed_map_view/draw_field/drawn_completed_map.dart';
import 'package:nurture_field/utils/app_colors.dart';
import '../../../components/custom_buttons/custom_button_rounded.dart';
import '../../../components/custom_buttons/custom_button_unfilled.dart';
import '../../../utils/asset_strings.dart';
import '../../../utils/custom_text_style.dart';
import '../common_screen/field_create.dart';

class DrawFieldOnMap extends StatefulWidget {
  const DrawFieldOnMap({Key? key}) : super(key: key);

  @override
  State<DrawFieldOnMap> createState() => _DrawFieldOnMapState();
}

class _DrawFieldOnMapState extends State<DrawFieldOnMap> {
  TextEditingController searchController = TextEditingController();

  bool isAddYourFieldCardVisible = true;
  bool drawLineStart = false;
  double lat = 0;
  double long = 0;
  List<LatLng> fieldCoordinates = [];
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;


  customIcon(){
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AssetStrings.plusIcon,).then((value){
      setState(() {markerIcon = value;});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    customIcon();
    super.initState();
  }

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
                    initialCameraPosition: CameraPosition(target: LatLng(23.832937, 89.886904),
                      zoom: 15
                    ),
                  onMapCreated: (GoogleMapController controller) {
                  },
                  polylines: {
                    Polyline(
                      polylineId: PolylineId("polyline"),
                      color: Colors.white,
                      points: fieldCoordinates,
                      width: 2,
                    ),
                  },
                  markers: {
                      Marker(
                        markerId: MarkerId("test"),
                        position: LatLng(23.832937, 89.886904),
                        draggable: true,

                        onDragEnd: (value){
                          lat = value.latitude;
                          long = value.longitude;
                          if(drawLineStart == true){
                            setState(() {
                              fieldCoordinates.add(LatLng(value.latitude, value.longitude));
                              print(value);
                            });
                          }
                        },
                        onTap: (){
                          print("fieldCoordinates.length ${fieldCoordinates.length}");
                          if(fieldCoordinates.isEmpty){
                            setState(() {
                              drawLineStart = true;
                              isAddYourFieldCardVisible = false;
                              fieldCoordinates.add(LatLng(lat, long)); // for adding the first coordinates in the list
                            });
                          }
                          if(fieldCoordinates.length>3){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>DrawnCompletedMap(fieldLatLong:fieldCoordinates,lat: lat,long: long,)));
                          }
                        },
                        icon:markerIcon
                      ),
                  },

                ),
                //fieldEditDeleteCard(),

                if(isAddYourFieldCardVisible)...[
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: addFieldCard())
                ]

              ],
            ),
          ),

        ],
      ),
    );
  }





  /// custom widgets
  // Widget fieldEditDeleteCard(){
  //   return Container(
  //     height: 80,
  //     padding: const EdgeInsets.all(15),
  //     margin: const EdgeInsets.all(15),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //         color: MyColors.white
  //     ),
  //     child: Row(
  //       children: [
  //         const ImageIcon(AssetImage(AssetStrings.fileIcon)),
  //         const SizedBox(width: 15,),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text("Field",
  //                 style: MyTextStyle.primaryBold(fontSize: 16),
  //               ),
  //               //const SizedBox(height: 2,),
  //               Text("0.75 ha",
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: MyTextStyle.secondaryLight(fontSize: 15),
  //               ),
  //             ],
  //           ),
  //         ),
  //
  //         InkWell(
  //             onTap: (){
  //
  //               /// use this when draw completed
  //               showModalBottomSheet(
  //                 context: context,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                 ),
  //                 builder: (BuildContext context) {
  //                   return bottomSheet();
  //                 },
  //               );
  //
  //             },
  //             child: const ImageIcon(AssetImage(AssetStrings.editIcon), color: MyColors.customGrayDark)
  //         ),
  //         const SizedBox(width: 15,),
  //         InkWell(
  //             onTap: (){
  //
  //             },
  //             child: const ImageIcon(AssetImage(AssetStrings.deleteIcon), color: MyColors.customGrayDark,)
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget addFieldCard(){
    return Container( 
      height: 110,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MyColors.white
      ),
      child: Row(
        children: [
          const ImageIcon(AssetImage("assets/icons/add_plus.png"), size: 30,color: MyColors.primaryColor,),
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
    );
  }


  //bottom sheets
  Widget bottomSheet(){
    return SizedBox(
      height: 200,
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
