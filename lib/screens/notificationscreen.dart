import 'package:flutter/material.dart';

import '../utils/generalDrawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text("Notifications",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: const [
        ],
      
      ),
      drawer:const GeneralDrawer(),
      body: Container(
         child:const Center(
          child:Text("Notification")
        )
      ),
    );
 
  }
}
