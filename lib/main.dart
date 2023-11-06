import 'package:e_commerce_app/Const/colors.dart';
import 'package:e_commerce_app/View/Splash_Screen/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
       scaffoldBackgroundColor: Colors.transparent,
       appBarTheme: const AppBarTheme(
         iconTheme:  IconThemeData(
          color: fontGrey
        ),
        backgroundColor: Colors.transparent),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      

      home: const SplashhView(),
    );
  }
}

