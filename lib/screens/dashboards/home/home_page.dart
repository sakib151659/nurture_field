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
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            // heading and weather card
            heading(),
            const SizedBox(height: 8,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // calender section
                  weeklyCalender(),
                  const SizedBox(height: 27,),

                  // task and view all row
                  taskAndViewAll(),
                  const SizedBox(height: 10,),

                  // task card
                  taskCard(),
                ],
              ),
            )


          ],
        ),
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
                child: Column(
                  children: [
                    Row(
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
                    ),
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
            padding: const EdgeInsets.only(left: 30.0,right: 30, top: 10),
            child: Row(
              children: [
                Text("26°", style: MyTextStyle.primaryBold(fontSize: 65),),
                Text("°C", style: MyTextStyle.primaryLight(fontSize: 14),),
                Text(" | °F", style: MyTextStyle.secondaryLight(fontSize: 14),),

                const Spacer(),
                Column(
                  children: [
                    ImageIcon(AssetImage(AssetStrings.rainIcon,), size: 50, color: MyColors.customRedNew,),
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
          const SizedBox(width: 10,),
          ImageIcon(AssetImage(icon)),
          Text("  $title: ", style: MyTextStyle.secondaryLight(),),
          Text(value, style: MyTextStyle.primaryMedium(fontSize: 14, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }

  Widget weeklyCalender() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: MyColors.borderColor)
      ),
      child: Column(
        children: [
          Row(
            children: [
              customIndicator(title: "ETO", color: MyColors.customBlue),
              const SizedBox(width: 10,),
              customIndicator(title: "ETC", color: MyColors.customRed),
            ],
          ),

          const SizedBox(height: 27,),
          //ETC
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              calenderColumn(etcValue: "23", etoValue: "23", day: "F"),
              calenderColumn(etcValue: "23", etoValue: "23", day: "S"),
              calenderColumn(etcValue: "23", etoValue: "23", day: "S"),
              calenderColumn(etcValue: "23", etoValue: "23", day: "M"),
              calenderColumn(etcValue: "-", etoValue: "-", day: "T"),
              calenderColumn(etcValue: "-", etoValue: "-", day: "W"),
              calenderColumn(etcValue: "-", etoValue: "-", day: "T"),
            ],
          ),
        ],
      ),
    );
  }

  Widget customIndicator({required String title, required Color color}){
    return Row(
      children: [
        Container(
          height: 5,
          width: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
        ),

        Text(" $title", style: MyTextStyle.primaryLight(),),
      ],
    );
  }


  Row taskAndViewAll() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Tasks", style: MyTextStyle.primaryMedium(fontSize: 16),),
        InkWell(
          onTap: (){

          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            decoration: BoxDecoration(
                color: MyColors.customGeryLight,
                borderRadius: BorderRadius.circular(40)
            ),
            child: Text("View all", style: MyTextStyle.primaryLight(),),
          ),
        )
      ],
    );
  }


  Container taskCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: MyColors.borderColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customIconWithValue(icon: Icons.event_note_outlined, iconColor: MyColors.customBlueLight, value: "33"),
          customIconWithValue(icon: Icons.done_all, iconColor: MyColors.customGreenLight, value: "33"),
          customIconWithValue(icon: Icons.close, iconColor: MyColors.customPinkNew, value: "33"),
        ],
      ),
    );
  }


  Widget customIconWithValue({required IconData icon , required Color iconColor,required String value}){
    return Row(
      children: [
        Icon(icon,color: iconColor,size: 29,),
        const SizedBox(width: 5,),
        Text(value, style: MyTextStyle.primaryMedium(fontSize: 24),)
      ],
    );
  }

  Widget calenderColumn({required String etcValue, required String etoValue, required String day}){
    return Column(
      children: [
        Text(etcValue, textAlign: TextAlign.center,style: MyTextStyle.primaryLight(fontColor: MyColors.customRed, fontSize: 16),),
        const SizedBox(height: 10,),
        Text(etoValue, textAlign: TextAlign.center,style: MyTextStyle.primaryLight(fontColor: MyColors.customBlue, fontSize: 16),),
        const SizedBox(height: 10,),
        Text(day, textAlign: TextAlign.center,style: MyTextStyle.primaryLight(fontColor: MyColors.secondaryTextColor),),
      ],
    );
  }
}



class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(22, 13, 12, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0670133,size.height*0.0071765);
    path_0.cubicTo(size.width*0.1733733,size.height*0.1290735,size.width*0.1507200,size.height*0.0717059,size.width*0.2088267,size.height*0.1697059);
    path_0.cubicTo(size.width*0.3469600,size.height*0.1876471,size.width*0.3588867,size.height*0.0490441,size.width*0.4089067,size.height*0.0088235);
    path_0.cubicTo(size.width*0.3234333,size.height*0.0084118,size.width*0.3234333,size.height*0.0084118,size.width*0.0670133,size.height*0.0071765);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
