import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/list.dart';
import 'package:e_commerce_app/View/Category_navbar_Screen/category_Detail.dart';
import 'package:e_commerce_app/View/Profile_navbar%20_Screen/component/exitdialogbox.dart';
import 'package:e_commerce_app/Widget_Common/containerback.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
   var controller = Get.put(Productcontrol());
  
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      bgchild: WillPopScope(
        onWillPop: ()async{
          showDialog(
            barrierDismissible: false,
            context: context, builder: (context)=>exitsdialog(context));
          return false;
        },
        child: Scaffold(
          
          appBar: AppBar(
            title: categories.text.white.fontWeight(FontWeight.bold).make(),
          ),
          body: Container(
            padding:const EdgeInsets.all(12),
            
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200) , itemBuilder:(context,index){
              return SingleChildScrollView(
                child: Column(
                  
                   
                      children: [
                         Image.asset(categoriesimages[index],width: 210,height: 120,fit: BoxFit.cover,),
                      
                   categoriesList[index].text.gray800.align(TextAlign.center).make(),
              
                      ],
                   ).box.outerShadow.clip(Clip.antiAlias).white.rounded.make().onTap(() {
      
                     controller.getproductcategory(categoriesList[index]);
                    Get.to(()=> CategoryDetailScreen(ctitle: categoriesList[index]));
                   })
              );
            } ),
          ),
        ),
      )
      
    );
        
        
       
  }
}