 import 'package:get/get.dart';

class CheckButtonClass extends  GetxController{
  RxBool checkvalue = false.obs;
  

  changestatebutton(bool? value){
    checkvalue.value = value!;

  }

}