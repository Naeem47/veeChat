import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:veechat/Constants/colors.dart';
import 'package:veechat/Constants/style.dart';
import 'package:veechat/Provider/Homepageprovider.dart';
import 'package:veechat/Screens/Chatroom.dart';
import 'package:veechat/Widgets/hometile.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> with WidgetsBindingObserver{
    final Homeprovider homeprovider = Homeprovider();
    // late TabController _tabcontroller;
    
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
@override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed){
     homeprovider.setstatus('Online');
    }
    else{
     homeprovider.setstatus('Offline');

    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.purple.withOpacity(0.07),
          iconTheme: const IconThemeData(
            color: ColorConstants.black
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          shadowColor: ColorConstants.purple,
          title: Text(
            "VeeChat ",
            style: stysaans.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: ColorConstants.black),
          ),
          actions: [
            IconButton(onPressed: (){
            homeprovider.showwarning(context);
            }, icon:const  Icon(Icons.logout))
          ],
         
          bottom:  TabBar(
            indicatorColor: ColorConstants.purple,
            labelColor: ColorConstants.purple,
            unselectedLabelColor: ColorConstants.black,
            padding: const EdgeInsets.only(left: 10,right: 10),
            // indicatorSize: TabBarIndicatorSize.,
            indicatorPadding: EdgeInsets.only(left: 15,right: 15),         

            
            tabs:   [
            Tab(
              child:  Text(
            "Chat ",
            style: stysaans.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                ),
          ),
            ),
            Tab(
              child:  Text(
            "Status ",
            style: stysaans.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                ),
          ),
            ),
            
          ]),
        ),
        body: SizedBox(
          height: _height,
          width: _width,
          child: TabBarView(children: [
            _mywidget(),
           Text("Status")
          ]),
        ),
    
      
    
    
        
            
      ),
    );
  }
}
  Widget _mywidget(){
    return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                    child: LottieBuilder.asset("assets/lotties/line.json",));
              } else {
                return ListView.builder(
                 
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var userData =
                        snapshot.data!.docs[index].data() as Map<String, dynamic>;
                    var userEmail = userData['email'];
                    if (userEmail != FirebaseAuth.instance.currentUser!.email) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Chatroom(
                                      imageurl:  userData['profile'],
                                      status: userData['status'],
                                      title: userEmail,
                                      receiverid: userData['uid'],
                                    ),
                                  ));
                            },
                            child: Hometile(userEmail: userEmail,imageurl: userData['profile'],)
                            ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              }
            },
          );
        
     

  }
