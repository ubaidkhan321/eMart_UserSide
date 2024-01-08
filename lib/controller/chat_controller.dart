

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/controller/homecontroller.dart';
import 'package:get/get.dart';

class ChatControl extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getchatid();
  }



 var chat = firestore.collection(chatcollection);


  var sendername = Get.find<homecontroller>().username;
  var currentId = currentuser!.uid;


  //ya hm dosri screen sy get kar rhe hai jbhe isko arrgument mai rkha hai
   var friendname =  Get.arguments[0];
   var friendid = Get.arguments[1];

    final messagecontroller = TextEditingController();


    dynamic chatdocid;
 var isloading = false.obs;
    getchatid()async{
    isloading(true);
  
      await chat.where('users',isEqualTo: {
        friendid: null,
        currentId: null,

      }).limit(1).get().then((QuerySnapshot snapshot){
        if (snapshot.docs.isNotEmpty){
          chatdocid = snapshot.docs.single.id;

        }
        else{
          chat.add({
         'created_on':null,
         'last_msg': '',
         'users':{
          friendid:null,
          currentId:null
         },
         'to_id': '',
          'from_id': '',
          'friend_name': friendname,
          'sender_name':sendername

          }).then((value) {
            chatdocid = value.id;
          });

        }
      });
      isloading(false);
   
      
    }
    sendmessage(String msg)async{
      if(msg.trim().isNotEmpty){
        chat.doc(chatdocid).update({
          'created_on':FieldValue.serverTimestamp(),
          'last_msg': msg,
          'to_id':friendid,
          'from_id':currentId,
        });

        chat.doc(chatdocid).collection(messagecollection).doc().set({
          'created_on':FieldValue.serverTimestamp(),
          'msg': msg,
          'uid':currentId,

        });
      }
      
    }



}