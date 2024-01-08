  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/toastmessage.dart';
import 'package:e_commerce_app/controller/homecontroller.dart';
import 'package:get/get.dart';

class Cartcontroller extends GetxController{
 var totalamount = 0.obs;
 var ischeck = 0.obs;
 var isloading = false.obs;

 var product = [];
late dynamic productSnapshot;



 final addresscontroller = TextEditingController();
 final citycontroller = TextEditingController();
 final statecontroller = TextEditingController();
 final postalcontroller = TextEditingController();
 final phonecontroller = TextEditingController();

carttotal(data){
  totalamount.value = 0;
  for(int i = 0 ; i < data.length; i ++ ){
    totalamount.value = totalamount.value + int.parse(data[i]['ptotal'].toString());
  }

}
 changeindex(index){
  ischeck.value = index;

 }

 orderplace({paymentmethode,totalamount})async{
  isloading(true);
  await getproduct();
  await firestore.collection(ordercollection).doc().set({


    
    'order_code': '2339812367',
    'order_date': FieldValue.serverTimestamp(),
    'order_by' :currentuser!.uid,
    'order_by_name': Get.find<homecontroller>().username,
    'order_by_email': currentuser!.email,
    'order_by_address': addresscontroller.text,
    'order_by_city':citycontroller.text,
    'order_by_state':statecontroller.text,
    'order_by_postal': postalcontroller.text,
    'order_by_phone': phonecontroller.text,
    'shipping_methode': 'Home Delivery',
    'payment_methode': paymentmethode,
    'order_place': true,
    'order_conform' : false,
    'order_delivered' : false,
    'order_on_delivery': false,
    'total_amount': totalamount,
    'order':FieldValue.arrayUnion(product),

  });
  isloading(false);
  Utils().toastMessage("Order Placed");


 }

 getproduct()async{
  product.clear();
  for(int i = 0; i < productSnapshot.length; i++ ){
    product.add({
    

      'color': productSnapshot[i]['p_color'],
      'vendor_id': productSnapshot[i]['vendor_id'],
      'img': productSnapshot[i]['img'],
      't_price': productSnapshot[i]['ptotal'],
      'qty': productSnapshot[i]['pquan'],
      'title': productSnapshot[i]['title']
    });
  }
  print(product);

 }
//  updateproduct({uid,datacolor,datavendorid,dataimg,dataprice,dataqty,datatitle})async{
//     var store = firestore.collection(ordercollection).doc(uid);
//     await store.update({
//        'color': datacolor,
//       'vendor_id': datavendorid,
//       'img': dataimg,
//       't_price': dataprice,
//       'qty': dataqty,
//       'title': datatitle,

//     });
    



//    }

   clearcart(){
  for(var i = 0 ; i < productSnapshot.length; i++ ){
    firestore.collection(cartcollection).doc(productSnapshot[i].id).delete();


  }

   }



}