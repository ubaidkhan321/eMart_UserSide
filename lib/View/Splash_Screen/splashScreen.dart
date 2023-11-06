import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/View/Auth_Screen/LoginScreen.dart';
import 'package:e_commerce_app/View/Auth_Screen/homeScreen.dart';
import 'package:e_commerce_app/Widget_Common/applogowidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashhView extends StatefulWidget {
  const SplashhView({super.key});

  @override
  State<SplashhView> createState() => _SplashhViewState();
}

class _SplashhViewState extends State<SplashhView> {

  changeScreen(){
      Future.delayed(const Duration(seconds: 3),(){
       //Get.to(()=>  LoginView());
       //here is check user where is go means if user login then go home otherwise go loginScreen.......
       auth.authStateChanges().listen((User? user) {
        if(user== null && mounted){
          Get.to(()=> const LoginView());
        }
        else{
          Get.to(()=>const HomeScreenView());
        }
        
       });
       

      });
      }
      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg,width: 300,)),
              20.heightBox,
              applogoWidget(),
              10.heightBox,
              appname.text.fontFamily(bold).size(22).white.make(),
              5.heightBox,
              appversion.text.white.make(),
               const Spacer(),
               credits.text.white.fontFamily(semibold).make(),
               30.heightBox,

          ],
        ),
      ),
    );
  }
}