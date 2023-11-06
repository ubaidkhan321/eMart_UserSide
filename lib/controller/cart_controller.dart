  import 'package:get/get.dart';

class Cartcontroller extends GetxController{
 var totalamount = 0.obs;

carttotal(data){
  totalamount.value = 0;
  for(int i = 0 ; i < data.length; i ++ ){
    totalamount.value = totalamount.value + int.parse(data[i]['ptotal'].toString());
  }

}

}