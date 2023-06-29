import 'package:flutter/material.dart';

import '../utils/generalDrawer.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text("FAQ",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: const [
        ],
      
      ),
      drawer:const GeneralDrawer(),
      body: Container(
        color:Colors.white,
        child:const Center(
          child:Text("FAQ")
        )
      ),
    );
 
  }
}
