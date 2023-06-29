import 'package:flutter/material.dart';

import '../utils/generalDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      drawer:const GeneralDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text("Kina Games",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: const [
        ],
      
      ),
      body: Container(
         child:const Center(
          child:Text("Kina")
        )
      )
    );
  }
}
