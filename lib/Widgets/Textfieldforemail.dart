import 'package:flutter/material.dart';
import 'package:veechat/Constants/colors.dart';

class TextfieldEmail extends StatelessWidget {
  const TextfieldEmail(
      {super.key, required this.controller, required this.hinttext,required this.validate});
  final String hinttext;
  final validate;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      decoration: InputDecoration(
         focusedBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: ColorConstants.grey.withOpacity(0.2))),
        hintText: hinttext,
        fillColor: ColorConstants.grey.withOpacity(0.15),
        focusColor: ColorConstants.black,
        filled: true,
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorConstants.grey.withOpacity(0.2))
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorConstants.grey.withOpacity(0.2))
        )
      ),
      controller: controller,
    );
  }
}
