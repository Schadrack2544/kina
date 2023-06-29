import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kina/screens/loginscreen.dart';
import '../screens/friendscreen.dart';
import '../screens/gamescreen.dart';
import '../screens/messagescreen.dart';
import '../screens/notificationscreen.dart';
import '../screens/paymentscreen.dart';
import '../screens/faqscreen.dart';

class GeneralDrawer extends StatefulWidget {
  const GeneralDrawer({super.key});

  @override
  State<GeneralDrawer> createState() => _GeneralDrawerState();
}

class _GeneralDrawerState extends State<GeneralDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: const Color.fromARGB(255, 207, 203, 203),
      elevation: 0.0,
      child: ListView(
        children: <Widget>[
          Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 233, 30, 99),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2017/08/31/09/01/woman-2699801_1280.jpg',
                            )),
                        SizedBox(height: 20),
                        // CachedNetworkImage(
                        //   imageUrl:
                        //       'https://cdn.pixabay.com/photo/2017/08/31/09/01/woman-2699801_1280.jpg',
                        //   placeholder: (context, url) =>
                        //       CircularProgressIndicator(), // Optional
                        //   errorWidget: (context, url, error) =>
                        //       Icon(Icons.error), // Optional
                        // ),
                        Text("Schadrack Godson",
                            style: TextStyle(fontSize: 20, color: Colors.white))
                      ]),
                ))
          ]),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.black,
            leading: const Icon(Icons.games),
            title: const Text("Games"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const GameScreen()));
            },
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.black,
            leading: const Icon(Icons.people),
            title: const Text("Friends"),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const FriendScreen()));
            },
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.black,
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NotificationScreen()));
            },
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.black,
            leading: const Icon(Icons.message),
            title: const Text("Messages"),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MessageScreen()));
            },
          ),
          // ListTile(
          //   textColor: Colors.black,
          //   iconColor: Colors.black,
          //   leading: const Icon(Icons.store),
          //   title: const Text("Store Locator"),
          //   onTap: () {},
          // ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.black,
            leading: const Icon(Icons.payment),
            title: const Text("Payment"),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const PaymentScreen()));
            },
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.black,
            leading: const Icon(Icons.help),
            title: const Text("FAQ"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const FaqScreen()));
            },
          ),
          // ListTile(
          //   textColor: Colors.black,
          //   iconColor: Colors.black,
          //   leading: const Icon(Icons.person),
          //   title: const Text("Got a question ?"),
          //   onTap: () {},
          // ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.black,
            leading: const Icon(Icons.close),
            title: const Text("Log out"),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                 ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text("User logged out")));
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }).onError((error, stackTrace) {
                ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("Failed to log user out: $error")));
              });
            },
          ),
        ],
      ),
    );
  }
}
