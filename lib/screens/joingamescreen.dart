import 'package:flutter/material.dart';

class JoinGameScreen extends StatefulWidget {
  const JoinGameScreen({super.key});

  @override
  State<JoinGameScreen> createState() => _JoinGameScreenState();
}

class _JoinGameScreenState extends State<JoinGameScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        leading:IconButton(onPressed:(){

        }, icon:const Icon(Icons.arrow_back)),
      ),
      body:const Center(child:Text("Join Game")),
    );
  }
}