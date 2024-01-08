import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Const/const.dart';
import 'package:e_commerce_app/Services/firebase.services.dart';

class WishLishScreen extends StatelessWidget {
  const WishLishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Wishlist".text.size(16).make(),
      ),
      body: StreamBuilder(
        stream: Firebaseservice.getwishlist(),
        builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator());
        }
        else if(snapshot.data!.docs.isEmpty){
          return "No favourite yet".text.fontWeight(FontWeight.bold).size(16).makeCentered();
        }
        else{
          var data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext  context, index){
            return  Column(
              children: [
                ListTile(
                                      leading:
                                          Image.network("${data[index]["p_img"][0]}"),
                                      title: "${data[index]['p_name']}"
                                          .text
                                          .size(16)
                                          .fontWeight(FontWeight.w600)
                                          .make(),
                                      subtitle: "${data[index]['p_price']}"
                                          .numCurrency
                                          .text
                                          .color(redColor)
                                          .fontWeight(FontWeight.bold)
                                          .make(),
                                      trailing: IconButton(
                                          onPressed: () async {
                                            await firestore.collection(productcollection).doc(data[index].id).set({
                                              'p_Wishlist': FieldValue.arrayRemove([currentuser!.uid])



                                            },SetOptions(merge: true));
                                           
                                           
                                          },
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: redColor,
                                          ))
                                          ),
              ],
            );
            
          });
          

        }

      }),
    );
  }
}