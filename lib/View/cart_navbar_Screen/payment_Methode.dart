import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/list.dart';
import 'package:e_commerce_app/Const/toastmessage.dart';
import 'package:e_commerce_app/View/Auth_Screen/homeScreen.dart';
import 'package:e_commerce_app/Widget_Common/Button.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:get/get.dart';

class PaymentMethode extends StatelessWidget {
 
  const PaymentMethode({super.key,
 
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Cartcontroller>();
    return Obx(()=>
       Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: "payment Method".text.size(16).make(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 60,
              child: controller.isloading.value ? const Center(child:  CircularProgressIndicator(color: redColor,strokeWidth: 2,)) : ButtonScreen(title: "Place my order", onpress: () async {
              await controller.orderplace(paymentmethode: paymentname[controller.ischeck.value],totalamount: controller.totalamount.value);
              await controller.clearcart();
              Utils().toastMessage("Order Placed Successfully");
              Get.offAll( const HomeScreenView());
             
             
              })),
        ),
        body: Obx(
          () => Column(
            children: List.generate(paymentname.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    controller.changeindex(index);
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: controller.ischeck.value == index
                                ? redColor
                                : Colors.transparent,
                            width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(
                          paymentimg[index],
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                          colorBlendMode: controller.ischeck.value == index ? BlendMode.darken : BlendMode.color,
                          color: controller.ischeck.value == index ? Colors.black.withOpacity(0.4) : Colors.transparent,
                        ),
                        controller.ischeck.value == index
                            ? Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              )
                            : Container(),
                        Positioned(
                            bottom: 0,
                            right: 10,
                            child: paymentname[index].text.white.size(16).make())
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
