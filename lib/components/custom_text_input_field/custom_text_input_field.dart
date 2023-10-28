import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';


class CustomTextInputField extends StatefulWidget {
  final bool isSecure;
  final int maxLines;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function(String) ? onChanged;
  final String? Function(String?)? validatorFunction;
  final String hintText;
  //final String? labelText;

  const CustomTextInputField(
      {Key? key,
        this.isSecure = false,
        required this.controller,
        required this.textInputType,
        required this.hintText,

        this.onChanged,
        this.maxLines = 1,
        //this.labelText = '',
        this.validatorFunction

      })
      : super(key: key);

  @override
  _CustomTextInputFieldState createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validatorFunction,
      style: MyTextStyle.primaryLight(fontSize: 13),
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.textInputType,
      obscureText: widget.isSecure,
      cursorColor: MyColors.secondaryColor,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: widget.hintText,
        hintStyle: MyTextStyle.primaryLight(
            fontColor: MyColors.customGrayDark, fontSize: 13),
        //labelText: widget.labelText == ''? widget.hintText: widget.labelText,
        labelStyle: MyTextStyle.primaryLight(
            fontColor: MyColors.customGery, fontSize: 16),
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: MyColors.primaryColor,
            width: 0.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: MyColors.primaryColor,
            width: 0.9,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 0.9,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 0.9,
          ),
        ),
      ),
    );
  }
}