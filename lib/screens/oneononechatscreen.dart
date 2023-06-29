import 'package:flutter/material.dart';

import '../utils/generalDrawer.dart';

class OneOnOneChatScreen extends StatefulWidget {
  const OneOnOneChatScreen({super.key});

  @override
  State<OneOnOneChatScreen> createState() => _OneOnOneChatScreenState();
}

class _OneOnOneChatScreenState extends State<OneOnOneChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text("Chats",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: const [
        ],
      
      ),
      drawer:const GeneralDrawer(),
      body: Container(
         child:const Center(
          child:Text("Chats")
        )
      ),
    );
  }
}