import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/list.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';
import 'package:e_commerce_app/View/Category_navbar_Screen/itemdetail.dart';
import 'package:e_commerce_app/View/home_navbarScreen/seaching_screen.dart';
import 'package:e_commerce_app/Widget_Common/bodyButton.dart';
import 'package:e_commerce_app/Widget_Common/bottombutton.dart';
import 'package:e_commerce_app/controller/homecontroller.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:get/get.dart';

class HomeNavbarScreen extends StatefulWidget {
  const HomeNavbarScreen({super.key});

  @override
  State<HomeNavbarScreen> createState() => _HomeNavbarScreenState();
}

class _HomeNavbarScreenState extends State<HomeNavbarScreen> {
  var controller = Get.put(homecontroller());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      width: context.screenWidth,
      padding: const EdgeInsets.all(12),
      height: context.screenHeight,
      child: SafeArea(
          child: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 60,
          child: TextFormField(
            controller: controller.searchcontroller,
            decoration:  InputDecoration(
                fillColor: lightGrey,
                filled: true,
                hintText: searching,
                
                suffixIcon: const Icon(Icons.search).onTap(() {
                  if(controller.searchcontroller.text.isNotEmptyAndNotNull){
                    Get.to(()=>  SearchingScreen(title: controller.searchcontroller.text,));

                  }
                  
                 }),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                )
                
                ),
          ),
        ),
        5.heightBox,
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                VxSwiper.builder(
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    height: 150,
                    itemCount: sliderlists.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        sliderlists[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 5))
                          .make();
                    }),
                10.heightBox,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => bodybutton(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 2.5,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? todaydeal : flashsale,
                            onpress: () {}))),
                15.heightBox,
                VxSwiper.builder(
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    height: 150,
                    itemCount: secondsliderlists.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        secondsliderlists[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 5))
                          .make();
                    }),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      3,
                      (index) => bodybutton(
                            width: context.screenWidth / 3.5,
                            height: context.screenHeight * 0.15,
                            title: index == 0
                                ? topcatigory
                                : index == 1
                                    ? brand
                                    : topseller,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                          )),
                ),
                10.heightBox,
                Align(
                    alignment: Alignment.bottomLeft,
                    child: futurecategories.text
                        .fontWeight(FontWeight.bold)
                        .size(20)
                        .make()),
                10.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                          3,
                          (index) => Column(
                                children: [
                                  bottombutton(
                                      title: bootomtitlelist1[index],
                                      bottomimges: bottomimageslist1[index]),
                                  5.heightBox,
                                  bottombutton(
                                      title: bootomtitlelist2[index],
                                      bottomimges: bottomimageslist2[index])
                                ],
                              )).toList()),
                ),
                10.heightBox,
            StreamBuilder(
              stream: Firebaseservice.getfuturedproduct(),
              builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator(),);
              }
              if (snapshot.data!.docs.isEmpty){
                return "No futured product".text.makeCentered();

              }
              else{
                var futuredata = snapshot.data!.docs;
                return     Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        futureproduct.text.white
                            .size(18)
                            .fontWeight(FontWeight.bold)
                            .make(),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                futuredata.length,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          futuredata[index]['p_img'][0],
                                          width: 150,
                                          fit: BoxFit.fill,
                                        ),
                                        10.heightBox,
                                        "${futuredata[index]['p_name']}".text.gray600.make(),
                                        "${futuredata[index]['p_price']}".numCurrency
                                            .text
                                            .red600
                                            .size(18)
                                            .fontWeight(FontWeight.bold)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .white
                                        .rounded
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 5))
                                        .padding(const EdgeInsets.all(8))
                                        .make().onTap(() {
                                          Get.to(()=>  ItemDetailScreen(itemtitle: futuredata[index]['p_name'].toString(), data: futuredata[index]));
                                        })
                                        
                                        )
                          ),
                        ),
                      ],
                    ));
              }


            }),
                15.heightBox,
                VxSwiper.builder(
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    height: 150,
                    itemCount: secondsliderlists.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        secondsliderlists[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 5))
                          .make();
                    }),
                10.heightBox,
                StreamBuilder(
                    stream: Firebaseservice.getfuturedproduct(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var data = snapshot.data!.docs;
                        return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data[index]['p_img'][0],
                                    width: 250,
                                    height: 210,
                                    fit: BoxFit.fill,
                                  ),
                                  const Spacer(),
                                  10.heightBox,
                                  "${data[index]['p_name']}"
                                      .text
                                      .gray600
                                      .make(),
                                  "${data[index]['p_price']}"
                                      .text
                                      .red600
                                      .size(18)
                                      .fontWeight(FontWeight.bold)
                                      .make(),
                                ],
                              )
                                  .box
                                  .white
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .padding(const EdgeInsets.all(8))
                                  .roundedSM
                                  .make()
                                  .onTap(() {
                                    Get.put(Productcontrol());
                                Get.to(() => ItemDetailScreen(
                                    
                                    itemtitle: "${data[index]['p_name']}",
                                    data: data[index]));
                              });
                            });
                      }
                    })
              ],
            ),
          ),
        )
      ])),
    );
  }
}
