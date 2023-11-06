  import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Widget_Common/Button.dart';
import 'package:flutter/services.dart';


Widget exitsdialog(context){
  return Dialog(
  
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15)
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Comfirm".text.fontWeight(FontWeight.bold).make(),
        10.heightBox,
        "Are you sure you want to exits?".text.size(18).make(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttonScreen(title: "yes",color: Colors.red,textcolor: whiteColor,onclick: (){
            SystemNavigator.pop();
             

            }),
             buttonScreen(title: "No",color: Colors.red,textcolor: whiteColor,onclick: (){
              Navigator.pop(context);

            }),
           

          ],
        )
        


      ],
    ).box.white.roundedSM.padding ( const EdgeInsets.all(4)).make()
  );
}