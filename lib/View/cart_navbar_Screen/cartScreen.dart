import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';
import 'package:e_commerce_app/Widget_Common/Button.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:get/get.dart';


class CartNavScreen extends StatelessWidget {
  const CartNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Cartcontroller());
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
       
      
        title: "Shopping cart".text.color(darkFontGrey).fontWeight(FontWeight.bold).make(),
      ),
      body: StreamBuilder(
        stream: Firebaseservice.getcart(uid: currentuser!.uid),
        builder:(
          
          BuildContext context, AsyncSnapshot<QuerySnapshot>   snapshot) {
          if(!snapshot.hasData){
            return const  Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: redColor,
              ),
            );
            
          }
          if(snapshot.data!.docs.isEmpty){
          return Center(
            child: "Cart is Empty".text.color(redColor).fontWeight(FontWeight.normal).make()
          );
          }
        else{
         var  data = snapshot.data!.docs;
        controller.carttotal(data);
          return
           Column(
        children: [
          Expanded(
            child:ListView.builder(
              itemCount: data.length,
              itemBuilder: ( BuildContext context , int index){
            return ListTile(
              leading: Image.network("${data[index]["img"]}"),
              title:"${data[index]['title']}".text.size(16).fontWeight(FontWeight.w600).make(),
              subtitle:"${data[index]['ptotal']}".numCurrency.text.color(redColor).fontWeight(FontWeight.bold).make(),
              trailing: IconButton(onPressed: (){
                Firebaseservice.deleteproduct(docuid: data[index].id);
              } , icon: const Icon(Icons.delete,color: redColor,))
                
            

            );
          })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Total".text.color(lightGrey).make(),
              Obx(()=>  "${controller.totalamount.value}".numCurrency.text.fontWeight(FontWeight.bold).color(redColor).make()),
              

            ],

          ).box.padding( const EdgeInsets.all(12)).color(Colors.grey.withOpacity(0.6)).width(context.screenWidth-60).roundedSM.make(),

          10.heightBox,
              SizedBox(
                width: context.screenWidth-60,
                child:ButtonScreen(title: "Proceed to  shipping" , onpress: (){
                 
                }) ,
              )
        ],
      );
        }

        })
    );
  }
}