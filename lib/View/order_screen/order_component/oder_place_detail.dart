

import 'package:e_commerce_app/Const/const.dart';

Widget orderplace({t1,t2,d1,d2}){

  return  Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "$t1".text.fontFamily(semibold).make(),
                    "$d1".text.color(redColor).fontFamily(bold).make()
           
                ],),
                SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    "$t2".text.make(),
                    "$d2".text.fontFamily(semibold).make(),
                           
                           
                  ],),
                )
              ],
             ),
           );
}