
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quoteapp/Rooms/AuthRoom/_login.dart';
import 'package:quoteapp/Rooms/Bookmark.dart';
import 'package:quoteapp/Rooms/Funny.dart';
import 'package:quoteapp/Rooms/Motivation.dart';
import 'package:quoteapp/Rooms/Success.dart';
import 'Rooms/Quotes.dart';
class Menue extends StatefulWidget {
  const Menue({super.key});

  @override
  State<Menue> createState() => _MenueState();
}

class _MenueState extends State<Menue> {
  var _LOGIN = true;
  var _UID;
  var _DB;


  void isLogin(){

    final user = FirebaseAuth.instance.currentUser;
    try{
      if(user!=null){
        _LOGIN = false;
      }else{
        _LOGIN = true;
        _UID = FirebaseAuth.instance.currentUser!.uid.toString();
        _DB = FirebaseDatabase.instance.ref("USERS").child(_UID).child("Saved");
      }


    }catch(value){

    }
  }

  @override
  void initState() {
    isLogin();
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isLogin();

    return SafeArea(
        child: WillPopScope(
        onWillPop: () async{
          return false;
        },
          child: Scaffold(

            appBar: AppBar(

              automaticallyImplyLeading: false,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap:(){

                            if(_LOGIN){
                              showDialog(context: context, builder:  (context) {

                                return AlertDialog(
                                  icon: Icon(Icons.warning_outlined,color: Colors.red,size: 30,),
                                  content: Text("Go to BookMark and First Setup your Account. Than Save these Quotes for Lifetime. Keep in Mind "
                                      "Your All Details are 100% Safe And Secure so Don't Worry About this."),
                                  title:Text("Login First!") ,
                                  actions: [
                                    ElevatedButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LOGINROOM(),));
                                    }, child: Text("Login/Signup"))
                                  ],
                                );
                              },);
                            }else{
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BookMark(),));
                            }

                          },
                          child: Icon(Icons.bookmark_added,color: Colors.white,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(

                          onTap: (){

                          },
                          child: Icon(Icons.star_rate,color: Colors.white,)),
                    ),
                  ],
                ),


              ],
              backgroundColor: Colors.black,
              title: Text("Categories" ,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              
              child: SingleChildScrollView(
                child: Column(
                  children: [


                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       InkWell(


                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder:(context) => const Motivation(), ));
                         },
                         child: Container(
                           height: MediaQuery.of(context).size.height *0.2,
                           width: MediaQuery.of(context).size.width *0.4,
                           decoration: BoxDecoration(
                               color: Colors.blue.shade700,
                               borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("Motivation",style: TextStyle(color: Colors.white,fontSize: 22),),
                                SizedBox(height: 10,),
                                Image.network("https://res.cloudinary.com/dghloo9lv/image/upload/v1687520506/motivated_my092z.png",height: 60,width: 60,)


                             ],
                           )

                         ),
                       ),
                       InkWell(

                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) =>const Funny(),));
                         },
                         child: Container(
                           height: MediaQuery.of(context).size.height *0.2,
                           width: MediaQuery.of(context).size.width *0.4,
                           decoration: BoxDecoration(
                               color: Colors.amber.shade700,
                               borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))                     ),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("Funny",style: TextStyle(color: Colors.white,fontSize: 22),),
                                 SizedBox(height: 10,),
                                 Image.network("https://res.cloudinary.com/dghloo9lv/image/upload/v1687521088/crazy_nkztuz.png",height: 60,width: 60,)


                               ],
                             )
                         ),
                       )
                     ],
                   ),

                    SizedBox(height: 18,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap:(){

                            const Quotes();
            },
                          child: InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Quotes(),));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height *0.2,
                              width: MediaQuery.of(context).size.width *0.4,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent.shade100,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                              ),
                              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Quotes",style: TextStyle(color: Colors.white,fontSize: 22),),
                  SizedBox(height: 10,),
                  Image.network("https://res.cloudinary.com/dghloo9lv/image/upload/v1687527211/quote_anro5i.png",height: 60,width: 60,)


                ],
            )
                            ),
                          ),
                        ),
                        InkWell(
                          onTap:(){

                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Success(),));
                        },
                          child: Container(
                            height: MediaQuery.of(context).size.height *0.2,
                            width: MediaQuery.of(context).size.width *0.4,
                            decoration: BoxDecoration(
                                color: Colors.green ,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                            ),
                            child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Success",style: TextStyle(color: Colors.white,fontSize: 22),),
                              SizedBox(height: 10,),
                              Image.network("https://res.cloudinary.com/dghloo9lv/image/upload/v1687521433/man_gjk29u.png",height: 60,width: 60,)


                            ],
                          )
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
    ),
        ));
  }
}
