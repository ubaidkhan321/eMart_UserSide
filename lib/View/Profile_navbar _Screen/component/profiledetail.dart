  import 'package:e_commerce_app/Const/const.dart';

  Widget profiledetail({String? title,String? count,width}){
    return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    count!.text.fontWeight(FontWeight.bold).size(16).make(),
                    2.heightBox,
                    title!.text.align(TextAlign.center).makeCentered(),
                   
                    
                  ],
                 ).box.white.rounded.width(width).height(80).margin( const EdgeInsets.all(3)).padding( const EdgeInsets.all(4)).make();
                  
                
  }