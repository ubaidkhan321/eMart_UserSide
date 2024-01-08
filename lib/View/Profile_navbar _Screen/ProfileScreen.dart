

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/list.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';
import 'package:e_commerce_app/View/Auth_Screen/LoginScreen.dart';
import 'package:e_commerce_app/View/Profile_navbar%20_Screen/EditProfileScreen.dart';
import 'package:e_commerce_app/View/Profile_navbar%20_Screen/component/profiledetail.dart';
import 'package:e_commerce_app/View/order_screen/message_on_profile.dart';
import 'package:e_commerce_app/View/order_screen/order_on_profile.dart';
import 'package:e_commerce_app/View/order_screen/wishlist_on_profile.dart';
import 'package:e_commerce_app/Widget_Common/containerback.dart';
import 'package:e_commerce_app/controller/ProfileimagerPick.dart';
import 'package:e_commerce_app/controller/auth_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var controller = Get.put(ProfileImagePicker());
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      bgchild: Scaffold(
        body: StreamBuilder(
          
          stream: Firebaseservice.getuser(currentuser!.uid),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){


            if(snapshot.connectionState == ConnectionState.waiting)
               return Text("Waiting");
                if(!snapshot.hasData){
                  return VxShimmer(
                        primaryColor: Colors.grey.shade700,
                        secondaryColor: Colors.grey.shade100,
                        child: Column(
                          children: [
                            ListTile(
                                title: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.grey,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.grey,
                                ),
                                leading: Container(
                                    height: 20, width: 89, color: const Color.fromARGB(255, 97, 61, 61)))
                          ],
                        ));
                }
                else{
                  
                
                   var data = snapshot.data!.docs[0];
                 
                
                      return
                            SafeArea(
          child: Column(
            
            children: [
             
             Padding(
               padding:const  EdgeInsets.all(10),
               child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.edit,color: Colors.white,)).onTap(() {
                    controller.name.text =  data['name'];
                    controller.email.text = data['email'];
                    Get.to(()=>  Editprofile( data: data,));
                  })
             ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 8.0),
                  child: Row(
                    children: [
                            data['imageurl']== '' ?
                      Image.asset(imgProfile2,width: 50,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make():
                      Image.network(data['imageurl'],width: 50,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                      "${data['name']}".text.white.make(),
                        "${data['email']}".text.white.make(),
                      ],
                    ),
                
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              
                              color: whiteColor,
                            ),
                            
                            
                        
                          ),
                          onPressed: (){
                            Get.put(AuthController()).signout(context: context);
                            Get.offAll(()=> const LoginView());
                          }, child: logout.text.white.makeCentered()),
                    ),
                    
                    ],
                  ),
                ),
              ),
               10.heightBox,
               FutureBuilder(
                future: Firebaseservice.getcount(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator(),);

                  }
                  else{
                    var countdata = snapshot.data;
                    return  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  children: [
                    profiledetail(count: countdata[0].toString(),title: "your cart",width: context.screenWidth/3.4),
                    profiledetail(count: countdata[1].toString(),title: "your wishList",width: context.screenWidth/3.4),
                    profiledetail(count: countdata[2].toString(),title: "your Order",width: context.screenWidth/3.4),
                  ],
                 ),
               );
                  }

               }),
              
               
               ListView.separated(
                
                shrinkWrap: true,
                 separatorBuilder: (context,index){
                  return const Divider();
                 },
                 itemCount: profileiconlist.length,
                itemBuilder: ( BuildContext context, int index){
                  return ListTile(
                    onTap: (){
                    switch (index) {
                      case 0:
                      Get.to(()=> const  OrderScreen());
                       break;
                       case 1:
                        Get.to(()=> const  WishLishScreen());
                       break;
                       case 2 :
                        Get.to(()=> const  MessageScreen());
                       break;
                      
                     
                    }

                    },
                    title: profilelist[index].text.color(darkFontGrey).make(),
                    trailing: Image.asset(profileiconlist[index],width: 22,)
                  );

                }, ).box.white.rounded.margin( const EdgeInsets.all(10)).shadowSm.padding( const EdgeInsets.symmetric(horizontal: 16)).make().box.color(redColor).make()

            ],
          ),
        );

                        

                 
                 
                }

        })
      )
    );
      
       
    
  }
}