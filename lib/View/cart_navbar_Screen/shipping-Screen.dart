
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/toastmessage.dart';

import 'package:e_commerce_app/View/cart_navbar_Screen/payment_Methode.dart';
import 'package:e_commerce_app/Widget_Common/Button.dart';
import 'package:e_commerce_app/Widget_Common/Custom_textformfild.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Cartcontroller>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: "Shipping".text.size(16).make(),
        ),
        bottomNavigationBar: SizedBox(
          height: 70 ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonScreen(
              title: "Continue", onpress: (){
                if(controller.addresscontroller.text.isEmpty || controller.citycontroller.text.isEmpty || controller.statecontroller.text.isEmpty || controller.postalcontroller.text.isEmpty || controller.phonecontroller.text.isEmpty){
                  Utils().toastMessage("Enter Field");
                }
                else{
                   Get.to(()=> const PaymentMethode());

                }
                
              }),
          ),
        ),
        body: 
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          componenttextflied(
                              title: "Address",
                              hinttext: "Enter Address",
                              ispass: false,
                              icon: const Icon(
                                Icons.home,
                              ),
                              controller: controller.addresscontroller),
                          componenttextflied(
                              title: "City",
                              hinttext: "Enter City",
                              ispass: false,
                              icon: const Icon(Icons.location_city),
                              controller: controller.citycontroller),
                          componenttextflied(
                              title: "State",
                              hinttext: "Enter State",
                              ispass: false,
                              icon: const Icon(Icons.local_activity),
                              controller: controller.statecontroller),
                          componenttextflied(
                              title: "Postal",
                              hinttext: "Enter postal",
                              ispass: false,
                              icon: const Icon(Icons.post_add),
                              controller: controller.postalcontroller),
                          componenttextflied(
                              title: "phone",
                              hinttext: "Enter phone Number",
                              ispass: false,
                              icon: const Icon(Icons.phone),
                              controller: controller.phonecontroller),
                        ],
                      ),
                    ),
                   
                  
             
            );
  }
}
