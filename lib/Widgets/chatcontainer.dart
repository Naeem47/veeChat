import 'package:flutter/material.dart';
import 'package:veechat/Constants/colors.dart';
import 'package:veechat/Constants/style.dart';

// ignore: must_be_immutable
class Chatcontainer extends StatelessWidget {
  Chatcontainer({
    super.key,
    required this.text,
    required this.color,
    required this.color1, 
    // required this.alignmentc,
  });
  String text;
  // final Alignment alignmentc;
  final Color color;
  final Color color1;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          // color: Colors.green,
          child: Row(
            children: [
              
               
              Container(
                // alignment: alignmentc,
                  
                  constraints: BoxConstraints(maxWidth: w * 2 / 3),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topCenter,
                      colors: [
                        color.withOpacity(0.9),
                        color1.withOpacity(1),
                      ],
                    ),
                  ),
                  child: SelectableText(
                    text,
                    style: stysaans.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: ColorConstants.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
