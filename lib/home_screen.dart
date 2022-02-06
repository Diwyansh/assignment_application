import 'package:assignment_app/controllers/data_controller.dart';
import 'package:assignment_app/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   DataController _dataController = Get.put(DataController());
   RefreshController _refreshController = RefreshController(initialRefresh: false);

   void _onRefresh() async{
     await Future.delayed(Duration(milliseconds: 1000));
     _dataController.getTournamentListing(10);
     _refreshController.refreshCompleted();
   }

   void _onLoading() async {
     await Future.delayed(Duration(milliseconds: 1000));
     _dataController.getTournamentListing(_dataController.tournamentModel.value.data!.tournaments!.length +10);
     _refreshController.loadComplete();
   }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Icon(Icons.short_text_outlined,color: Colors.black,size: 40,),
            title: Text("Flyingwolf",style: TextStyle(color: Colors.black),),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){
                final box = GetStorage();
                box.remove("isLoggedIn");
                Get.offAll(LoginScreen());
              }, icon: Icon(Icons.logout,color: Colors.black,))
            ],
          ),
        ],
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          footer: CustomFooter(
            builder: (BuildContext context,LoadStatus? mode){
              Widget body ;
              if(mode==LoadStatus.idle){
                body =  Text("Loading...");
              }
              else if(mode==LoadStatus.loading){
                body =  CupertinoActivityIndicator();
              }
              else if(mode == LoadStatus.failed){
                body = Text("Load Failed! Click retry!");
              }
              else if(mode == LoadStatus.canLoading){
                body = Text("Release to load more");
              }
              else{
                body = Text("No more Data");
              }
              return Container(
                height: 30.0,
                child: Center(child:body),
              );
            },
          ),
          controller: _refreshController,
          child: SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://psdreview.com/wp-content/uploads/2012/11/indian.jpg"),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Simon Baker",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              Divider(
                                color: Colors.transparent,
                              ),
                              Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(color: Colors.blueAccent)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "2250",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        VerticalDivider(),
                                        Text("Elo rating")
                                      ],
                                    ),
                                  ))
                            ]))
                  ],
                ),
                Divider(
                  color: Colors.transparent,
                  height: 20,
                ),
                Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFEF6C00),
                                      Color(0xFFFFB74D),
                                    ]
                                )),
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Column(
                              children: [
                                Text("34",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                  "Tournaments Played",
                                  style: TextStyle(color: Colors.white, height: 1.3),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF4527A0),
                                  Color(0xFF7E57C2),
                                  Color(0xFF9575CD),
                                ])),
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  "09",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Tournaments Won",
                                  style: TextStyle(color: Colors.white, height: 1.3),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.redAccent,
                                  Color(0xFFEF7E78),
                                ])),
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Column(
                              children: [
                                Text("26%",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                  "Winning Percentage",
                                  style: TextStyle(color: Colors.white, height: 1.3),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 20,
                ),
                Text(
                  "Recommended for you",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                GetX<DataController>(
                  init: DataController(),
                  builder: (controller) => controller.tournamentModel.value.data == null ? Container() : ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.tournamentModel.value.data!.tournaments!.length,
                      itemBuilder: (context,index)=>Container(
                        height: 170,
                        margin: EdgeInsets.only(bottom: 20),
                        clipBehavior: Clip.hardEdge,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 50,
                                offset: Offset(0,10),
                                // spreadRadius: 0
                              )
                            ]
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              bottom: 0,
                              left: 0,
                              child: Image.network(
                                controller.tournamentModel.value.data!.tournaments![index].coverUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                height: 70,
                                left: 0,
                                right: 0,
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  child: ListTile(
                                    title: Text( controller.tournamentModel.value.data!.tournaments![index].name! ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    subtitle: Text(controller.tournamentModel.value.data!.tournaments![index].gameName!,style: TextStyle(height: 2)),
                                    trailing: Icon(Icons.arrow_forward_ios_rounded,size: 20),
                                  ),
                                ))
                          ],
                        ),
                      )),
                ),
              ],
            ),
      ),
          ),
        ),
      ),
    );
  }
}
