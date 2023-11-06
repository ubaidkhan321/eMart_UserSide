import 'package:e_commerce_app/Const/const.dart';

Widget bgWidget({Widget? bgchild}){

  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage(imgBackground),fit: BoxFit.fill)
    ),
    child: bgchild ,
  );
}