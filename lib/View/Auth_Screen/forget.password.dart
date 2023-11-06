import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';
import 'package:e_commerce_app/Widget_Common/Button.dart';
import 'package:e_commerce_app/Widget_Common/Custom_textformfild.dart';
import 'package:e_commerce_app/Widget_Common/containerback.dart';
import 'package:e_commerce_app/controller/ProfileimagerPick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  
  const ForgetPassword({super.key,

  });
   
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileImagePicker());
    return  bgWidget(
      bgchild: Scaffold(
        appBar: AppBar(),
        
        body: StreamBuilder(
          stream: Firebaseservice.getuser(currentuser!.uid),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshort){
              if(!snapshort.hasData){
                  return const Center(child: CircularProgressIndicator(color: redColor,strokeWidth: 2,));
                      
                }
                else{
                  return  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.network("https://img.freepik.com/free-vector/forgot-password-concept-illustration_114360-1010.jpg",height: 180,width: 300,)),
                         10.heightBox,
                          componenttextflied(title: oldpassword,hinttext: passwordhint,icon: const Icon(Icons.visibility_off),ispass: true,controller: controller.password),
                          componenttextflied(title: checkpassword,hinttext: passwordhint,icon: const Icon(Icons.visibility_off),ispass: true,controller: controller.oldpassword),
                          componenttextflied(title: conformpassword,hinttext: passwordhint,icon: const Icon(Icons.visibility_off),ispass: true,controller: controller.oldpassword),
                    10.heightBox,
                    ButtonScreen(title: "Save", onpress: (){

                    })
                    ],

                  ).box.white.padding( const EdgeInsets.all(16)).roundedSM.margin( const EdgeInsets.only(left: 12,top: 50,right: 12)).shadowSm.make();
                }
        })
      )
    );
  }
}