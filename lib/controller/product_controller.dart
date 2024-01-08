
import 'package:cloud_firestore/cloud_firestore.dart';
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
 var isfav = false.obs;


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
   
   addcart({title,img,sellername,procolor,pquan,ptotal,venderid})async{
    await  firestore.collection(cartcollection).doc().set({
      'title':title,
      'img': img,
      'pquan':pquan,
      'p_color': procolor,
      'ptotal':ptotal,
      'sellernmae': sellername,
      'id': currentuser!.uid,
      'vendor_id': venderid,

    }).onError((error, stackTrace) {
       Utils().toastMessage(error.toString());
    });
   }
   returnvalur(){
    totalprice.value =0;
    productcount.value = 0 ;
    colorindex.value = 0;



   }
   //add arry in product  collection in wishlist................

   addfromwishlist({docid}){
    firestore.collection(productcollection).doc(docid).set({
      'p_Wishlist': FieldValue.arrayUnion([currentuser!.uid])

   }, SetOptions(merge: true));
   isfav(true);
   Utils().toastMessage("Added to wishlist");

   }
   //Remove arry in product  collection in wishlist................/
    removefromwishlist({docid})async{
   await firestore.collection(productcollection).doc(docid).set({
      'p_Wishlist': FieldValue.arrayRemove([currentuser!.uid])

   }, SetOptions(merge: true));
   isfav(false);
   Utils().toastMessage("Remove from wishlist");

   }

   checkisfav(data) async{
    if(data['p_Wishlist'].contains(currentuser!.uid)){
      isfav(true);
    }else{
      isfav(false);
    }


   }
   

    
   }
    









