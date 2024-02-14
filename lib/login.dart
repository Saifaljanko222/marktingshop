import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:markting/Screens/screen_work.dart';

class login extends StatefulWidget {
  static const String screenRout = 'loging';
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool check = true;
  final TextEditingController Email = TextEditingController();
  final TextEditingController Password = TextEditingController();
  final _auth = FirebaseAuth.instance;
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
                "Hello..\nLog in!  ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 200.0),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: Email,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
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
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: Icon(Icons.visibility_off),
                            ),
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
                                  String textFieldemail = Email.text;
                                  String textFieldpassword = Password.text;
                                  try {
                                    final newUser =
                                        await _auth.signInWithEmailAndPassword(
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
                                          title: Text('Error'),
                                          content:
                                              Text('this email not existe'),
                                          actions: [
                                            TextButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                minWidth: double.infinity,
                                height: 60,
                                child: Text(
                                  'Login ',
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
              ))
        ],
      ),
    );
  }
}
