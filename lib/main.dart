import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// Import the generated file
import 'firebase_options.dart';
//import 'package:kina/screens/splashscreen.dart';

import 'screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DefaultFirebaseOptions dfo = DefaultFirebaseOptions();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: dfo.android.apiKey,
          appId: dfo.android.appId,
          messagingSenderId: dfo.android.messagingSenderId,
          projectId: dfo.android.projectId));

  runApp(
  //   MultiProvider(
  //   providers: [],
  //   child:
  // ),
   const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kina Mobile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const SplashScreen(),
      builder:EasyLoading.init() ,
    );
  }
}
