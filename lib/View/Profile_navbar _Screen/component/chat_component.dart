
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:intl/intl.dart'as intl;

Widget chatbubbole(DocumentSnapshot data){
  var t = data['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
  var time = intl.DateFormat("h:mma").format(t);
  return  Directionality(
    textDirection: data['uid'] == currentuser!.uid ? TextDirection.rtl : TextDirection.rtl,
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
                  decoration:  BoxDecoration(
                    
                    color: data['uid'] == currentuser!.uid ?   Colors.blue : Colors.green,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
  
                    )
  
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    "${data['msg']}".text.white.size(16).make(),
                     time.text.color(whiteColor.withOpacity(0.5)).make()
                    ],
                  ),
                ),
  );
}