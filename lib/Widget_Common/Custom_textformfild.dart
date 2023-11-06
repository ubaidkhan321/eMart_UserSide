import 'package:e_commerce_app/Const/const.dart';

  Widget componenttextflied({String? title,String? hinttext,Icon? icon,controller, ispass }){
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title!.text.align(TextAlign.start).red900.fontFamily(semibold).size(16).make(),
        Form(
          child: TextFormField(
            controller: controller,
            
          obscureText: ispass,
            decoration:  InputDecoration(
              fillColor: lightGrey,
              hintText: hinttext,
              hintStyle: const TextStyle(
                fontFamily: semibold,
                color: textfieldGrey,
              ),
              suffixIcon: icon, 
              filled: true,
              isDense: true,
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                )
                
              )
            ) ,
          ),
        ),
        10.heightBox,
      ],
    );
   
  }