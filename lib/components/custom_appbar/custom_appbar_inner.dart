import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';


class CustomAppbarInner extends StatefulWidget implements PreferredSizeWidget{
  final IconData leadingIcon;
  final String title;
  final Color bgColor;
  final Color fontColor;
  final Widget actionWidget;
  const CustomAppbarInner({Key? key, this.leadingIcon=Icons.arrow_back_ios_new_rounded,this.title = "", this.bgColor = MyColors.backgroundColor , this.fontColor=MyColors.primaryTextColor, this.actionWidget=const SizedBox(width: 30,)}) : super(key: key);

  @override
  _CustomAppbarInnerState createState() => _CustomAppbarInnerState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarInnerState extends State<CustomAppbarInner> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: -9,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: MyColors.backgroundColor,statusBarIconBrightness: Brightness.dark,),
      //backgroundColor: widget.bgColor,
      leading: IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: Icon(widget.leadingIcon, color: MyColors.primaryTextColor,)),
      title: Text(widget.title, style: MyTextStyle.primaryMedium(fontColor: widget.fontColor, fontSize: 16,),),
      centerTitle: true,
      actions: [
        widget.actionWidget
      ],
    );
  }
}