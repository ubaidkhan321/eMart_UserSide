import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';
import 'package:e_commerce_app/View/chat_Screen/chat_screen.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Message".text.size(16).make(),
      ),
      body: StreamBuilder(
        stream: Firebaseservice.getallmessage(),
        builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator());
        }
        else if(snapshot.data!.docs.isEmpty){
          return "No Message yet".text.fontWeight(FontWeight.bold).size(16).makeCentered();
        }
        else{
           var data = snapshot.data!.docs;
           return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.length ,
                  itemBuilder:(context, snapshot){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          onTap: (){
                            Get.to(()=> const ChatvViewSceen(),
                            arguments: [
                              data[snapshot]['friend_name'],
                              data[snapshot]['to_id'],
                            
                            ]
                            
                            );
                          },
                          leading: const CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.person,color: redColor,size: 40,),
                          ),
                          title: "${data[snapshot]['friend_name']}".text.make(),
                          subtitle: "${data[snapshot]['last_msg']}".text.make(),
                        ),
                      ),
                    );

                  } ))
            ],
           );
        }

      }),
    );
  }
}