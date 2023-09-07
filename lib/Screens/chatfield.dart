import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veechat/Constants/colors.dart';

class Chatfield extends StatelessWidget {
  const Chatfield(
      {super.key,
      required this.controller,
      required this.ontap,
      });
  final TextEditingController controller;
  final Function()? ontap;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: controller,
        decoration: InputDecoration(
//          enabledBorder: OutlineInputBorder(

// borderRadius: BorderRadius.circular(15),
//         ),
          filled: true,
          
          fillColor: ColorConstants.grey.withOpacity(0.2),
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 0,
            ),
          ),
          
          contentPadding: const EdgeInsets.all(15),

          hintText: 'Send you messege',
          hintStyle: GoogleFonts.glory(
            fontSize: 15,
            color: Colors.black,
          ),

          suffixIcon: 
              GestureDetector(
                onTap: ontap,
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                        ColorConstants.blue.withOpacity(0.7),
                        ColorConstants.blue.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Icon(FontAwesomeIcons.solidPaperPlane,color: ColorConstants.white,)),
                  ),
                ),
              ),
            
          ),
        );
  }
}
