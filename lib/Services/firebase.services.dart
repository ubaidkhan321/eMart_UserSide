//import 'package:e_commerce_app/Category_Model/Category_model.dart';
import 'package:e_commerce_app/Const/const.dart';


class Firebaseservice {
  static  getuser(uid){
    return firestore.collection(usercollection).where('id',isEqualTo: uid).snapshots();

    
  }
//get product in product wise..........................in category list
  static getproduct(category){
    return firestore.collection(productcollection).where('p_category',isEqualTo: category).snapshots();
  }
//get cart
  static getcart({uid}){
    return firestore.collection(cartcollection).where("id", isEqualTo: uid).snapshots();
  }
  //delet documant
 static deleteproduct({docuid}){

  firestore.collection(cartcollection).doc(docuid).delete();

 }
 //get all chat message with doc id..
 static getmessage(docid){
  return firestore.collection(chatcollection).doc(docid).collection(messagecollection).orderBy('created_on',descending: false).snapshots();

 }
 //get data from order collection
 static getallorder(){
  return firestore.collection(ordercollection).where('order_by',isEqualTo: currentuser!.uid).snapshots();
 }
 //get data from product collection
  static getwishlist(){
  return firestore.collection(productcollection).where('p_Wishlist',arrayContains: currentuser!.uid).snapshots();

 }
  static getallmessage(){
   return firestore.collection(chatcollection).where('from_id',isEqualTo: currentuser!.uid).snapshots();  
    


 }

 static getcount()async{
   var res = await Future.wait([
    firestore.collection(cartcollection).where('id',isEqualTo: currentuser!.uid).get().then((value){
      return value.docs.length;}),
      firestore.collection(productcollection).where('p_Wishlist',arrayContains: currentuser!.uid).get().then((value){
        return value.docs.length;
      }),
      firestore.collection(ordercollection).where('order_by',isEqualTo: currentuser!.uid).get().then((value) {
        return value.docs.length;

      })

   ]);
   return res;
 }

 static getallproduct (){
  return firestore.collection(productcollection).get();
 }


 static getfuturedproduct(){
  return firestore.collection(productcollection).where('p_futured',isEqualTo: true).snapshots();
 }
 static searchproduct(){
 return firestore.collection(productcollection).get();
 }







}