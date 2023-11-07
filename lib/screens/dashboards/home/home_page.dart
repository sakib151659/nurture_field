import 'package:flutter/material.dart';
import 'package:nurture_field/utils/app_colors.dart';
import 'package:nurture_field/utils/asset_strings.dart';
import 'package:nurture_field/utils/custom_text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          heading(),
          
          Text("new start..")

        ],
      ),
    );
  }


  // custom widgets
  Widget heading() {
    return Stack(
      children: [
        SizedBox(
          height: 430,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 50),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      MyColors.customGreen, // Start color
                      Colors.transparent, // End color (transparent)
                    ],
                    stops: [0.6, 1.0], // Color stops
                    begin: Alignment.topCenter, // Starting point
                    end: Alignment.bottomCenter, // Ending point
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", fit: BoxFit.cover,),
                    ),

                    const SizedBox(width: 10,),
                    Text("Sakib Khan", style: MyTextStyle.secondaryMedium(fontColor:MyColors.white, fontSize: 16, fontWeight: FontWeight.w600 ),),
                    const Spacer(),

                    const ImageIcon(AssetImage(AssetStrings.notificationUnfilledIcon), color: MyColors.white,)

                  ],
                )
              ),
            ],
          ),
        ),

        Positioned(
          top: 75,
          child: weatherCard(),
        )
      ],
    );
  }

  Widget weatherCard(){
    return Container(
      width: MediaQuery.of(context).size.width*.90,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.borderColor)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("26°", style: MyTextStyle.primaryBold(fontSize: 60),),
                Text("°C", style: MyTextStyle.primaryLight(fontSize: 16),),
                Text(" | °F", style: MyTextStyle.secondaryLight(fontSize: 16),),

                const Spacer(),
                Column(
                  children: [
                    ImageIcon(AssetImage(AssetStrings.rainIcon,), size: 50, color: MyColors.customPink,),
                    Text("Cloud rain", style: MyTextStyle.secondaryLight(fontSize: 16),),
                  ],
                )

              ],
            ),
          ),

          const Divider(),

          customWeatherTitle(icon: AssetStrings.thermometerIcon, title: "Pressure", value: "1010mbar"),
          customWeatherTitle(icon: AssetStrings.humidityIcon, title: "Humidity", value: "82%"),
          customWeatherTitle(icon: AssetStrings.windIcon, title: "Wind", value: "0 Kh/h"),
          customWeatherTitle(icon: AssetStrings.cloudRainIcon, title: "Chance of heavy rain", value: "90%"),
          customWeatherTitle(icon: AssetStrings.thermometerColdIcon, title: "Dew point", value: "76°"),

          const SizedBox(height: 5,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: MyColors.customGeryLight,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))
            ),
            child: Text("Leelanau country, Michigan", textAlign: TextAlign.center,style: MyTextStyle.secondaryLight(),),
          )
        ],
      ),
    );
  }


  Widget customWeatherTitle({required String icon, required String title, required String value}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Row(
        children: [
          ImageIcon(AssetImage(icon)),
          Text("  $title: ", style: MyTextStyle.secondaryLight(),),
          Text(value, style: MyTextStyle.primaryMedium(fontSize: 14, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}
