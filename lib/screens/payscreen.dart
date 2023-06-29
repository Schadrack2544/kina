import 'package:flutter/material.dart';

import '../utils/generalDrawer.dart';

class Payscreen extends StatefulWidget {
  const Payscreen({super.key});

  @override
  State<Payscreen> createState() => _PayscreenState();
}

class _PayscreenState extends State<Payscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
             Navigator.of(context).pop();
        }, icon:const Icon(Icons.arrow_back)),
        title:const Text("Payment"),
      ),
      body:const Center(child:Text("Pay Screen"),),
      drawer: const GeneralDrawer(),
    );
  }
}