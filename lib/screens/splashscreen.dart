import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kina/screens/loginscreen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
      void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: ((context) =>  LoginScreen()))));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color:const Color.fromARGB(255,215,45,92),
      child:  Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
        children: [
        Image.asset(
          "assets/kina_logo.png",
          width:80,
          height:80,
        ),
         const SizedBox(height:5,),
          SizedBox(
            width:MediaQuery.of(context).size.width*0.6,
            child: const LinearProgressIndicator(
              color:Colors.white,
              value:null
            ),
          )
        ],
      ),),
    );
  }
}
