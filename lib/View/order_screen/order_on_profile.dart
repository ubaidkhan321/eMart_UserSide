import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';
import 'package:e_commerce_app/View/order_screen/order_detail.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Order".text.size(16).make(),
      ),
      body: StreamBuilder(
        stream: Firebaseservice.getallorder(),
        builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator());
        }
        else if(snapshot.data!.docs.isEmpty){
          return "No yet order".text.fontWeight(FontWeight.bold).size(16).makeCentered();
        }
        else{
          var data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, snapshot){
            return ListTile(
              leading: "${snapshot+1}".text.xl.color(darkFontGrey).make(),
              title: "${data[snapshot]['order_code']}".text.color(redColor).make(),
              subtitle: data[snapshot]['total_amount'].toString().text.make(),
              trailing: IconButton(onPressed: (){
                Get.to( OrderDetailScreen(data: data[snapshot],));
              }, icon: const Icon(Icons.arrow_forward_ios_outlined)),

            );
          });
        }

      }),
    );
  }
}