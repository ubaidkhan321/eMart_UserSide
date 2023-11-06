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

}