 import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/list.dart';
import 'package:e_commerce_app/Const/toastmessage.dart';
import 'package:e_commerce_app/View/chat_Screen/chat_screen.dart';
import 'package:e_commerce_app/Widget_Common/Button.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:get/get.dart';

 class ItemDetailScreen extends StatelessWidget {
 final String? itemtitle;
  final dynamic data;
  final bool loading = false;
  const ItemDetailScreen({super.key,
  required this.itemtitle,
  required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Productcontrol>();
    //print(Colors.red.value);
    return  WillPopScope(
      onWillPop: () async {
        controller.returnvalur();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            controller.returnvalur();
            Get.back();
            
          }, icon: const Icon(Icons.arrow_back)),
          title: itemtitle!.text.color(darkFontGrey).fontWeight(FontWeight.bold).make(),
          backgroundColor: lightGrey,
          actions: [
            // Provide icons color from main.dart
            // set color in ThemeData then  set Icon color in main.dart
            IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
            Obx(()=>
               IconButton(onPressed: (){
            
               if(controller.isfav.value) {
                controller.removefromwishlist(docid: data.id);
               }
               else{
                controller.addfromwishlist(docid: data.id);
               }
              }, icon:  Icon(Icons.favorite_outlined,color: controller.isfav.value ? redColor : darkFontGrey,)),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      
    
    
                      VxSwiper.builder(
                        autoPlay: true,
                        aspectRatio: 16/9,
                        height: 250,
                        viewportFraction: 1.0,
                        itemCount: data["p_img"].length,
                       itemBuilder: (context,index){
                        return Image.network(data["p_img"][index],width: double.infinity,fit: BoxFit.cover,);
                       }),
                      
                       10.heightBox,
                       itemtitle!.text.color(darkFontGrey).fontWeight(FontWeight.bold).size(16).make(),
                      
                       VxRating(
                        isSelectable: false,
                        value: double.parse(data['p_rating']),
                        onRatingUpdate: (value){},
                        size: 25,
                       maxRating: 5,
                        count: 5,
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                       ),
                       "${data["p_price"]}".numCurrency.text.size(20).color(redColor).fontWeight(FontWeight.bold).make(),
                      10.heightBox,
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.make(),
                            "${data["p_seller"]}".text.fontWeight(FontWeight.bold).size(18).make()
                          ],
                          ),
                          CircleAvatar(
                            child: const Icon(Icons.message_rounded,color: darkFontGrey,).onTap(() {
                              Get.to(()=> const ChatvViewSceen(),
                              //argument..................................................................................
                              arguments: [data['p_seller'],data['vendor_id']]);
                             })
                          )
                        ],
                       ).box.color(textfieldGrey).padding( const EdgeInsets.all(8)).make(),
                        20.heightBox,
                       Obx(()=>
                          Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 100,
                                child:  "Color".text.color(darkFontGrey).make(),
                                ),
                                Row(
                                  children: List.generate(
                                   data["p_color"].length,
                                    
                                  (index) => Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      
                                      VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Color(data["p_color"][index]).withOpacity(0.5))
                                    
                                    .margin(const EdgeInsets.symmetric(horizontal: 6)).make().onTap(() {
                                      controller.changecolor(index);
                                    }),
                                    Visibility(
                                      visible: index == controller.colorindex.value,
                                      child: const    Icon(Icons.check,color: whiteColor,size: 20,))
                                
                                    ],
                                  )
                                  ),
                                )
                       
                              ],
                            ).paddingAll(8),
                          
                             Row(
                                children: [
                                  SizedBox(width: 100,
                                  child:  "Quantity".text.color(darkFontGrey).make(),
                                  ),
                                 
                                    Row(
                                      children: [
                                        IconButton(onPressed: (){
                                          controller.decressquantity();
                                          controller.calculateprice(int.parse(data["p_price"]));
                                         
                                        }, icon: const Icon(Icons.remove)),
                                        controller.productcount.value.text.size(16).color(darkFontGrey).fontWeight(FontWeight.bold).make(),
                                        IconButton(onPressed: (){
                                           controller.incresquantity(int.parse(data["p_qunatity"]));
                                           controller.calculateprice(int.parse(data["p_price"]));
                                        }, icon: const Icon(Icons.add)),
                                        "${data['p_qunatity']}".text.color(darkFontGrey).make()
                                                            
                                      ]
                                    ),
                                
                                  
                            
                                ],
                            
                                
                              ).box.white.padding( const EdgeInsets.all(8)).make(),
                           
                       
                            Row(
                                  children: [
                                    SizedBox( 
                                      width: 100,
                                      child: "Total".text.color(fontGrey).make() ,
                                    ),
                                    "${controller.totalprice.value}".numCurrency.text.color(redColor).size(18).fontWeight(FontWeight.bold).make()
                                   
                                  ],
                                ).box.white.padding( const EdgeInsets.all(8)).make(),
                       
                               
                            
                          ],
                          
                         ).box.white.shadowSm.make(),
                       ),
    
                        10.heightBox,
                              "Description:".text.color(darkFontGrey).make(),
                               10.heightBox,
                              "${data["p_dis"]}".text.color(fontGrey).make(),
                              10.heightBox,
                              
                     ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        itemdetailList.length,
                         (index) => ListTile(
                        title: itemdetailList[index].text.color(black).size(18).make(),
                        trailing:  const Icon(Icons.arrow_forward),
                      ).box.white.make())
                     ),
                        
                    ],
                  ),
                ),
              )),
           
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: productlike.text.white.fontWeight(FontWeight.w500).color(fontGrey).make(),
               ),
           const SizedBox(height: 5,),
          ButtonScreen(
            loading: loading,
            title: "Add to card", onpress: (){
              if(controller.productcount.value > 0) {
                 controller.addcart(
                title: data['p_name'],
                procolor: data['p_color'][controller.colorindex.value],
                img: data['p_img'][0],
                sellername: data['p_seller'],
                pquan:controller.productcount.value,
                venderid: data['vendor_id'],
                ptotal: controller.totalprice.value, );
                Utils().toastMessage("Added to Cart");
                

              }
              else{
                Utils().toastMessage("product can't be 0");
              }
    
             
            })
          ],
        )
      ),
    );
  }
}