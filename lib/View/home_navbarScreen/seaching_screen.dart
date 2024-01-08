import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';
import 'package:e_commerce_app/View/Category_navbar_Screen/itemdetail.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingScreen extends StatelessWidget {
  final String? title;
  const SearchingScreen({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        
        title: "$title".text.color(fontGrey).fontWeight(FontWeight.bold).size(18).make() ,
      ),
      body: FutureBuilder(
        future: Firebaseservice.searchproduct(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
        return const  Center(
            child: CircularProgressIndicator(strokeWidth: 2,color: redColor,),
          );
        
        }
        else if(snapshot.data!.docs.isEmpty){
          return "No product".text.make();

        }
        else{
          var data = snapshot.data!.docs;

         // Filter Data...................................................................................................................................
        
          var filterdata = data.where((element)=> element['p_name'].toString().toLowerCase().contains(title!.toLowerCase())).toList();

          
          return GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 300,crossAxisSpacing: 8,mainAxisSpacing: 8),
         
          children: filterdata.mapIndexed((currentValue, index) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(filterdata[index]['p_img'][0],width: 200,height: 200,fit: BoxFit.cover,),
              10.heightBox,
              "${filterdata[index]['p_name']}".text.fontWeight(FontWeight.bold).make(),
              "${filterdata[index]['p_price']}".numCurrency.text.color(redColor).fontWeight(FontWeight.bold).make(),
            ],

          
          ).box.white.shadowSm.roundedSM.margin( const EdgeInsets.all(8)).padding( const EdgeInsets.symmetric(horizontal: 8)).make().onTap(() {
            Get.put(Productcontrol());
            Get.to(()=> ItemDetailScreen(itemtitle: filterdata[index]['p_name'], data: filterdata[index]));
            
          })
          ).toList(),);
        }
      })
    );
  }
}