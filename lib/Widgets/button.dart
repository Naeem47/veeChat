import 'package:flutter/material.dart';
import 'package:veechat/Constants/colors.dart';
import 'package:veechat/Constants/style.dart';

class Button extends StatelessWidget {
  const  Button({super.key,required this.text,required this.onpressed,required this.color});
  final String text ;
  final  void Function ()? onpressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize:Size(_width, _height*0.06),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
      ),
      child: Text(
        text,
        style: styven.copyWith(
          color: ColorConstants.white,
          fontSize: 18
        ),
      
      ),
    );
  }
}
