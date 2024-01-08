import 'package:e_commerce_app/Const/const.dart';

Widget orderstatus({icon,color,title,  showdone}){
  return ListTile(
    leading:  Icon(icon,color: color,).box.border(color: color).roundedSM.padding( const  EdgeInsets.all(4)).make(),
    trailing: SizedBox(
      height: 100,
      width: 140,
      child: Row(
        children: [ 
          "$title".text.size(16).color(fontGrey).make(),
          showdone ? const Icon(Icons.done)  :
          Container(),
       
        ],
      ),
    ),

  );
}