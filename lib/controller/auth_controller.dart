import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  var isloading = false.obs;
  //Login
  Future<UserCredential?> islogin({context,semail,spassword}) async {
    UserCredential? userCredential;

    try {
     userCredential = await auth.signInWithEmailAndPassword(email: semail, password: spassword);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
//SignUp

  Future<UserCredential?> signup({context, email, password}) async {
    UserCredential? userCredential;

    try {
    userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  //Signout

  signout({context})async{
   try{
   await auth.signOut();

   }
   catch(e){
       VxToast.show(context, msg: e.toString());

   }

  }

  //Store Data..
  stordata({name,password,email}) async {
   
    DocumentReference store =
        await firestore.collection(usercollection).doc(currentuser!.uid);
    store.set(
        {'name': name, 'password': password, 'email': email, 'imageurl': '','id' :currentuser!.uid,
          'cart_count': '00','order_count': '00','Wishlist_count': '00'
        
        });
  }
}
