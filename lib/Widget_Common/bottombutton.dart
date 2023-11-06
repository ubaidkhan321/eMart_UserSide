  import 'package:e_commerce_app/Const/const.dart';

  Widget bottombutton({String? title,bottomimges}){
    return Row(
      children: [
      Image.asset(bottomimges,width: 60,fit: BoxFit.fill,),
      5.widthBox,
        title!.text.fontWeight(FontWeight.bold).color(darkFontGrey).make()

      ],
    ).box.width(200).padding( const EdgeInsets.all(5)).margin( const EdgeInsets.symmetric(horizontal: 6)).roundedSM.white.outerShadowSm.make();
  }