import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/View/Category_navbar_Screen/categoryScreen.dart';
import 'package:e_commerce_app/View/Profile_navbar%20_Screen/ProfileScreen.dart';
import 'package:e_commerce_app/View/Profile_navbar%20_Screen/component/exitdialogbox.dart';
import 'package:e_commerce_app/View/cart_navbar_Screen/cartScreen.dart';
import 'package:e_commerce_app/View/home_navbarScreen/homeNavbarScreen.dart';
import 'package:e_commerce_app/controller/homecontroller.dart';
import 'package:get/get.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});
 
  @override
  Widget build(BuildContext context) {
     var controller = Get.put(homecontroller());
    var navbaritem = [
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,),label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,),label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,),label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,),label: account),

    ];

    var navbody=[
    const HomeNavbarScreen(),
   const CategoryScreen(),
  const CartNavScreen(),
  const ProfileScreen(),

     

    ]; 
    return  WillPopScope(
      onWillPop: ()async{
       showDialog(context: context, builder: (context)=> exitsdialog(context));
        return false;

      },
      child: Scaffold(
        
        body: Column(children: [
          Obx(()=> Expanded(child: navbody.elementAt(controller.currentnavindex.value)))
        ],),
        bottomNavigationBar: Obx(()=>
           BottomNavigationBar(
            currentIndex: controller.currentnavindex.value,
            selectedItemColor: Colors.red,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: navbaritem,
            onTap: (value){
              controller.currentnavindex.value = value;
            },
            ),
        ),
      ),
    );
  }
}