import 'package:flutter/material.dart';
import 'package:veechat/Constants/colors.dart';

class TextfieldPassword extends StatelessWidget {
  const TextfieldPassword(
      {super.key, required this.controller, required this.hinttext,required this.obsecure,required this.sicon,required this.onatp,required this.validate});
  final String hinttext;
   final bool obsecure;
  final TextEditingController controller;
  final Icon sicon;
   final void Function()? onatp ;
   final  validate ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      validator: validate,
      
      decoration: InputDecoration(
        suffixIcon :GestureDetector(
          onTap: onatp,
          child: sicon),
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
              borderSide:
                  BorderSide(color: ColorConstants.grey.withOpacity(0.2))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: ColorConstants.grey.withOpacity(0.2)))),
      controller: controller,
    );
  }
}
