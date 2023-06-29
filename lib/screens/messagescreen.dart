import 'package:flutter/material.dart';

import '../utils/generalDrawer.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text("Messages",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: const [
        ],
      
      ),
      drawer:const GeneralDrawer(),
      body: Container(
         child:const Center(
          child:Text("Messages")
        )
      ),
    );
 
  }
}
