import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:markting/Screens/screen_work.dart';

import 'Component/textfield.dart';

class register extends StatefulWidget {
  const register({super.key});
  static const String screenRout = 'register';

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Password = TextEditingController();
  bool check = true;
  CollectionReference keysuser =
      FirebaseFirestore.instance.collection('DATACLIENT');
  final _auth = FirebaseAuth.instance;

  Future<void> addUser(String name, String numberphone, String address) {
    // Call the user's CollectionReference to add a new user
    Map<String, dynamic> userData = {
      'name': name,
      'numberphone': numberphone,
      'address': address,
      'location': GeoPoint(0, 0), // Set the initial location to (0, 0)
    };
    return keysuser
        .add(userData)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(65, 58, 251, 0.779),
              Color.fromRGBO(143, 140, 251, 22),
            ])),
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                "Hello..\nRegiter!  ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        textfieldwidget(
                            text: 'Name Client',
                            Icont: Icons.account_circle,
                            controller: controller1),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        textfieldwidget(
                            text: 'Phone Number',
                            Icont: Icons.numbers,
                            controller: controller2),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        textfieldwidget(
                            text: 'Address',
                            Icont: Icons.description,
                            controller: controller3),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        TextField(
                          controller: Email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              label: Text(
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(65, 58, 251, 0.779),
                                ),
                              )),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        TextField(
                          controller: Password,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              label: Text(
                                'Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(65, 58, 251, 0.779),
                                ),
                              )),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 140, 251, 1),
                                Color.fromRGBO(143, 140, 251, 22)
                              ]),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(158, 155, 248, 1),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ],
                            ),
                            child: Center(
                              child: MaterialButton(
                                  onPressed: () async {
                                    String textFieldName = controller1.text;
                                    String textFieldNumber = controller2.text;
                                    String textFieldAdress = controller3.text;
                                    String textFieldemail = Email.text;
                                    String textFieldpassword = Password.text;
                                    addUser(textFieldName, textFieldNumber,
                                        textFieldAdress);
                                    // FirebaseFirestore.instance
                                    //     .collection('INFODATA')
                                    //     .get()
                                    //     .then((QuerySnapshot querySnapshot) {
                                    //   querySnapshot.docs.forEach((doc) {
                                    //     print(doc["DATA"]);
                                    //   });
                                    // });
                                    try {
                                      final newUser = await _auth
                                          .createUserWithEmailAndPassword(
                                              email: textFieldemail,
                                              password: textFieldpassword);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenWork()));
                                    } catch (e) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Color.fromRGBO(
                                                143, 140, 251, 22),
                                            title: Text(
                                              'Error',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            content: Text(
                                              'PLEAS INPUT DATA cLIENT',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                    // try {
                                    //   final credential = await FirebaseAuth
                                    //       .instance
                                    //       .createUserWithEmailAndPassword(
                                    //     email: textFieldemail,
                                    //     password: textFieldpassword,
                                    //   );
                                    // } on FirebaseAuthException catch (e) {
                                    //   if (e.code == 'weak-password') {
                                    //     print(
                                    //         'The password provided is too weak.');
                                    //   } else if (e.code ==
                                    //       'email-already-in-use') {
                                    //     print(
                                    //         'The account already exists for that email.');
                                    //   }
                                    // } catch (e) {
                                    //   print(e);
                                    // }
                                    // FirebaseAuth.instance
                                    //     .createUserWithEmailAndPassword(
                                    //         email: textFieldemail,
                                    //         password: textFieldpassword)
                                    //     .then((value) => {
                                    //           Navigator.push(
                                    //               context,
                                    //               MaterialPageRoute(
                                    //                   builder: (context) =>
                                    //                       shop()))
                                    //         });
                                  },
                                  minWidth: double.infinity,
                                  height: 60,
                                  child: Text(
                                    'Save Data ',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
