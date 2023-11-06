
import 'package:e_commerce_app/Category_Model/Category_model.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/toastmessage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Productcontrol extends GetxController{
 var subcat = [];
 var productcount = 0.obs;
 RxInt colorindex = 0.obs;
 var totalprice = 0.obs;
 


   getproductcategory(title)async{
    subcat.clear();
    //Get root by product model.....
    var data = await rootBundle.loadString("lib/Services/catefory_model.json");
   // Decode root..
    var  decoded = categoryModelFromJson(data);
    var s = decoded.category.where((element) => element.name == title).toList();

    for(var i in s[0].subcategory){
      subcat.add(i);
    }
   }
   changecolor(index){
    colorindex.value = index;

   }
   incresquantity(totalquantity){
    if(productcount.value < totalquantity)
    productcount.value++;
   }
   decressquantity(){
    if(productcount.value > 0)
    {
      productcount.value--;

    }
   
   }
   calculateprice(total){
     
     totalprice.value = total * productcount.value;
   }
   
   addcart({title,img,sellername,procolor,pquan,ptotal})async{
    await  firestore.collection(cartcollection).doc().set({
      'title':title,
      'img': img,
      'pquan':pquan,
      'p_color': procolor,
      'ptotal':ptotal,
      'sellernmae': sellername,
      'id': currentuser!.uid,

    }).onError((error, stackTrace) {
       Utils().toastMessage(error.toString());
    });
   }
   returnvalur(){
    totalprice.value =0;
    productcount.value = 0 ;
    colorindex.value = 0;

   }

    
   }
    









