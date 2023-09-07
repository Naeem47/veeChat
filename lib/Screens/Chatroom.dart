import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:veechat/Constants/colors.dart';
import 'package:veechat/Constants/style.dart';
import 'package:veechat/Provider/chatroomprovider.dart';
import 'package:veechat/Screens/chatfield.dart';
import 'package:veechat/widgets/chatcontainer.dart';

class Chatroom extends StatefulWidget {
  const Chatroom(
      {super.key,
      required this.title,
      required this.status,
      required this.receiverid,
      required this.imageurl});
  final String title;
  final String status;
  final String receiverid;
  final String imageurl;

  @override
  State<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController messegecontroller = TextEditingController();
  final ChatRoomProvider chatRoomProvider = ChatRoomProvider();
  final ScrollController _scrollController = ScrollController();

  void sendMessege() async {
    if (messegecontroller.text.isNotEmpty) {
      await chatRoomProvider.sendMessege(
          widget.receiverid, messegecontroller.text);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });

      messegecontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: ColorConstants.black),
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            CircleAvatar(
              minRadius: 22,
              maxRadius: 22,
              backgroundColor: ColorConstants.white,
              backgroundImage: CachedNetworkImageProvider(widget.imageurl),
            ),
            SizedBox(
              width: _width * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: stysaans.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: ColorConstants.black),
                ),
                Text(
                  widget.status.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: stysaans.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: ColorConstants.black),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: _buildList(),
            ),
            Chatfield(controller: messegecontroller, ontap: sendMessege)
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return StreamBuilder(
        stream: chatRoomProvider.getMesseges(
            _auth.currentUser!.uid, widget.receiverid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: LottieBuilder.asset("assets/lotties/empty.json"));
          } else {
            return ListView(
              controller: _scrollController,
              children: snapshot.data!.docs
                  .map((document) => _buildmessegeItem(document))
                  .toList(),
            );
          }
        });
  }

  Widget _buildmessegeItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return Chatcontainer(
      color1: (data['senderid'] == _auth.currentUser!.uid)
          ? ColorConstants.blue
          : ColorConstants.purple,
      color: (data['senderid'] == _auth.currentUser!.uid)
          ? ColorConstants.blue
          : ColorConstants.purple,
      text: data['messege'],
    );
  }
}
