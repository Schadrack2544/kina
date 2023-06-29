import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kina/screens/loginscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confpasswordController = TextEditingController();
  String? gender;
  bool showPass = false;
  bool showConf = false;
  final _formKey = GlobalKey<FormState>();
  RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      decoration:
                          const InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "First Name can not be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Last Name can not be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can not be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        focusColor: Colors.white,
                        hintText: "Enter your email address",
                        // hintStyle: TextStyle(color: Colors.pink),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink)),
                        suffixIcon: Icon(Icons.mail, color: Colors.pink),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email can not be empty";
                        } else if (!regExp.hasMatch(value)) {
                          return "Inavlid email address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(labelText: 'Age'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Age can not be empty";
                        }
                        return null;
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Gender:"),
                        RadioListTile(
                          title: const Text('Male'),
                          value: 'male',
                          groupValue: gender,
                          selected: true,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('Female'),
                          value: 'female',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPass = !showPass;
                                    });
                                  },
                                  icon: showPass
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off))),
                          obscureText: !showPass,
                        ),
                        TextFormField(
                            controller: confpasswordController,
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showConf = !showConf;
                                      });
                                    },
                                    icon: showConf
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off))),
                            obscureText: !showConf,
                            validator: (value) {
                              String pass = passwordController.text;
                              if (value != pass) {
                                return "Passwords do not match";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 16.0),
                        Column(
                          children: [
                            SizedBox(
                              width:double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Perform sign up logic here
                                  String firstName = firstNameController.text;
                                  String lastName = lastNameController.text;
                                  String username = usernameController.text;
                                  String email = emailController.text;
                                  String age = ageController.text;
                                  String gender = genderController.text;
                                  String password = passwordController.text;
                            
                                  // Add your sign up logic here
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    EasyLoading.show(status: "Please wait...");
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: email,
                                      password: password,
                                    )
                                        .then((value) {
                                          EasyLoading.dismiss(animation: true);
                                      if (value.user!.uid.isNotEmpty) {
                                        FirebaseFirestore.instance
                                            .collection("users")
                                            .doc(value.user!.uid)
                                            .set({
                                          "UserId": value.user!.uid,
                                          "FirstName": firstName,
                                          "LastName": lastName,
                                          "UserName": username,
                                          "UserEmail": email,
                                          "age": age,
                                          "gender": gender,
                                          "UserPassword": password,
                                        }).then((value) {
                                          EasyLoading.dismiss();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                "You have registered successfully."),
                                          ));
                                        });
                                      }
                                    }).onError((error, stackTrace) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  "Failed to sign user up: $error")));
                                    });
                                  }
                                },
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white, backgroundColor: Colors.pink, // Change the text color here
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0), // Change the border radius here
                                      ),
                                    ),
                                // style: //ButtonStyle(shape:const OutlinedBorder(side:BorderSide(style: BorderStyle.solid))),
                                child: const Text('Sign Up'),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Row(
                              children: [
                                const Text("Alread have an account?"),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  LoginScreen())));
                                    },
                                    child: const Text("Login"))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
