
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quoteapp/Menue.dart';
class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {

  var _LOGIN = true;
  var _UID;
  var _DB;
 
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    _UID = FirebaseAuth.instance.currentUser!.uid.toString();
    _DB = FirebaseDatabase.instance.ref("USERS").child(_UID).child("Saved");


    return SafeArea(
      child: Scaffold(
       
        appBar: AppBar(

          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(Icons.info,color: Colors.white,),
                ),
              ],
            ),


          ],
          leading: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Menue(),));}, icon:const Icon(Icons.arrow_back_rounded,color: Colors.white,)),
          backgroundColor: Colors.black,
          title: Text("Saved" ,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        ),
        body: Column(
          children: [


            Expanded(
              child: FirebaseAnimatedList(
                query: _DB,
                itemBuilder: (context, snapshot, animation, index) {
                   if (index % 3 == 2) {
                             }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        onTap: (){
                          Clipboard.setData(ClipboardData(text: snapshot.value.toString()));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copied Sucessfull",)));
                        },
                        title: Text(snapshot.value.toString()),
                        trailing: Icon(Icons.copy),
                        leading: Image.network("https://res.cloudinary.com/dghloo9lv/image/upload/v1687444193/paper_kddgbx.png"),


                      ),
                    ),
                  );
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
