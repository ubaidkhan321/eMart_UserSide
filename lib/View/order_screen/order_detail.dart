import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/View/order_screen/order_component/oder_place_detail.dart';
import 'package:e_commerce_app/View/order_screen/order_component/order_status.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetailScreen extends StatelessWidget {
  final dynamic data;
  const OrderDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details".text.color(redColor).make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            orderstatus(
                color: redColor,
                icon: Icons.done,
                title: "Placed",
                showdone: data['order_place']),
            orderstatus(
                color: Colors.blue,
                icon: Icons.thumb_up,
                title: "Confirm",
                showdone: data['order_conform']),
            orderstatus(
                color: Colors.yellow,
                icon: Icons.car_rental_rounded,
                title: "on Delivery",
                showdone: data['order_on_delivery']),
            orderstatus(
                color: Colors.purple,
                icon: Icons.done_all_outlined,
                title: "Delivered",
                showdone: data['order_delivered']),
            const Divider(),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  orderplace(
                      t1: "Order Code",
                      t2: "Shipping Method",
                      d1: data['order_code'],
                      d2: data['shipping_methode']),
                  orderplace(
                      t1: "Order date",
                      t2: "Payment Method",
                      d1: intl.DateFormat()
                          .add_yMd()
                          .format((data['order_date'].toDate())),
                      d2: data['payment_methode']),
                  orderplace(
                      t1: "payment Status",
                      t2: "Delivery status",
                      d1: "Unpaid",
                      d2: 'Order Placed'),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Shipping Address".text.make(),
                            "${data['order_by_name']}".text.make(),
                            "${data['order_by_email']}".text.make(),
                            "${data['order_by_address']}".text.make(),
                            "${data['order_by_city']}".text.make(),
                            "${data['order_by_state']}".text.make(),
                            "${data['order_by_phone']}".text.make(),
                            "${data['order_by_postal']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              "Total Amount"
                                  .text
                                  .color(redColor)
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                              "${data['total_amount']}".text.make(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ).box.outerShadowMd.roundedSM.white.make(),
            ),
            10.heightBox,
            const Divider(),
            "Ordered Product".text.fontWeight(FontWeight.bold).make(),
            10.heightBox,
            ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(data['order'].length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            orderplace(
                              t1: data['order'][index]['title'],
                              t2: data['order'][index]['t_price'],
                              d1: "${data['order'][index]['qty']}X",
                              d2: "Refundable",
                            ),
                            Container(
                                height: 20,
                                width: 30,
                                color: Color(
                                  data['order'][index]['color'],
                                )),
                            const Divider()
                          ],
                        ),
                      );
                    }).toList())
                .box
                .shadowSm
                .white
                .margin(const EdgeInsets.only(bottom: 8))
                .make()
          ],
        ),
      ),
      
    );
  }
}
