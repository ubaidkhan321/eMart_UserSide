import 'package:e_commerce_app/Const/const.dart';
//import 'package:e_commerce_app/Const/strings.dart';
import 'package:e_commerce_app/View/Auth_Screen/LoginScreen.dart';
import 'package:e_commerce_app/View/ClassScreen/signupcheckbutton.dart';
import 'package:e_commerce_app/Widget_Common/Button.dart';
import 'package:e_commerce_app/Widget_Common/Custom_textformfild.dart';
import 'package:e_commerce_app/Widget_Common/applogowidget.dart';
import 'package:e_commerce_app/Widget_Common/containerback.dart';
import 'package:e_commerce_app/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

    final CheckButtonClass ischeckcontroller = Get.put(CheckButtonClass());
    
    var controller = Get.put(AuthController());

    bool loading = false;
    

   var namecontroller = TextEditingController();
   var emailcontroller = TextEditingController();
   var passwordcontroller = TextEditingController();
   var confrompasswordcontroller = TextEditingController();
   

      
  @override
  Widget build(BuildContext context) {
    print("object");
    return bgWidget(
      bgchild: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                (context.screenHeight *0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Wellcome to $appname".text.white.fontFamily(bold).size(18).make(),
                15.heightBox,
                
                Column(
                  
                   children: [
                   
                      
                     componenttextflied(
                        
                        controller: namecontroller,
                        icon: const Icon(Icons.person),
                        title: name,
                        
                      ispass: false,
                        hinttext: namehint,
                        ),
                        
                    
                    componenttextflied(
                      controller: emailcontroller,
                      icon: const Icon(Icons.email),
                      title: email,
                      ispass: false,
                  
                      hinttext: hintemail),
                      componenttextflied(
                        controller: passwordcontroller,
                        icon: const Icon(Icons.visibility_off_rounded),
                        title: password,
                        hinttext: passwordhint,
                      ispass: true
                        
                        
                      ),
                      componenttextflied(
                        controller: confrompasswordcontroller,
                       icon: const Icon(Icons.visibility_off_rounded),
                        title: conformpassword,
                        hinttext: passwordhint,
                        ispass: true
                      
                        
                      ),
                      
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){},
                         child: forgetpassword.text.make()),
                      ),
                     
                      5.heightBox,
                     
                         Obx(()=>
                           Row(
                            children: [
                             
                              InkWell(
                                child: Checkbox(
                                  
                                  activeColor: Colors.red,
                                  checkColor: Colors.white,
                                  value: ischeckcontroller.checkvalue.value, 
                                   onChanged: (value){
                                  ischeckcontroller.changestatebutton(value);
                                   
                                  
                                  
                                                        
                                 
                                    
                                }),
                              ),
                         
                              
                              10.widthBox,
                             Expanded(
                               child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'I Agree to this ',
                                      style: TextStyle(
                                        color: Colors.grey,)
                                    ),
                                    TextSpan(
                                      text: termcondition,
                                      style: TextStyle(
                                        color: Colors.red
                                      )
                             
                                    ),
                                     TextSpan(
                                      text: ' & ',
                                      style: TextStyle(
                                        color: Colors.red
                                      )
                             
                                    ),
                                    
                                     TextSpan(
                                      text: privacy,
                                      style: TextStyle(
                                        color: Colors.red
                                      )
                             
                                    ),
                             
                                  ]
                                )),
                             )
                            ],
                                                 ),
                         ),
                      
                       10.heightBox,
                      
                     
                      
                     
                    
                      
                     

                      
                         Obx(()=>
                            ButtonScreen(
                              loading: loading,
                            buttoncolor: ischeckcontroller.checkvalue == true ? Colors.red : Colors.grey,
                            textcolor: ischeckcontroller.checkvalue == true ? Colors.white : Colors.grey ,
                            title: signup, onpress: ()async{
                              setState(() {
                                loading = true;
                              });
                            if(ischeckcontroller.checkvalue.value!= false){
                              print("build");
                              try{
                                
                                await controller.signup(context: context,email: emailcontroller.text,password: passwordcontroller.text).then((value){
                                   return controller.stordata(
                                    email: emailcontroller.text,password: passwordcontroller.text,name: namecontroller.text
                                   );
                                }).then((value) {
                                  setState(() {
                                    loading = false;
                                  });
                                  VxToast.show(context, msg: toastmessage);
                                  Get.offAll(()=> const  LoginView());
                                               
                                });
                                               
                              }catch (e){
                                VxToast.show(context, msg: e.toString());
                                setState(() {
                                  loading = false;
                                });
                                 
                                               
                              }
                            }
                                                 },) .box.width(context.screenWidth-50).make(),
                         ),
                      
                     
                     
                      10.heightBox,
                 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            haveaccount.text.color(Colors.grey).fontWeight(FontWeight.w600).make(),
                      TextButton(onPressed: (){
                        Get.back();
                      }, child: login.text.color(golden).make())
          
                        ],
                      ),
                     
                    
                   ],
          
                ).box.white.rounded.padding( const EdgeInsets.all(16)).width(context.screenWidth- 70).shadowSm.make()
              ],
            ),
          ),
        ),
      ));
  }
}