import 'package:e_commerce_app/Const/const.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils{

  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.red,
        fontSize: 16.0
    );
    
  }
}
