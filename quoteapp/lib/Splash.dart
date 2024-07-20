import 'dart:async';

import 'package:flutter/material.dart';

import 'Menue.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
  Timer(Duration(seconds: 2), () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Menue(),));
  });

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           Center(child: Image.asset("assets/images/quoteverse.png",height: 180,width: 180,)),
            SizedBox(height: 10,),
            CircularProgressIndicator(color: Colors.white,strokeWidth: 2),
          ],
        ),
      ),
    );
  }
}
