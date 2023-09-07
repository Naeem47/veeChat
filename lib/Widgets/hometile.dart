import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:veechat/Constants/colors.dart';
import 'package:veechat/Constants/style.dart';

class Hometile extends StatelessWidget {
  const Hometile({super.key, required this.userEmail,required this.imageurl});

  final String userEmail;
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: _height * 0.07,
        width: _width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

          
          
        ),
        child: Row(
          children: [
             CircleAvatar(
            minRadius: 25,
                          backgroundColor: ColorConstants.white,

              backgroundImage: CachedNetworkImageProvider(
                imageurl,
             
                
              ),
              
             
             
           
            ),
            SizedBox(
              width: _width * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.only(top:6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                  width:   _width /1.6,
                    child: Text(
                      userEmail.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: stysaans.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
