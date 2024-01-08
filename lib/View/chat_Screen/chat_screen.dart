import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/colors.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';
import 'package:e_commerce_app/View/Profile_navbar%20_Screen/component/chat_component.dart';
import 'package:e_commerce_app/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatvViewSceen extends StatelessWidget {
  const ChatvViewSceen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatControl());
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "${controller.friendname}".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           
               
              
                 
                     Obx(()=>
                     controller.isloading.value ?
                    const Center(child: CircularProgressIndicator(color: redColor,strokeWidth: 2,),):
                        Expanded(child: StreamBuilder(
                                         stream: Firebaseservice.getmessage(controller.chatdocid.toString()),
                                         builder: (BuildContext conetext, AsyncSnapshot<QuerySnapshot>  snapshot){
                        if(!snapshot.hasData){
                          return const Center(
                            child: CircularProgressIndicator(color: redColor,strokeWidth: 2,),
                          );
                          
                        }
                       else if(snapshot.data!.docs.isEmpty){
                          return Center(
                            child: "Sent message".text.make(),
                          );
                          
                        }
                        else{
                                         
                         return  ListView(
                                         children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                                          var data = snapshot.data!.docs[index];
                                          return Align(
                                            alignment: data['uid'] ==  currentuser!.uid ? Alignment.centerRight : Alignment.centerLeft,
                                            child: chatbubbole(data));
                                         }).toList()
                        
                                         
                                );
                                }
                               
                               
                                 })
                                 ),
                     ),
                  
                  5.heightBox,
            
            
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.messagecontroller,
                    decoration:const  InputDecoration(
                      hintText: "Typr a message",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textfieldGrey 
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textfieldGrey,
                        )
                      )
                    ),
                  ),
                ),
                IconButton(onPressed: ()
                {
                  controller.sendmessage(controller.messagecontroller.text);
                  controller.messagecontroller.clear();


                }, icon: const  Icon(Icons.send,color: Colors.blue,))
              ],
            ).box.height(80).padding(const EdgeInsets.all(12)).margin(const EdgeInsets.only(bottom: 8)).make()
           ],
        ),
      ),
    );
  }
}