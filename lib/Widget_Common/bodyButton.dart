import 'package:e_commerce_app/Const/const.dart';
 
 Widget bodybutton({width,height,icon, String? title,onpress}){
   return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset(icon,width: 26,),
    10.heightBox,
    title!.text.color(darkFontGrey).make(),
   ],
   ).box.rounded.white.size(width, height).make();

 }