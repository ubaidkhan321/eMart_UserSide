import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/list.dart';
import 'package:e_commerce_app/Widget_Common/bodyButton.dart';
import 'package:e_commerce_app/Widget_Common/bottombutton.dart';

class HomeNavbarScreen extends StatefulWidget {
  const HomeNavbarScreen({super.key});

  @override
  State<HomeNavbarScreen> createState() => _HomeNavbarScreenState();
}

class _HomeNavbarScreenState extends State<HomeNavbarScreen> {
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
            decoration: const InputDecoration(
                fillColor: lightGrey,
                filled: true,
                hintText: searching,
                suffixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                )),
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
                Container(
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
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP1,
                                          width: 150,
                                          fit: BoxFit.fill,
                                        ),
                                        10.heightBox,
                                        "laptop 64/128 GB".text.gray600.make(),
                                        "\$600"
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
                                        .make()),
                          ),
                        ),
                      ],
                    )),
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
                GridView.builder(
                  physics:const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300,),
                    itemBuilder: (context, index) {
                      return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgPi1,
                                          width: 150,
                                          fit: BoxFit.fill,
                                        ),
                                         const Spacer(),
                                        10.heightBox,
                                        "laptop 64/128 GB".text.gray600.make(),
                                        "\$600"
                                            .text
                                            .red600
                                            .size(18)
                                            .fontWeight(FontWeight.bold)
                                            .make(),
                                      ],
                                    
                      ).box.white.margin( const EdgeInsets.symmetric(horizontal: 4)).padding( const EdgeInsets.all(8)).roundedSM.make();
                    })
              ],
            ),
          ),
        )
      ])),
    );
  }
}
