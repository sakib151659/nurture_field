// import 'package:flutter/material.dart';
// import 'package:nurture_field/screens/dashboards/home/home_page.dart';
// import 'package:nurture_field/utils/app_colors.dart';
// import 'package:nurture_field/utils/asset_strings.dart';
// import 'package:nurture_field/utils/custom_text_style.dart';
// import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
//
// class LandingPage extends StatefulWidget {
//   final int indexValue;
//   const LandingPage({Key? key,
//     required this.indexValue
//   }) : super(key: key);
//
//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }
//
// class _LandingPageState extends State<LandingPage> {
//   PersistentTabController? _controller;
//   bool isEnglishSelected = true;
//   int tabIndex =0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: MyAppBar(isEnglishSelected: isEnglishSelected,),
//       // drawer: MyDrawer(isEnglishSelected: isEnglishSelected,),
//       // extendBodyBehindAppBar: tabIndex ==0?true:false,
//       // backgroundColor: MyColors.primaryColor,
//       //resizeToAvoidBottomInset: tabIndex ==0?false:true,
//       body: PersistentTabView(
//         context,
//         controller: _controller,
//         navBarStyle: NavBarStyle.simple,
//         navBarHeight: 60,
//         onItemSelected: (value){
//           //print(value);
//           setState(() {
//             tabIndex=value;
//           });
//
//         },
//         decoration: const NavBarDecoration(
//           //borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
//           boxShadow:  [
//             BoxShadow(
//                 color: MyColors.secondaryColor,
//                 offset: Offset(1, 2), //(x,y)
//                 blurRadius: 3.0,
//                 spreadRadius: 3
//             ),
//           ],
//         ),
//         screens: [
//           HomePage(),
//           Text("Coming Soon..."),
//           Text("Coming Soon..."),
//           Text("Coming Soon..."),
//           Text("Coming Soon..."),
//         ],
//         items: [
//           PersistentBottomNavBarItem(
//             //icon: const ImageIcon(AssetImage(AssetStrings.filedIcon,), size: 50,),
//             icon: Icon(Icons.home_filled),
//             iconSize: 22,
//             title: "Home",
//             textStyle: MyTextStyle.primaryMedium(fontColor: Colors.black, fontSize: 14),
//             activeColorPrimary:  MyColors.secondaryTextColor,
//             activeColorSecondary: MyColors.primaryTextColor,
//           ),
//           PersistentBottomNavBarItem(
//             icon: const ImageIcon(AssetImage(AssetStrings.deleteIcon), size: 50),
//             title:  "Forecast",
//             iconSize: 90,
//             textStyle: MyTextStyle.primaryMedium(fontColor: Colors.black, fontSize: 14),
//             activeColorPrimary:  MyColors.secondaryTextColor,
//             activeColorSecondary: MyColors.primaryTextColor,
//           ),
//           PersistentBottomNavBarItem(
//             icon: const ImageIcon(AssetImage(AssetStrings.deleteIcon), size: 50),
//             title:  "Map",
//             iconSize: 90,
//             textStyle: MyTextStyle.primaryMedium(fontColor: Colors.black, fontSize: 14),
//             activeColorPrimary:  MyColors.secondaryTextColor,
//             activeColorSecondary: MyColors.primaryTextColor,
//           ),
//           PersistentBottomNavBarItem(
//             icon: const ImageIcon(AssetImage(AssetStrings.deleteIcon), size: 50),
//             title:  "Notification",
//             iconSize: 90,
//             textStyle: MyTextStyle.primaryMedium(fontColor: Colors.black, fontSize: 14),
//             activeColorPrimary:  MyColors.secondaryTextColor,
//             activeColorSecondary: MyColors.primaryTextColor,
//           ),
//
//           PersistentBottomNavBarItem(
//             icon: const ImageIcon(AssetImage(AssetStrings.deleteIcon), size: 50),
//             title:  "Setting",
//             iconSize: 90,
//             textStyle: MyTextStyle.primaryMedium(fontColor: Colors.black, fontSize: 14),
//             activeColorPrimary:  MyColors.secondaryTextColor,
//             activeColorSecondary: MyColors.primaryTextColor,
//           ),
//         ],
//       ),
//     );
//   }
// }




/// new landing page custom start


import 'package:flutter/material.dart';
import 'package:nurture_field/screens/dashboards/home/home_page.dart';
import 'package:nurture_field/utils/app_colors.dart';
import 'package:nurture_field/utils/asset_strings.dart';
import 'package:nurture_field/utils/custom_text_style.dart';


class LandingPage extends StatefulWidget {

  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  int selectedIndex = 0;
  final List<Widget> _screens = [
    // HomeScreen(),
    // FavoritesScreen(),
    // ProfileScreen(),
    HomePage(),
    Center(child: Text("Coming Soon....")),
    Center(child: Text("Coming Soon....")),
    Center(child: Text("Coming Soon....")),
    Center(child: Text("Coming Soon....")),

  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        body: _screens[selectedIndex],
        bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
          color:MyColors.white,
          surfaceTintColor: MyColors.white,
          shadowColor: MyColors.customGrayDark,
          height: 80,
          elevation: 12,
          child: Row( //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              customIcon(icon: AssetStrings.homeFilledIcon, title: "Home", index: 0, onTap: (){
                setState(() {
                  selectedIndex = 0;
                });
              }),
              customIcon(icon: AssetStrings.forecastUnfilledIcon, title: "Forecast", index: 1, onTap: (){
                setState(() {
                  selectedIndex = 1;
                });
              }),
              customIcon(icon: AssetStrings.mapUnfilledIcon, title: "Map", index: 2, onTap: (){
                setState(() {
                  selectedIndex = 2;
                });
              }),
              customIcon(icon: AssetStrings.notificationUnfilledIcon, title: "Notification", index: 3, onTap: (){
                setState(() {
                  selectedIndex = 3;
                });
              }),
              customIcon(icon: AssetStrings.settingsUnfilledIcon, title: "Setting", index: 4, onTap: (){
                setState(() {
                  selectedIndex = 4;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget customIcon({required String icon, required String title, required int index, required Function() onTap}){
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(AssetImage(icon), size: 25,color: index==selectedIndex?MyColors.primaryTextColor:MyColors.secondaryTextColor,),
          const SizedBox(height: 2,),
          Text(title, style: MyTextStyle.primaryLight(fontSize: 12,fontColor: index==selectedIndex?MyColors.primaryTextColor:MyColors.secondaryTextColor,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }

}

