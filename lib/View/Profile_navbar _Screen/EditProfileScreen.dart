 import 'dart:io';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Const/toastmessage.dart';
import 'package:e_commerce_app/Widget_Common/Button.dart';
import 'package:e_commerce_app/Widget_Common/Custom_textformfild.dart';
import 'package:e_commerce_app/Widget_Common/containerback.dart';
import 'package:e_commerce_app/controller/ProfileimagerPick.dart';
import 'package:get/get.dart';

class Editprofile extends StatelessWidget {
final  dynamic data;
 const  Editprofile({super.key,
        required this.data,
  });

 

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileImagePicker>();
    
    return bgWidget(
      bgchild: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Obx(()=>
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  //if image and controller is empty...
           data['imageurl'] == '' &&   controller.imgepath.isEmpty ?  
             Image.asset(imgProfile2,width: 70,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
             //if image  is not empty and controller is empty
             : data['imageurl']!= '' && controller.imgepath.isEmpty
             ? Image.network(data['imageurl'], width: 70,
                      fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                    //if both is empty.....
              : Image.file(File(controller.imgepath.value),
                        width: 70,
                      fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.heightBox,
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: ButtonScreen(title: "Edit", onpress: (){
                      controller.changeimage();
                    })),
                    
                  10.heightBox,
                   const Divider(),
                   componenttextflied(title: email,hinttext: namehint,ispass: false,controller: controller.email),
                   componenttextflied(title: name,hinttext: namehint,ispass: false,controller: controller.name),
                   componenttextflied(title: password,hinttext: passwordhint,ispass: true,controller: controller.password),
                   componenttextflied(title: checkpassword,hinttext: passwordhint,ispass: true,controller: controller.oldpassword),
                   
                   20.heightBox,
                  controller.isloading.value ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor),): ButtonScreen(title: "Save", onpress:  ()async{
                    controller.isloading(true);
                    //if user  want to change profile..
                    if(controller.imgepath.value.isNotEmpty){
                            await controller.uploadImage();
                    }
                    //if user not  want to change profile..
                    else{
                      controller.profileimagelink = data['imageurl'];
                    }
                     if (controller.password.text == data['password'])
                     {
                          await controller.changepassword(
                            email: data['email'],
                            password: controller.password.text,
                            retypassword: controller.oldpassword.text,

                          );


                       await controller.updatedata(
                      imgurl: controller.profileimagelink,
                      email: controller.email.text,
                       name: controller.name.text,
                       password: controller.oldpassword.text,
                        
                      

                      
                    );
                    Utils().toastMessage("Update Profile");
                    controller.isloading(false);
                    controller.email.clear();
                    controller.name.clear();
                    controller.password.clear();
                    controller.oldpassword.clear();

                     }
                     else{
                      Utils().toastMessage('Wrong password');
                      controller.isloading(false);
                     }
                   
                    
                    
                    
                    
                    
                    
                   })
                  
                ],
              ).box.white.padding( const EdgeInsets.all(16)).roundedSM.margin( const EdgeInsets.only(left: 12,top: 50,right: 12)).shadowSm.make(),
            ),
            
          ),
          
        ),

      )
    );
  }
}