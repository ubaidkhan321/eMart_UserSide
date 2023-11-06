import 'package:e_commerce_app/Const/const.dart';

Widget buttonScreen({textcolor,onclick,color,String? title,}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12)
    ),
    
    onPressed: 

      onclick
      
    , child: title!.text.color(textcolor).fontFamily(bold).make()
    );
 }


 class ButtonScreen extends StatelessWidget {
  final  String? title;
  final Color textcolor;
  
  final Color buttoncolor;
  final VoidCallback onpress;
  final bool loading;
 const   ButtonScreen({
  
  required this.title,
  
  required this.onpress,
  this.textcolor = const  Color(0xffffffff),
  this.buttoncolor = const Color.fromRGBO(230, 46, 4, 1),
  this.loading= false,
  super.key,

  
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 47,
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(12),
          color: buttoncolor,
    
        ), 
            child: Center(
              child: loading ? const  CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) :
              Text(title!,style: TextStyle(color: textcolor,fontWeight: FontWeight.bold),)
                 // title!.text.color(textcolor).fontWeight(FontWeight.bold).make(),
            ),
      ),
    );
  }
}