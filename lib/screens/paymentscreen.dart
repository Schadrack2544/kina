import 'package:flutter/material.dart';

import '../utils/generalDrawer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text("Payment",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: const [],
      ),
      drawer: const GeneralDrawer(),
      body: Container(child: const Center(child: Text("Payment"))),
    );
  }
}
