
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';
import 'package:e_commerce_app/View/Category_navbar_Screen/itemdetail.dart';
import 'package:e_commerce_app/Widget_Common/containerback.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:get/get.dart';

class CategoryDetailScreen extends StatelessWidget {
   final String? ctitle;
  const CategoryDetailScreen({super.key,
  required this.ctitle});

  @override
  Widget build(BuildContext context) {
    print(Colors.white.value);
    var controller = Get.find<Productcontrol>();
    return bgWidget(
      bgchild: Scaffold(
        appBar: AppBar(
          title: ctitle!.text.white.fontWeight(FontWeight.bold).make()
          
        ),
        body: StreamBuilder(
          stream: Firebaseservice.getproduct(ctitle),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(color: Colors.red,),
            );
          }else if(snapshot.data!.docs.isEmpty){
            return Center(
              child: "No product".text.color(darkFontGrey).make(),
            );
          }
            
          else{
            var data = snapshot.data!.docs;
            return Container(
          
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(controller.subcat.length, (index) => "${controller.subcat[index]}".text.black.makeCentered().box.white.size(100, 40).margin( const EdgeInsets.all(4)).roundedSM.make())
                  ),
                ),
                10.heightBox,
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250,crossAxisSpacing: 8,mainAxisSpacing: 8),
                     itemBuilder: (context,index){
                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                          data[index]["p_img"][0],
                                            width: 150,
                                            height: 170,
                                            
                                            fit: BoxFit.fill,
                                          ),
                                           const Spacer(),
                                          10.heightBox,
                                          "${data[index]["p_name"]}".text.gray600.make(),
                                          "${data[index]["p_price"]}".numCurrencyWithLocale()
                                              .text
                                              .red600
                                              .size(18)
                                              .fontWeight(FontWeight.bold)
                                              .make(),
                                        ],
                                      
                        ).box.white.margin( const EdgeInsets.symmetric(horizontal: 4)).padding( const EdgeInsets.all(8)).roundedSM.make().onTap(() {
                            Get.to(  ItemDetailScreen(itemtitle: "${data[index]["p_name"]}",data: data[index],));
                        });
                     }),
                )
              ],
            ),
          
          
        );
        
          }
        })


      )
    );
  }
}