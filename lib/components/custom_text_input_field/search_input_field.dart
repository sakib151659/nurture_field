import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_style.dart';



class SearchInputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final Widget prefix;
  final Widget ? suffix;
  final String hintText;
  final String? Function(String?)? validatorFunction;
  final Function(String) ? onChangedCallBack;
  const SearchInputField(
      {Key? key,
        required this.controller,
        required this.textInputType,
        required this.prefix,
        this.suffix,
        required this.hintText,
        this.onChangedCallBack,
        this.validatorFunction})
      : super(key: key);

  @override
  _SearchInputFieldState createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validatorFunction,
      style: MyTextStyle.primaryLight(),
      controller: widget.controller,
      keyboardType: widget.textInputType,
      cursorColor: MyColors.primaryColor,
      onChanged: widget.onChangedCallBack,
      //autofillHints: [widget.autoFillHints],
      decoration: InputDecoration(
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        fillColor: MyColors.white,
        //filled: true,
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
            color: MyColors.borderColor,
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
