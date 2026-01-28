import 'package:e_commerce_app/Const/list.dart';
import 'package:e_commerce_app/Const/toastmessage.dart';
import 'package:e_commerce_app/View/Auth_Screen/homeScreen.dart';
import 'package:e_commerce_app/View/Auth_Screen/signupScreen.dart';
import 'package:e_commerce_app/Widget_Common/Button.dart';
import 'package:e_commerce_app/Widget_Common/Custom_textformfild.dart';
import 'package:e_commerce_app/Widget_Common/applogowidget.dart';
import 'package:e_commerce_app/Widget_Common/containerback.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/controller/auth_controller.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var controller = Get.put(AuthController());

  bool loading = false;
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        bgchild: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Login to $appname".text.white.fontFamily(bold).size(18).make(),
            15.heightBox,
            Column(
              children: [
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
                  ispass: true,
                  hinttext: passwordhint,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgetpassword.text.make()),
                ),
                10.heightBox,
                ButtonScreen(
                  title: login,
                  loading: loading,
                  onpress: () async {
                    setState(() {
                      loading = true;
                    });

                    // controller.isloading(true);
                    await controller
                        .islogin(
                            context: context,
                            semail: emailcontroller.text,
                            spassword: passwordcontroller.text)
                        .then((value) {
                      if (value != null) {
                        Utils().toastMessage(toastmessage);
                        Get.to(const HomeScreenView());
                      }
                      setState(() {
                        loading = false;
                      });
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());

                      setState(() {
                        loading = false;
                      });

                      // controller.isloading(false);
                    });
                  },
                ).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    createaccount.text
                        .color(Colors.grey)
                        .fontWeight(FontWeight.w600)
                        .make(),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const SignupScreen());
                        },
                        child: signup.text.color(golden).make())
                  ],
                ),
                10.heightBox,
                loginwith.text.color(black).fontWeight(FontWeight.bold).make(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                radius: 25,
                                child: Image.asset(
                                  Sociallist[index],
                                  width: 30,
                                )),
                          )),
                )
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }
}
