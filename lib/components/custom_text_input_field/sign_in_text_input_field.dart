import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';

class MyTextFieldSignIn extends StatefulWidget {
  final bool isSecure;
  final TextEditingController controller;
  final TextInputType textInputType;
  //final Widget prefix;
  final Widget ? suffix;
  final String hintText;
  //final String autoFillHints;
  final String? Function(String?)? validatorFunction;
  final Function(String) ? onChanged;
  const MyTextFieldSignIn(
      {Key? key,
        this.isSecure = false,
        required this.controller,
        required this.textInputType,
        //required this.prefix,
        this.onChanged,
        this.suffix,
        required this.hintText,
        //required this.autoFillHints,
        this.validatorFunction})
      : super(key: key);

  @override
  _MyTextFieldSignInState createState() => _MyTextFieldSignInState();
}

class _MyTextFieldSignInState extends State<MyTextFieldSignIn> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validatorFunction,
      style: MyTextStyle.primaryLight(),
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: widget.isSecure,
      cursorColor: MyColors.primaryColor,
      onChanged: widget.onChanged,
      //autofillHints: [widget.autoFillHints],
      decoration: InputDecoration(
        //prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        contentPadding: const EdgeInsets.only(left: 10),
        hintText: widget.hintText,
        hintStyle: MyTextStyle.primaryLight(
            fontColor: Colors.grey, fontSize: 13),
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: MyColors.secondaryTextColor,
            width: 0.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: MyColors.secondaryColor,
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