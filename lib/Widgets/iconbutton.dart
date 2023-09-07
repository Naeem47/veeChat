import 'package:flutter/material.dart';
import 'package:veechat/Constants/colors.dart';
import 'package:veechat/Constants/style.dart';

class CustomIconButton extends StatelessWidget {
  const  CustomIconButton({super.key,required this.text,required this.onpressed,required this.color,required this.icon});
  final String text ;
  final  void Function ()? onpressed;
  final Color color;
  final IconData icon ;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    return ElevatedButton.icon(
      icon: Icon(icon),
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize:Size(_width, _height*0.06),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
      ),
      label: Text(
        text,
        style: styven.copyWith(
          color: ColorConstants.white,
        ),
      
      ),
    );
  }
}
