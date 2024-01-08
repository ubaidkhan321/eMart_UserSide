  import 'package:e_commerce_app/Const/const.dart';
import 'package:get/get.dart';

class homecontroller extends GetxController{
   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getusername();
  }

  var currentnavindex = 0.obs;
  final searchcontroller = TextEditingController();

 var username = '';
  getusername()async{
    var n = await firestore.collection(usercollection).where('id',isEqualTo: currentuser!.uid).get().then((value) {
     if(value.docs.isNotEmpty){
      return value.docs.single['name'];
     }

    });
    username = n;


  }
 

}