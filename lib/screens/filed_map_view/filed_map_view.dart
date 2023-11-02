import 'package:flutter/material.dart';
import 'package:nurture_field/utils/app_colors.dart';

class FiledMapView extends StatefulWidget {
  const FiledMapView({Key? key}) : super(key: key);

  @override
  State<FiledMapView> createState() => _FiledMapViewState();
}

class _FiledMapViewState extends State<FiledMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              color: MyColors.verifiedBg,
              shape: BoxShape.circle
            ),
            child: Icon(Icons.verified, color: MyColors.primaryColor,),
          )
        ],
      ),
    );
  }
}
